D Template Tutorial
===================

What's it's about
-----------------

This project is about a wonderful part of the [D programming language](www.dlang.org "D Website"): templates. It contains a (not-so) small LaTeX document on templates aiming to be a kind of tutorial.

* The master document is `dtemplates.tex` and calls the other subfiles:
* `dtemplates_basics.tex` is about templates syntax, basic building blocks (`static if`, eponymous trick) and function, struct and class templates.
* `dtemplates_advanced.tex` is about more advanced ideas, like constraints, tuples and other metaprogramming constructs interacting with templates: traits, compile-time function evaluation (CTFE) and string mixins.
* `dtemplates_examples.tex` presents some more detailed examples of what can be bone with D templates.
* `dtemplates_appendix.tex` gives some explanation on the `is` expression.

I'll push the resulting pdf file on this repo, but it'd be best to generate it anew on your computer.

LaTeX notes
-----------

Right now, the document uses basic `verbatim` commands to present code. So, right now, you can compile the .tex files using your standard LaTeX installation. 

When I want a nice rendering, I just convert the `verbatim` commands into `\begin{dcode} - \end{dcode}` pairs, and then use the [minted](http://code.google.com/p/minted/) package. `minted' uses Python's [Pygment](pygment.org) highlighter.

TODO
----

* Finish the examples part
* write some D code to automatically extract and compile the examples code.
* find a way to convert to .ddoc format (maybe another project: some Markdown <-> LaTex <-> DDoc converter), to use D's own syntax highlighter.

