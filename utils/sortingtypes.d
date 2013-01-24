module sortingtypes;
import std.typetuple;
import sorttypes;

alias TypeTuple!(int, bool, string function(int), float[]) Types1;
alias TypeTuple!(int, float[], string function(int), bool) Types2;

static assert(is(Sort!Types1 == Sort!Types2));
