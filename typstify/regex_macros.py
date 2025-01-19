import re
from macro_dictionaries import macro_dict, single_arg_macro_dict, math_delimiters_dict


def captureInsideBraces(line):
    searched = re.search(r"\{(.+?)\}", line)
    if searched:
        return searched.group(1)
    return ""


# Does that line contain the end of any environments which affect indentation?
def environmentEnded(line):
    return (
        line[:2] == r"\]"
        or line[:11] == r"\end{cases}"
        or line[:13] == r"\end{aligned}"
        or line[:14] == r"\end{aligned*}"
        or line[:11] == r"\end{align}"
        or line[:12] == r"\end{align*}"
        or line[:12] == r"\end{gather}"
        or line[:13] == r"\end{gather*}"
        # or line[:11] == r"\end{array}"
        or line[:12] == r"\end{matrix}"
        or line[:13] == r"\end{pmatrix}"
        or line[:13] == r"\end{bmatrix}"
        or line[:13] == r"\end{vmatrix}"
        # or line[:13] == r"\end{tabular}"
        # or line[:14] == r"\end{tabularx}"
        or line[:14] == r"\end{verbatim}"
    )


# Does that line contain the beginning of any environments which affect indentation?
def environmentBegun(line):
    return (
        line[-2:] == r"\["
        or line[-13:] == r"\begin{cases}"
        or line[-15:] == r"\begin{aligned}"
        or line[-16:] == r"\begin{aligned*}"
        or line[-13:] == r"\begin{align}"
        or line[-14:] == r"\begin{align*}"
        or line[-14:] == r"\begin{gather}"
        or line[-15:] == r"\begin{gather*}"
        # or line[-13:] == r"\begin{array}"
        or line[-14:] == r"\begin{matrix}"
        or line[-15:] == r"\begin{pmatrix}"
        or line[-15:] == r"\begin{bmatrix}"
        or line[-15:] == r"\begin{vmatrix}"
        # or line[-15:] == r"\begin{tabular}"
        # or line[-16:] == r"\begin{tabularx}"
        or line[-16:] == r"\begin{verbatim}"
    )


# LaTeX and Typst array syntax is incompatible so I update it manually before anything else can mess it up;
# also I leave them with the latex names and prefixed with a backslash so that typstifyMathMode doesn't
# add erroneous spaces, and this is then tidied up along with the routine substitutions by macro_dict
def typstifyArraySyntax(string):
    # `cases` environment substitutions (typst cases has different syntax to all the other ones ???)
    string = re.sub(
        r"\\begin\{cases\}(.*?)\\end\{cases\}",
        lambda match: r"\cases("
        + match.group(1).replace(",", r"\,").replace(";", r"\;").replace("&", r" \quad&").replace(r"\\", ",")
        + ")",
        string,
        flags=re.DOTALL,
    )

    # all other environments
    array_environments = r"\{(matrix|pmatrix|bmatrix|vmatrix)\}"
    return re.sub(
        r"\\begin" + array_environments + r"(.*?)\\end" + array_environments,
        lambda match: "\\"
        + match.group(1)
        + "("
        + match.group(2).replace(",", r"\,").replace(";", r"\;").replace("&", r",").replace(r"\\", ";")
        + ")",
        string,
        flags=re.DOTALL,
    )


single_arg_pattern = r"(?: ?(\w)|\{([^}]+)\}| ?(\\[a-zA-Z]+))"


def typstifyMacros(string):
    # Put a space e.g. in "thing\sqrt{10}" -> "thing \sqrt{10}"
    string = re.sub(r"([a-zA-Z0-9])(?=\\[a-zA-Z]+)", r"\1 ", string)

    ### 1-arg macros
    # replace _{} with _() and ^{} with ^()
    string = re.sub(r"(_|\^)\{([^}]*[^\\])\}", r"\1(\2)", string)
    # some others whose pattern is an exception to the rule
    string = re.sub(r"\\emph\{\s*(.*?[^\\]+)\s*\}", r"_\1_", string)
    string = re.sub(r"\\textbf\{\s*(.*?)\s*\}", r"*\1*", string)
    string = re.sub(r"\\pmod" + single_arg_pattern, r"(mod \1\2\3)", string)
    string = re.sub(r"\\section\{(.*?)\}", r"= \1", string)
    # generic macros
    for latex_command, typst_command in single_arg_macro_dict.items():
        string = re.sub(r"\\" + latex_command + single_arg_pattern, typst_command + r"(\1\2\3)", string)

    ### 2-arg macros
    # replace \frac__ with (_)/(_), ditto with \dfrac
    string = re.sub(r"\\frac" + 2 * single_arg_pattern, r"(\1\2\3)/(\4\5\6)", string)
    string = re.sub(r"\\dfrac" + 2 * single_arg_pattern, r"display((\1\2\3)/(\4\5\6))", string)

    # macros with args having been replaced, it will never be correct to have <control word><number>
    string = re.sub(r"(\\[a-zA-Z]+)(?=[0-9])", r"\1 ", string)

    ### 0-arg macros; needs to be after because it breaks single_arg_pattern
    r"""
    Instead of simply enumerating over the regular dictionary items, I need to enumerate over
    the items sorted by decreasing key (control sequence) length, since latex macros are not
    a prefix code, e.g. if `\foo` were supposed to be replaced with `thing` and `\foobar` were
    supposed to be replaced with `stuff`, if I had them in that order in the dictionary, when
    enumerating it would end up scanning through the string and replacing `foo` instances
    *first*. This means e.g. a string "abc\foobar abc" wouldn't become the intended "abcstuff
    abc" but instead "abc\thingbar abc". To avoid this, we could default to re.sub with a
    greedy regex to ensure a full control sequence is captured at a time, or instead we could
    sort the substitutions in order of decreasing control sequence length. I've opted for the
    latter since the former would require accounting not only for how control sequences can be
    either control *characters* (e.g. `\[` or `\]`) or control *words* (e.g. `\alpha`) but
    also for the various environments currently being replaced by the dictionary.

    This issue doesn't apply to single_arg_macro_dict since that is using a regex already.
    """
    for latex_command, typst_command in sorted(macro_dict.items(), key=lambda item: len(item[0]), reverse=True):
        string = string.replace(latex_command, typst_command)

    return string


def typstifyMathMode(string):
    # In order to identify math mode we need to convert math delimiters first.
    for latex_delimiter, typst_delimiter in math_delimiters_dict.items():
        string = string.replace(latex_delimiter, typst_delimiter)

    # We also don't want to erroneously add spaces to strings:
    # Replace \operatorname_ with \op("_") intermediary for op("_")
    string = re.sub(r"\\operatorname(?: (\w)|\{([^}]+)\})", r'\\op("\1\2")', string)
    # Replace \text_ with "_"
    string = re.sub(r"\\text\{\s*(.*?)\s*\}", r' "\1" ', string)

    # Now we identify the math mode sections,
    modes = re.split(r"(?<!\\)\$(.*?)(?<!\\)\$", string, flags=re.DOTALL)
    result = []
    for i in range(0, len(modes)):
        if i % 2:  # and when in math mode,
            modes[i] = addSpacesToConsecutiveLetters(modes[i])  # fix spacing.
        result.append(modes[i])
    return r"$".join(result)


def addSpacesToConsecutiveLetters(string):
    consecutive_letter_pattern = r'(?<![\\"])\b[a-zA-Z0-9]{2,}\b'
    result = []
    for consecutive_letters in re.split(f"({consecutive_letter_pattern})", string):
        if re.match(consecutive_letter_pattern, consecutive_letters):
            consecutive_letters = " ".join(consecutive_letters)
        result.append(consecutive_letters)
    return "".join(result)


def typstifyQuestions(string):
    return re.sub(r"\\(?:question|part|subpart)%([a-zA-Z0-9]+)\b.*\s+", r"+ /* \1 */ ", string)
