# typstify

Here I'll set out roughly the workings of `typstify.py`, `regex_macros.py`, and `macro_dictionaries.py`.



## Known issues
- tabular, tabularx, array, and any other environments which take an extra argument currently have no way of being handled
- currently \left and \right are simply removed, but this doesn't account for \left. and \right. e.g. in `\left.\frac{\mathrm dy}{\mathrm dx}\right|_{x=a}`, which in typst should be `lr(zwj (dif y)/(dif x) |)_(x=a)` (note that aside from this, `lr` should almost never be needed, since typst applies \left and \right automatically, since it isn't 50 years old like tex)
- certain tex-style (i.e. *not* latex-style) macros are very very hard to parse/convert, such as `\limits` and `\displaystyle`, due to their tex-style scoping, so they're currently simply replaced with nothing
- need to implement conversion of `\verb|...|`, similar issue to with tex-style macros since its scoping isn't done like `\macro{arg}`
- accents such as `\'`, `\"` don't exist in typst, you need to just paste the actual accented character
- plausibly itemize could have indentation issues after conversion, though this hasn't come up yet
- I don't know how to do an elegant conversion of `\tag` since it'll be of the form e.g. `\tag{$\star$}` because of dumb tex math-being-in-vertical-mode stuff so there's extra $ signs there that we don't want and therefore it can't simply be thrown in with the other single-arg macros, moreover even if I did handle it specially, typst doesn't really have a good equivalent of `\tag` right now, I'd probably have to do e.g. `\tag{$\star$}` -> `wide (star)`
- images...
- some spacing commands fundamentally conflict in a way I don't know how to deal with. If we're scanning for `\\` first, things certainly won't work, since `\\` -> `\ ` so if it's first then `\ ` -> `space` will ultimately cause every newline to become just a space, so we need to run `\\` last. However, suppose we had `\\ `, which should be converted to `\ ` (when not in an array-like environment). Scanning for `\ ` first results in `\\ ` -> `\space` erroneously. While I can't see a way to deal with this, at least it being left as `\space` means `typstifyRemaining` will catch it as an error (note simply adding `r"\space": r"\ "` to `macro_dict` won't be enough, since that's a longer control sequence so it's checked before the bug that creates it)
- typst handles prime notation for derivatives weirdly, e.g. `f_n'` will put the prime down with the `n` rather than with the `f`, so you need to do `f'_n`, which imo is not great. There's not really any easy/nice way to detect this so it will get out unmarked into the output document, so I guess just watch out for prime notation being used with subscript/superscript



### General flow
- Load .tex file and filter out its preamble, using it to fill in the associated .typ preamble, via `filterPreamble`. The .typ preamble is returned, along with the remaining lines of the .tex file for further processing.
- The next processing is done by `fixIndentation`, which updates the indentation based on question layout and environments, as described in [indentation](#indentation).
    - This tracks indentation using begin and end blocks, with a mechanism for "storing" indentation that should take effect on the *next* line rather than the current one.
- Then the processing moves on to making it typst-compatible, in `typstify`:
    - `typstifyArraySyntax` updates math array-like environment to typst's syntax, since it's incompatible with latex's. In latex, all array-like environments have ampersand to separate entries, and a double backslash to separate lines. In typst it's a comma to separate entries, and a semi-colon to separate lines; except for the `cases` environment (ironically), which has `quad&` to separate entries (??? one of the few bad design choices in typst) and a comma to separate lines.
    - `typstifyMathMode` makes a preliminary pass over macro substitutions, in order to make it clear to the parser what is and isn't math mode (see [macro replacement](#macro-replacement)). It then uses this to space out math symbols as Typst requires. It also swaps `/` in math mode with ` slash `, since typst actually typesets slashes into fractions, and it's a 0-arg single-character macro so if we put it in with the regular substitutions it'll be too late. Likewise it swaps `~` in math mode with ` space.nobreak `, since `~` in latex gives a non-breaking space whether in text or math, whereas in typst it's only a non-breaking space in text mode, and in math mode it's shorthand for `tilde.op`.
    - `typstifyMacros` finishes the macro substitutions and corrects for the temporary intermediate substitutions made by `typstifyMathMode`.
    - Finally `typstifyRemaining` polishes up the question format and checks for any macros left unconverted

### Indentation
The indentation is rather complicated, as the starting of a multiline environment on one line
should adjust the indent starting from the *next* line (see `shift` variable). Here is a fairly
minimal example, with only the base question/part/subpart layout and no further environments:
```typst
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
```



### Macro replacement
The ordering of the various macro replacement commands is slightly finnicky. We can't simply use just the one dictionary of macros to replace from, because of how latex is able to start and end math mode without using dollar signs via various environments. In order to fix the math mode spacing to work in typst (i.e. `$ab$` -> `$a b$` etc) we of course need to know when we're in math mode, and so we can't run it *before* all the macro conversions. However, we also can't run it *after* all the macro conversions, since any macros still left in math mode (such as `op` or `sin`) would be mis-identified as sequences of letters rather than macros and would hence be given spaces between their letters erroneously. Therefore we convert only the macros which delimit math mode (and also math mode macros with text arguments), then sort out the math mode spacing, then convert the rest of the macros.

Moreover, environments in math mode would have their names spaced erroneously, so we substitute these out early along with math mode delimiters in `typstifyArraySyntax`. This is done by first converting them to an intermediate fake control sequence and then adding this control sequence to `macro_dict` so the substitution is finished in the second pass, by `typstifyMacros`.

When substituting 0-arg macros, instead of simply enumerating over the regular dictionary items, I need to enumerate over the items sorted by decreasing key (control sequence) length, since latex macros are not a prefix code, e.g. if `\foo` were supposed to be replaced with `thing` and `\foobar` were supposed to be replaced with `stuff`, if I had them in that order in the dictionary, when enumerating it would end up scanning through the string and replacing `foo` instances *first*. This means e.g. a string `"abc\foobar abc"` wouldn't become the intended `"abcstuff abc"` but instead `"abc\thingbar abc"`. To avoid this, we could default to `regex.sub` with a greedy regex to ensure a full control sequence is captured at a time, or instead we could sort the substitutions in order of decreasing control sequence length. I've opted for the latter since the former would require accounting not only for how control sequences can be either control *characters* (e.g. `\[` or `\]`) or control *words* (e.g. `\alpha`) but also for the various environments currently being replaced by the dictionary. This issue doesn't apply to macros with args since they're using a regex already (see [argument structure](#argument-structure)).



### Argument structure
Macros can be called as: `\foo5`, `\foo\somemacro`, or `\foo{stuff}`, or any of those with spaces in. In the case of the last one, there might be further nested macros with arguments, so I'm using the recursive regex option from the `regex` package (not available with usual `re` package). As such, these ones must be substituted repeatedly until no further changes occur.

The overall regex command is thus:
```python
arg_pattern = r"\s*(?:(\{\s*((?>[^{}]+?|(?1))*?)\s*\})|(\\[a-zA-Z]+)| ([a-zA-Z])|([^\s{}()a-zA-Z]))"
```

While it's only the nested ones which need to be repeatedly substituted, unfortunately we need to use the full `arg_pattern` in the loop (as opposed to being able to split it into the scope version and the single token version and only loop the scope version), since if we don't have the pattern encompass any argument syntax, macros with multiple arguments but given in different syntax would fail to match, e.g. `\frac{2\pi}3`. Luckily though it doesn't matter much since we can just put the scope pattern first so if there's lots of nested scoping it won't be wasting a check for the non-scoped ones each time.

We need to have the pair of groups `(\s[a-zA-Z])` and `([^\s{}()a-zA-Z])` rather than just having `([^\s{}()])` since if the argument is a single letter then it *needs* the space, to avoid it from e.g. converting `\mathbbm` to `\mathbb(m)`; it's only non-letter characters that can immediately follow a control word with no intervening whitespace. With 0-arg macros, this issue was able to be sidestepped by simply ordering the macros in order of decreasing length, to ensure potential prefixes are substituted *after* the things they're prefixes of; however here that wouldn't solve it, since the particular case of `\text...` -> `"..."` has to be done in typstifyMathMode, which is before typstifyMacros, so it would erroneously convert `\textbf...` -> `"b" f...`.

Also, in `arg_pattern`, there are a few `\s*` tags to remove excess whitespace, but the last won't work unless we have non-greedy markers on the scoped pattern, which is fine, but if you look you'll see there are *two* non-greedy markers; for some reason it doesn't work with only one or the other, even if the possessive lookahead `?>` is replaced with a regular capturing lookahead `?:`.
