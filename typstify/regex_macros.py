import re
from collections import Counter
from macro_dictionaries import macro_dict, math_environments_dict


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


# LaTeX abd Typst cases formats are incompatible so I update it manually before anything else can mess it up
def casesFormatting(string):
    return re.sub(
        r"\\begin\{cases\}(.*?)\\end\{cases\}",
        lambda match: r"\cases("
        + match.group(1).replace(",", r"\,").replace(";", r"\;").replace("&", r" \quad&").replace(r"\\", ",")
        + ")",
        string,
        flags=re.DOTALL,
    )


single_arg_pattern = r"(?: ?(\w)|\{([^}]+)\}| ?(\\[a-zA-Z]+))"


def substituteSingleArgMacro(string, latex, typst):
    return re.sub(r"\\" + latex + single_arg_pattern, typst + r"(\1\2\3)", string)


def typstifyMacros(string):
    # Put a space e.g. in "thing\sqrt{10}" -> "thing \sqrt{10}"
    string = re.sub(r"([a-zA-Z0-9])(?=\\[a-zA-Z]+)", r"\1 ", string)

    # 1-arg macros
    string = re.sub(r"\\section\{(.*?)\}", r"= \1", string)
    for pair in [
        (r"mathbf", r"mb"),
        (r"mathbb", r"bb"),
        (r"boldsymbol", r"bold"),
        (r"mathcal", r"cal"),
        (r"mathfrak", r"frak"),
        (r"mathrm", r"rm"),
        (r"sqrt", r"sqrt"),
        (r"overline", r"overline"),
        (r"widehat", r"hat"),
        (r"hat", r"hat"),
        (r"vec", r"arrow"),
        (r"abs", r"abs"),
    ]:
        string = substituteSingleArgMacro(string, pair[0], pair[1])

    # 2-arg macros
    # replace \frac__ with (_)/(_), ditto with \dfrac
    string = re.sub(r"\\frac" + 2 * single_arg_pattern, r"(\1\2\3)/(\4\5\6)", string)
    string = re.sub(r"\\dfrac" + 2 * single_arg_pattern, r"display((\1\2\3)/(\4\5\6))", string)
    # replace _{} with _() and ^{} with ^()
    string = re.sub(r"(_|\^)\{([^}]*[^\\])\}", r"\1(\2)", string)
    # replace \emph with _ _
    string = re.sub(r"\\emph\{\s*(.*?[^\\]+)\s*\}", r"_\1_", string)
    # replace \textbf_ with *_*
    string = re.sub(r"\\textbf\{\s*(.*?)\s*\}", r"*\1*", string)

    # 0-arg macros; needs to be after because it breaks single_arg_pattern
    for key, value in macro_dict.items():
        string = string.replace(key, value)

    return string


def typstifyMathMode(string):
    # In order to identify math mode we need to convert some macros first.
    for key, value in math_environments_dict.items():
        string = string.replace(key, value)

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
