module usingmax;
import std.typetuple;
import maxtemplate;
import staticreduce;

alias TypeTuple!(int, bool, double, float delegate(float), string[]) Types;

alias staticReduce!(Max, Types) MaxType;
static assert(is(MaxType == float delegate(float)));
