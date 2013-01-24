module half;
import std.typetuple;

template Half(T...)
{
    static if (T.length == 0)
        alias TypeTuple!() Half;
    else static if (T.length == 1)
        alias TypeTuple!(T[0]) Half;
    else
        alias TypeTuple!(T[0], Half!(T[2..$])) Half;
}

unittest
{
    alias TypeTuple!() Test0;
    alias TypeTuple!(int) Test1;
    alias TypeTuple!(int, float) Test2;
    alias TypeTuple!(int, float, string) Test3;
    alias TypeTuple!(int, float, string, double) Test4;

    static assert(is(Half!Test0 == TypeTuple!()));
    static assert(is(Half!Test1 == TypeTuple!(int)));
    static assert(is(Half!Test2 == TypeTuple!(int)));
    static assert(is(Half!Test3 == TypeTuple!(int, string)));
    static assert(is(Half!Test4 == TypeTuple!(int, string)));
}
