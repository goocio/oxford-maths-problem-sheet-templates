import sys
from regex_macros import (
    captureInsideBraces,
    environmentBegun,
    environmentEnded,
    typstifyArraySyntax,
    typstifyMacros,
    typstifyMathMode,
    typstifyRemaining,
)


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
        elif line[0:13] == r"\graphicspath":
            typ_preamble.append('#panic("Watch out! There are images in this file")')
        else:
            filtered_tex.append(line.strip())

    return (filtered_tex, "\n".join(typ_preamble + ["\n"]))


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
    string = "\n".join(lines)
    string = typstifyArraySyntax(string)
    string = typstifyMathMode(string)
    string = typstifyMacros(string)
    return typstifyRemaining(string).strip()


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
