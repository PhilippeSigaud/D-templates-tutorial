module usingstaticfilter2;
import std.typetuple;
import staticfilter;
import istype;
import isbuiltintype;

class MyClass {}
int foo(int i) { return i;}

alias staticFilter!(isType, 1, int, 3.14, "abc", foo, MyClass) Types;
alias staticFilter!(isBuiltinType, 1, int, 3.14, "abc", foo, MyClass) Builtins;

static assert(is(Types == TypeTuple!(int, MyClass)));
static assert(is(Builtins == TypeTuple!(int)));
