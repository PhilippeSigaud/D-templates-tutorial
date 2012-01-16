TODO
====

Scaffolding
-----------

* Define more LaTeX environments (invisible-D, D-in-main, D-module-scope)
* A D script that extract the code samples and put them in directories.
* Another D script that extract the \TODO{} commands and list them all.

Templates to show
-----------------

* juxtapose functions
* annotating type
* compile-time writefln
* mapping n ranges in parallel
* heterogeneous tree
* Generating random values, whatever the type.

Misc.
-----

* __LINE__ and __FILE__ are described on dlang.org. Link it.
* Index Appendix B.

Simen's code:

----
string EnumDefAsString(T)() if (is(T == enum)) {
   string result = "";
   foreach (e; __traits(allMembers, T))
       result ~= e ~ " = T." ~ e ~ ",";
   return result;
}

This piece of code iterates over all members of the passed enum T,
generating a string containing all members and their values. For
this enum:

 enum bar {
     a, b, c
 }

the generated string looks like this (if you want to check this,
feel free to call EnumDefAsString at run-time and print its result):

 "a = bar.a,b = bar.b,c = bar.c"

As we can see, this is a valid body for an enum. That means we can use
mixin() to generate this exact same enum. But wait - there's more:


template ExtendEnum(T, string s)
   if (is(T == enum) &&
   is(typeof({mixin("enum a{"~s~"}");})))
{
   mixin(
   "enum ExtendEnum {"
   ~ EnumDefAsString!T()
   ~ s
   ~ "}");
}

This code concatenates the string generated from the previous function
with that passed to the function as parameter s. So with bar previously
defined, and this instantiation:

   ExtendEnum!(bar, "d=25")

the body of the function will look like this (after string expansion):



   mixin(
   "enum ExtendEnum {"
   ~ "a = bar.a,b = bar.b,c = bar.c"
   ~ "d=25"
   ~ "}");

concatenating those strings, we see that we have a valid enum definition:

   enum ExtendEnum {a = bar.a,b = bar.b,c = bar.c,d=25}

The mixin then pastes it in, and it is compiled as regular D code.


TLDR:

This code generates an enum definition as a string, by taking all the
members of the old enum, and adding those passed in string parameter s,
and mixing it in.
----