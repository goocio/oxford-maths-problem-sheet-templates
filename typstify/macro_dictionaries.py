macro_dict = {
    r"\relax": r"",
    r"\hline": r"",
    # see KNOWN ISSUES comment in typstify.py
    # r"\displaystyle": r"",
    # r"\textstyle": r"",
    # r"\scriptstyle": r"",
    # r"\scriptscriptstyle": r"",
    # r"\limits": r"",
    # letters
    r"\AA": r"circle(A)",
    r"\ell": r"ell",
    r"\aleph": r"aleph",
    r"\alpha": r"alpha",
    r"\beta": r"beta",
    r"\gamma": r"gamma",
    r"\delta": r"delta",
    r"\epsilon": r"epsilon",
    r"\varepsilon": r"epsilon",
    r"\zeta": r"zeta",
    r"\eta": r"eta",
    r"\theta": r"theta",
    r"\vartheta": r"theta.alt",
    r"\iota": r"iota",
    r"\kappa": r"kappa",
    r"\lambda": r"lambda",
    r"\mu": r"mu",
    r"\nu": r"nu",
    r"\xi": r"xi",
    r"\pi": r"pi",
    r"\varpi": r"pi.alt",
    r"\rho": r"rho",
    r"\varrho": r"rho.alt",
    r"\sigma": r"sigma",
    r"\varsigma": r"sigma.alt",
    r"\tau": r"tau",
    r"\upsilon": r"upsilon",
    r"\phi": r"phi.alt",
    r"\varphi": r"phi",
    r"\chi": r"chi",
    r"\psi": r"psi",
    r"\omega": r"omega",
    r"\Gamma": r"Gamma",
    r"\Delta": r"Delta",
    r"\Theta": r"Theta",
    r"\Lambda": r"Lambda",
    r"\Xi": r"Xi",
    r"\Pi": r"Pi",
    r"\Sigma": r"Sigma",
    r"\Upsilon": r"Upsilon",
    r"\Phi": r"Phi",
    r"\Psi": r"Psi",
    r"\Omega": r"Omega",
    # set symbols
    r"\in": r"in",
    r"\ni": r"in.rev",
    r"\notin": r"in.not",
    r"\cap": r"inter",
    r"\cup": r"union",
    r"\bigcap": r"inter.big",
    r"\bigcup": r"union.big",
    r"\sqcap": r"inter.sq",
    r"\sqcup": r"union.sq",
    r"\setminus": r"without",
    r"\subset": r"subset",
    r"\supset": r"supset",
    r"\subseteq": r"subset.eq",
    r"\supseteq": r"supset.eq",
    r"\subsetneq": r"subset.neq",
    r"\supsetneq": r"supset.neq",
    r"\nsubseteq": r"subset.eq.not",
    r"\nsupseteq": r"supset.eq.not",
    r"\emptyset": r"diameter",
    r"\varnothing": r"diameter",
    # calculus / analysis
    r"\dd": "dif",
    r"\min": r"min",
    r"\max": r"max",
    r"\argmin": r"argmin",
    r"\argmax": r"argmax",
    r"\lim": r"lim",
    r"\sup": r"sup",
    r"\inf": r"inf",
    r"\limsup": r"limsup",
    r"\liminf": r"liminf",
    r"\nabla": r"nabla",
    r"\partial": r"partial",
    r"\int": r"integral",
    r"\oint": r"integral.cont",
    r"\iint": r"integral.double",
    r"\iiint": r"integral.triple",
    r"upright(d)": r"dif",
    # algebra
    r"\det": r"det",
    r"\ker": r"ker",
    r"\gcd": r'math.op("gcd")',
    r"\mod": r"quad mod",
    r"\bmod": r"mod",
    # logic
    r"\forall": r"forall",
    r"\exists": r"exists",
    r"\nexists": r"exists.not",
    r"\land": r"and",
    r"\wedge": r"and",
    r"\lor": r"or",
    r"\vee": r"or",
    r"\lnot": r"not",
    r"\top": r"top",
    r"\bot": r"bot",
    r"\parallel": r"parallel",
    r"\perp": r"perp",
    r"\models": r"models",
    r"\vdash": r"tack",
    r"\nvdash": r"tack.not",
    r"\vDash": r"tack.double",
    r"\nvDash": r"tack.double.not",
    r"\Vdash": r"forces",
    r"\nVdash": r"forces.not",
    # functions
    r"\arg": r"arg",
    r"\Re": r"Re",
    r"\Im": r"Im",
    r"\log": r"log",
    r"\ln": r"ln",
    r"\exp": r"exp",
    r"\sin": r"sin",
    r"\cos": r"cos",
    r"\tan": r"tan",
    r"\sec": r"sec",
    r"\csc": r"csc",
    r"\cot": r"cot",
    r"\sinh": r"sinh",
    r"\cosh": r"cosh",
    r"\tanh": r"tanh",
    r"\sech": r"sech",
    r"\csch": r"csch",
    r"\coth": r"coth",
    r"\arcsin": r"arcsin",
    r"\arccos": r"arccos",
    r"\arctan": r"arctan",
    r"\arcsec": r"arcsec",
    r"\arccsc": r"arccsc",
    r"\arccot": r"arccot",
    r"\arsinh": r"arsinh",
    r"\arcosh": r"arcosh",
    r"\artanh": r"artanh",
    r"\arsech": r"arsech",
    r"\arcsch": r"arcsch",
    r"\arcoth": r"arcoth",
    # relations
    r"\prec": r"prec",
    r"\succ": r"succ",
    r"\approx": r"approx",
    r"\neq": r"!=",
    r"\leq": r"<=",
    r"\geq": r">=",
    r"\ll": r"<<",
    r"\gg": r">>",
    r"\coloneqq": r":=",
    r"\equiv": r"equiv",
    r"\cong": r"tilde.equiv",
    r"\leqslant": r"lt.eq.slant",
    r"\geqslant": r"gt.eq.slant",
    r"\sim": r"~",
    r"\implies": r"==>",
    r"\impliedby": r"<==",
    r"\iff": r"<==>",
    r"\to": r"->",
    r"\mapsto": r"|->",
    r"\rightarrow": r"->",
    r"\leftarrow": r"arrow.l", # doesn't feel safe doing <- since might have e.g. x<-5
    r"\leftrightarrow": r"<->",
    # misc symbols
    r"\%": r"%",
    r"\#": r"hash",
    r"\star": r"star",
    r"\ast": r"convolve",
    r"\circ": r"compose",
    r"\pm": r"plus.minus",
    r"\oplus": r"plus.circle",
    r"\otimes": r"times.circle",
    r"\infty": r"oo",
    r"\sum": r"sum",
    r"\prod": r"product",
    r"\times": r"times",
    r"\cdot": r"dot.c",
    r"\cdots": r"dots.c",
    r"\ddots": r"dots.down",
    r"\iddots": r"dots.up",
    r"\vdots": r"dots.v",
    r"\ldots": r"dots",
    # brackets
    r"\{": r"{",
    r"\}": r"}",
    r"\|": r"||",
    r"\mid": r"mid(|)",
    r"\lfloor": r"floor.l",
    r"\rfloor": r"floor.r",
    r"\lceil": r"ceil.l",
    r"\rceil": r"ceil.r",
    r"\langle": r"angle.l",
    r"\rangle": r"angle.r",
    r"\left": r"",
    r"\right": r"",
    # spacing
    r"\,": r"thin ",
    r"\:": r"med ",
    r"\;": r"thick ",
    r"\ ": r"space ",
    r"\\": r"\ ",
    r"\quad": r"quad",
    r"\qquad": r"wide",
    # fixing temporary intermediates
    r"\cases": r"cases",
    r"\op": r"op",
    r"\matrix(": r"mat(delim: #none,",  # ))
    r"\pmatrix": r"mat",
    r"\bmatrix(": r'mat(delim: "[",',  # ]))
    r"\vmatrix(": r'mat(delim: "|",',  # ))
    r"\semi": r"semi",
    r"\comma": r"comma",
    # environments
    r"\begin{verbatim}": r"```",
    r"\end{verbatim}": r"```",
    r"\begin{questions}": r"",
    r"\end{questions}": r"",
    r"\begin{parts}": r"#parts[",
    r"\end{parts}": r"]",
    r"\begin{subparts}": r"#subparts[",
    r"\end{subparts}": r"]",
    r"\begin{itemize}": r"",
    r"\end{itemize}": r"",
    r"\item": r"-",
    r"\begin{center}": r"#align(center, [",
    r"\end{center}": r"])",
}


# we need the extra \ each time since this is being parsed by regex
single_arg_macro_dict = {
    # latex macro: typst pattern
    r"\\mathbf": r"mb(\2\3\4\5)",
    r"\\mathbb": r"bb(\2\3\4\5)",
    r"\\mathbbm": r"bb(\2\3\4\5)",
    r"\\boldsymbol": r"bold(\2\3\4\5)",
    r"\\mathcal": r"cal(\2\3\4\5)",
    r"\\mathfrak": r"frak(\2\3\4\5)",
    r"\\mathrm": r"upright(\2\3\4\5)",
    r"\\sqrt": r"sqrt(\2\3\4\5)",
    r"\\bar": r"overline(\2\3\4\5)",
    r"\\overline": r"overline(\2\3\4\5)",
    r"\\widehat": r"hat(\2\3\4\5)",
    r"\\hat": r"hat(\2\3\4\5)",
    r"\\widetilde": r"tilde(\2\3\4\5)",
    r"\\tilde": r"tilde(\2\3\4\5)",
    r"\\vec": r"arrow(\2\3\4\5)",
    r"\\abs": r"abs(\2\3\4\5)",
    r"\\dot": r"dot(\2\3\4\5)",
    r"\\ddot": r"dot.double(\2\3\4\5)",
    r"\\mathring": r"circle(\2\3\4\5)",
    r"\\substack": r"",
    r"_": r"_(\2\3\4\5)",
    r"\^": r"^(\2\3\4\5)",
    r"\\emph": r"_\2\3\4\5_",
    r"\\pmod": r"(mod \2\3\4\5)",
    r"\\section\*": r"= \2\3\4\5",
    r"\\section": r"= \2\3\4\5",
    r"\\vspace": r"",
}


math_delimiters_dict = {
    r"\[": r"$ ",
    r"\]": r" $",
    r"\begin{align*}": r"$ ",
    r"\end{align*}": r" $",
    r"\begin{aligned*}": r"$ ",
    r"\end{aligned*}": r" $",
    r"\begin{gather*}": r"$ ",
    r"\end{gather*}": r" $",
}
