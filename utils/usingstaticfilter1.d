module usingstaticfilter1;
import std.typetuple;
import std.traits;
import staticfilter;

alias TypeTuple!(int, double, float, string, byte, bool, float, void) Types;

alias staticFilter!(isIntegral, Types) OnlyIntegrals;

static assert(is(OnlyIntegrals == TypeTuple!(int, byte)));
