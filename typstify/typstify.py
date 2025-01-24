import sys
from regex_macros import (
    captureInsideBraces,
    environmentBegun,
    environmentEnded,
    typstifyArraySyntax,
    typstifyMacros,
    typstifyMathMode,
    typstifyQuestions,
)

r"""
KNOWN ISSUES
- tabular, tabularx, array, and any other environments which take an extra argument
  currently have no way of being handled
- currently \left and \right are simply removed, but this doesn't account for \left. and
  \right. e.g. in `\left.\frac{\mathrm dy}{\mathrm dx}\right|_{x=a}`, which in typst
  should be `lr(zwj (dif y)/(dif x) |)_(x=a)` (note that aside from this, `lr` should
  almost never be needed, since typst applies \left and \right automatically, since it
  isn't 50 years old like tex)
- certain tex-style (i.e. *not* latex-style) macros are very very hard to parse/convert,
  such as `\limits` and `\displaystyle`, due to their tex-style scoping, so they're
  currently simply replaced with nothing
- need to implement conversion of `\verb|...|`, similar issue to with tex-style macros
  since its scoping isn't done like `\macro{arg}`
- plausibly itemize could have indentation issues after conversion, though this hasn't
  come up yet
"""

"""
GENERAL FLOW
- Load .tex file and filter out its preamble, using it to fill in the associated .typ
  preamble, via `filterPreamble`. The .typ preamble is returned, along with the remaining
  lines of the .tex file for further processing.
- The next processing is done by `fixIndentation`, which updates the indentation based on
  question layout and environments, as described in multiline comment INDENTATION.
  - This tracks indentation using begin and end blocks, with a mechanism for "storing"
    indentation that should take effect on the *next* line rather than the current one.
- Then the processing moves on to making it typst-compatible, in `typstify`:
  - `typstifyArraySyntax` updates math array-like environment to typst's syntax, since
    it's incompatible with latex's. In latex, all array-like environments have ampersand
    to separate entries, and a double backslash to separate lines. In typst it's a comma
    to separate entries, and a semi-colon to separate lines; except for the `cases`
    environment (ironically), which has `quad&` to separate entries (??? one of the few
    bad design choices in typst) and a comma to separate lines.
  - `typstifyMathMode` makes a preliminary pass over macro substitutions, in order to
    make it clear to the parser what is and isn't math mode (see multiline comment MACRO
    REPLACEMENT). It then uses this to space out math symbols as Typst requires.
  - `typstifyMacros` finishes the macro substitutions and corrects for the temporary
    intermediary substitutions made by `typstifyMathMode`.
  - Finally `typstifyQuestions` polishes up the question formatting/layout.
"""


# Clear the .tex preamble and set that of .typ; send the rest of .tex to tex_file_lines for further formatting
def filterPreamble(tex_file):
    filtered_tex = []
    typ_preamble = [
        '#set text(size: 10pt, font: "New Computer Modern")',
        "#set par(justify: true)",
        "#set enum(numbering: n => [*(#n)*])",
        '#let parts(body) = {set enum(numbering: n => strong(numbering("(a)",n))); body}',
        '#let subparts(body) = {set enum(numbering: n => strong(numbering("(i)",n))); body}',
        "#let solution(body) = block(",
        '\tstroke: 1pt + rgb(40, 40, 40, 200), radius: 1pt, width: 100%, inset: 1em, strong("Solution:") + v(0pt) + body',
        ")",
        "#let mb(body) = math.upright(math.bold(body))",
        # '#let scr(body) = text(font: "New Computer Modern Math Book", stylistic-set: 1, $cal(body)$)',
        "",
    ]

    for line in tex_file.readlines():
        if (
            (line[0:14] == r"\documentclass")
            or (line[0:11] == r"\usepackage")
            or (line[0:10] == r"\maketitle")
            or (line[0:16] == r"\begin{document}")
            or (line[0:14] == r"\end{document}")
        ):
            continue
        elif line[0:6] == r"\title":
            typ_preamble.append("#align(center, text(1.75em)[" + captureInsideBraces(line).replace(r"\\", r"\ ") + "])")
        elif line[0:7] == r"\author":
            typ_preamble.append("#align(center, text(1.4em)[" + captureInsideBraces(line) + "])")
        elif line[0:5] == r"\date":
            typ_preamble.append("#align(center, text(1.2em)[" + captureInsideBraces(line) + "])")
        else:
            filtered_tex.append(line.strip())

    return (filtered_tex, "\n".join(typ_preamble + ["\n"]))


"""
INDENTATION:
The indentation is rather complicated, as the starting of a multiline environment on one line
should adjust the indent starting from the *next* line (see `shift` variable). Here is a fairly
minimal example, with only the base question/part/subpart layout and no further environments:
+ ...
  ...
  #parts[
    + ...
      ...

    + ...
      #subparts[
        + ...

        + ...
          ...
      ]

    + ...
  ]

+ ...
"""


def fixIndentation(lines):
    indent_level = 1
    reading_questions = False  # We only want this formatting when we're scanning over the questions

    # Count how many times the current line should be indented (see multiline comment INDENTATION)
    def measureIndentation(line):
        nonlocal reading_questions, indent_level
        if not reading_questions:
            reading_questions = line == r"\begin{questions}"
            return 0

        shift = 0  # Temporary reduction in indent if the change should come into effect *next* line
        match line.strip():
            case "\\end{questions}":
                reading_questions = False
                return 0
            case "\\end{parts}":
                indent_level = 1
            case "\\end{subparts}":
                indent_level = 3
            case "\\begin{parts}":
                indent_level = 3
                shift = -2
            case "\\begin{subparts}":
                indent_level = 5
                shift = -2

        indent_level -= environmentEnded(line)
        if environmentBegun(line):
            indent_level += 1
            shift = -1
        if (line[0:9] == r"\question") or (line[0:5] == r"\part") or (line[0:8] == r"\subpart"):
            shift = -1

        return indent_level + shift

    return [measureIndentation(line) * "\t" + line for line in lines]


def typstify(lines):
    lines = [(line.replace(r"%", r"//") if (len(line) != 0) and (line[0] == r"%") else line) for line in lines]
    string = "\n".join(lines)
    string = string.replace("~", "")
    string = typstifyArraySyntax(string)
    """
    MACRO REPLACEMENT
    The ordering of the various macro replacement commands is slightly finnicky. We can't simply
    use just the one dictionary of macros to replace from, because of how latex is able to start
    and end math mode without using dollar signs via various environments. In order to fix the
    math mode spacing to work in typst (i.e. `$ab$` -> `$a b$` etc) we of course need to know when
    we're in math mode, and so we can't run it *before* all the macro conversions. However, we also
    can't run it *after* all the macro conversions, since any macros still left in math mode
    (such as `op` or `sin`) would be mis-identified as sequences of letters rather than macros and
    would hence be given spaces between their letters erroneously. Therefore we convert only the
    macros which delimit math mode (and also math mode macros with text arguments), then sort out
    the math mode spacing, then convert the rest of the macros.

    Moreover, environments in math mode would have their names spaced erroneously, so we substitute
    these out early along with math mode delimiters in typstifyArraySyntax. This is done by first
    converting them to an intermediary fake control sequence and then adding this control sequence
    to macro_dict so the substitution is finished in the second pass, by typstifyMacros.
    """
    string = typstifyMathMode(string)
    string = typstifyMacros(string)
    return typstifyQuestions(string).strip()


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Run in the format: python3 typstify.py FILENAME.tex")
        sys.exit(1)

    tex_file_name = sys.argv[1]

    with open(tex_file_name, "r") as tex_file:
        (tex_file_lines, typ_file_lines) = filterPreamble(tex_file)
        tex_file_lines = fixIndentation(tex_file_lines)

    with open(tex_file_name[0:-4] + ".typ", "x") as typ_file:
        typ_file.write(typ_file_lines + typstify(tex_file_lines))
