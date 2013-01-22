# TODO


## New topics

These are the changes for templates in 2012-2013, that should be added to the tutorial:

So, here is my own small list:

* is(Type name = A!(Args), Args...) now exists. The Args... part is new.
* the new (a,b) => a+b syntax was introduced
* the eponymous trick works even when other non-eponymous members are defined
* error reporting got better
* CTFE got better.
* auto ref?
* __ctfe. I think it arrived just when I wrote the doc. I've now used it and it works great!
* UFCS: not a template feature per se, but quite useful in conjunction with templates.
* UDA. ditto, except I know zilch about them. But, type & value manipulation at compile-time, them I know.
* __LINE__ and __FILE__ are described on dlang.org. Link it.


## New subjects:

* juxtaposing functions,
* mapping n ranges in parallel,
* Generating random values, whatever the type,
* grouping functions,
* a simple compile-time state machine? (to parse something, for example)


## Miscellaneous

From the D mailing lists, related to templates (to be put somewhere in the text):

"You can't use methods (delegates) for template parameters, because they need a context, which is not known at compile-time."

"If exactly one of two equally good matched functions is a templated one, the other one is chosen. Now that you have templated the second function, both are an equally good match and both are templated."
