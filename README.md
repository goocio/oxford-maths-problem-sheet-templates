# oxford-maths-problem-sheet-templates
A repo of the .tex files for all Oxford maths problem sheets

The Oxford maths department makes all problem sheets publicly available at https://courses.maths.ox.ac.uk/. For the sake of both presentation and organisation, I like submitting my problem sheets not only using $\LaTeX$, but also having the questions there in the file, so that it's all in one complete document, making it easier to refer back to.

Despite making the *sheets* publicly available, most courses do not make the `.tex` files *behind* the sheets available, and recreating them based on the output problem sheets is quite time consuming; therefore I thought it would be good to make them available here, to save people having to recreate them themselves. To be clear: these are not solutions, simply the `.tex` files for the problem sheets themselves.

I've used the `exam` class in all the sheets to lay out questions and solutions; a demo is provided in `sample.tex` and `sample.pdf`. Each term has a header `.sty` file containing some essential package imports, together with several optional ones and my own macro preferences; maybe you might take a couple macro ideas but otherwise feel free to use your own macros instead, since I've made sure none of the sheet templates depend on them unless explicitly provided within the sheet itself.

Any files that have images in are assumed to have the file tree laid out as it is here, i.e. the folder containing the sheet has a subfolder called `images` which contains the relevant images. This can easily be changed by changing the argument to `\graphicspath` in the relevant `.tex` files.



As of Hilary 2025 I now also provide them in Typst, with a converter I threw together that generates a Typst file based on the input $\LaTeX$ file; see the `typstify` directory and the associated example `demo.typ` automatically converted from `demo.tex`. I'm aware things like pandoc exist but as of when I last tried, it's still terrible at `.tex -> .typ` conversion. The only manual modifications made to the `.typ` file output by `typstify` will be if `typstifyRemaining` puts a `#panic` in for an unprocessed macro.
