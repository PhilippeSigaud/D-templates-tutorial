module eliminate;
import std.typetuple;

template Eliminate(Type, TargetTuple...)
{
    static if (TargetTuple.length == 0) // Tuple exhausted,
        alias TargetTuple
              Eliminate;    // job done.
    else static if (is(TargetTuple[0] : Type))
        alias Eliminate!(Type, TargetTuple[1..$])
              Eliminate;
    else
        alias TypeTuple!(TargetTuple[0], Eliminate!(Type, TargetTuple[1..$]))
              Eliminate;
}

unittest
{
    alias TypeTuple!(int,double,int,string) Target;
    alias Eliminate!(int, Target) NoInts;
    static assert(is( NoInts == TypeTuple!(double, string) ));
}
