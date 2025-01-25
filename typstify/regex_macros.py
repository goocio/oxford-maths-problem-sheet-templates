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
        or line[:12] == r"\end{center}"
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
        or line[-14:] == r"\begin{center}"
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


arg_pattern = r"\s*(?:(\{\s*((?>[^{}]+?|(?1))*?)\s*\})|(\\[a-zA-Z]+)| ([a-zA-Z])|([^\s{}()a-zA-Z]))"


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
    string = typstifyArguments(r"\\frac", 2, r"(\2\3\4\5)/(\7\8\9\10)", string)
    string = typstifyArguments(r"\\dfrac", 2, r"display((\2\3\4\5)/(\7\8\9\10))", string)
    string = typstifyArguments(r"\\binom", 2, r"binom(\2\3\4\5, \7\8\9\10)", string)

    # macros with args having been replaced, it will never be correct to have <control word><number>
    string = regex.sub(r"(\\[a-zA-Z]+)(?=[0-9])", r"\1 ", string)

    ### 0-arg macros; needs to be after because it breaks arg pattern for control sequences to not start with \
    for latex_command, typst_command in sorted(macro_dict.items(), key=lambda item: len(item[0]), reverse=True):
        string = string.replace(latex_command, typst_command)

    return string


def typstifyMathMode(string):
    # In order to identify math mode we need to convert math delimiters first.
    for latex_delimiter, typst_delimiter in math_delimiters_dict.items():
        string = string.replace(latex_delimiter, typst_delimiter)

    # We also don't want to erroneously add spaces to strings:
    string = regex.sub(r"\\operatorname" + arg_pattern, r'\\op("\2\3\4")', string)
    string = regex.sub(r"\\text" + arg_pattern, r' "\2\3\4" ', string)

    # Now we identify the math mode sections:
    modes = regex.split(r"(?<!\\)\$(.*?)(?<!\\)\$", string, flags=regex.DOTALL)
    # odd groups are math and need spacing and / and ~ handled, even groups are text and need backticks handled
    return r"$".join(
        [
            (
                addSpacesToConsecutiveLetters(modes[i]).replace("/", " slash ").replace("~", " space.nobreak ")
                if i % 2
                else modes[i].replace("``", '"').replace("`", "'")
            )
            for i in range(len(modes))
        ]
    )


def addSpacesToConsecutiveLetters(string):
    # if quotes are properly matched, being inside quotes is the same as being followed by an even number of quotes
    consecutive_letter_pattern = r'((?<=^|[^\\])\b[a-zA-Z0-9]{2,}\b(?=(?:[^"]*"[^"]*")*[^"]*$))'
    groupings = regex.split(consecutive_letter_pattern, string)
    # every odd index is a sequence of consecutive letters that need to be spaced out for typst math mode to work
    return "".join([" ".join(groupings[i]) if i % 2 else groupings[i] for i in range(len(groupings))])


def typstifyRemaining(string):
    string = regex.sub(r"\\(?:question|part|subpart)%([a-zA-Z0-9]+)\b.*\s+", r"+ /* \1 */ ", string)
    string = regex.sub(r"(\n\s*)%", r"\1//", string)
    return regex.sub(r"(\\[a-zA-Z]+|\\[^a-zA-Z\s])", r'#panic("typstify missed this macro:")\1', string)
