import regex
from macro_dictionaries import macro_dict, single_arg_macro_dict, math_delimiters_dict


def captureInsideBraces(line):
    searched = regex.search(r"\{(.+?)\}", line)
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
        or line[:13] == r"\end{itemize}"
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
        or line[-15:] == r"\begin{itemize}"
    )


# LaTeX and Typst array syntax is incompatible so I update it manually before anything else can mess it up;
# also I leave them with the latex names and prefixed with a backslash so that typstifyMathMode doesn't
# add erroneous spaces, and this is then tidied up along with the routine substitutions by macro_dict
def typstifyArraySyntax(string):
    # `cases` environment substitutions (typst cases has different syntax to all the other ones ???)
    string = regex.sub(
        r"\\begin\{cases\}(.*?)\\end\{cases\}",
        lambda match: r"\cases("
        + match.group(1).replace(",", r"\comma ").replace(";", r"\semi ").replace("&", r" \quad&").replace(r"\\", ",")
        + ")",
        string,
        flags=regex.DOTALL,
    )

    # all other environments
    array_environments = r"\{(matrix|pmatrix|bmatrix|vmatrix)\}"
    return regex.sub(
        r"\\begin" + array_environments + r"(.*?)\\end" + array_environments,
        lambda match: "\\"
        + match.group(1)
        + "("
        + match.group(2).replace(",", r"\,").replace(";", r"\;").replace("&", r",").replace(r"\\", ";")
        + ")",
        string,
        flags=regex.DOTALL,
    )


r"""
ARG STRUCTURE
macros can be called as: `\foo5`, `\foo\somemacro`, or `\foo{stuff}`, or any of those with spaces in.
In the case of the last one, there might be further nested macros with arguments, so I'm using the
recursive regex option from the `regex` package (not available with usual `re` package). As such,
these ones must be substituted repeatedly until no further changes occur.

While it's only the nested ones which need to be repeatedly substituted, unfortunately we need to use
the full arg_pattern in the loop (as opposed to being able to split it into the scope version and the
single token version and only loop the scope version), since if we don't have the pattern encompass
any argument syntax, macros with multiple arguments but given in different syntax would fail to
match, e.g. `\frac{2\pi}3`. Luckily though it doesn't matter much since we can just put the scope
pattern first so if there's lots of nested scoping it won't be wasting a check for the non-scoped
ones each time.

Also, in arg_pattern, there are a few \s* tags to remove excess whitespace, but the last won't work
unless we have non-greedy markers on the scoped pattern, which is fine, but if you look you'll see
there are *two* non-greedy markers; for some reason it doesn't work with only one or the other, even
if the possessive lookahead ?> is replaced with a regular capturing lookahead ?:
"""
arg_pattern = r"\s*(?:(\{\s*((?>[^{}]+?|(?1))*?)\s*\})|(\\[a-zA-Z]+)|([^\s{}()]))"


def typstifyArguments(latex_macro, args, typst_pattern, string):
    macro_pattern = latex_macro + args * arg_pattern
    while True:
        temp = regex.sub(macro_pattern, typst_pattern, string)
        if temp == string:
            break
        string = temp

    return string


def typstifyMacros(string):
    # Put a space e.g. in "thing\sqrt{10}" -> "thing \sqrt{10}"
    string = regex.sub(r"([a-zA-Z0-9])(?=\\[a-zA-Z]+)", r"\1 ", string)

    # 1-arg macros
    for latex_macro, typst_pattern in single_arg_macro_dict.items():
        string = typstifyArguments(latex_macro, 1, typst_pattern, string)

    # 2-arg macros
    string = typstifyArguments(r"\\frac", 2, r"(\2\3\4)/(\6\7\8)", string)
    string = typstifyArguments(r"\\dfrac", 2, r"display((\2\3\4)/(\6\7\8))", string)

    # macros with args having been replaced, it will never be correct to have <control word><number>
    string = regex.sub(r"(\\[a-zA-Z]+)(?=[0-9])", r"\1 ", string)

    ### 0-arg macros; needs to be after because it breaks arg pattern for control sequences to not start with \
    r"""
    Instead of simply enumerating over the regular dictionary items, I need to enumerate over
    the items sorted by decreasing key (control sequence) length, since latex macros are not
    a prefix code, e.g. if `\foo` were supposed to be replaced with `thing` and `\foobar` were
    supposed to be replaced with `stuff`, if I had them in that order in the dictionary, when
    enumerating it would end up scanning through the string and replacing `foo` instances
    *first*. This means e.g. a string "abc\foobar abc" wouldn't become the intended "abcstuff
    abc" but instead "abc\thingbar abc". To avoid this, we could default to regex.sub with a
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
    string = regex.sub(r"\\operatorname(?: (\w)|\{([^}]+)\})", r'\\op("\1\2")', string)
    string = regex.sub(r"\\text\{\s*(.*?)\s*\}", r' "\1" ', string)

    # Now we identify the math mode sections,
    modes = regex.split(r"(?<!\\)\$(.*?)(?<!\\)\$", string, flags=regex.DOTALL)
    result = []
    for i in range(0, len(modes)):
        if i % 2:  # and when in math mode,
            modes[i] = addSpacesToConsecutiveLetters(modes[i])  # fix spacing.
        result.append(modes[i])
    return r"$".join(result)


def addSpacesToConsecutiveLetters(string):
    consecutive_letter_pattern = r'(?<![\\"])\b[a-zA-Z0-9]{2,}\b'
    result = []
    for consecutive_letters in regex.split(f"({consecutive_letter_pattern})", string):
        if regex.match(consecutive_letter_pattern, consecutive_letters):
            consecutive_letters = " ".join(consecutive_letters)
        result.append(consecutive_letters)
    return "".join(result)


def typstifyQuestions(string):
    return regex.sub(r"\\(?:question|part|subpart)%([a-zA-Z0-9]+)\b.*\s+", r"+ /* \1 */ ", string)
