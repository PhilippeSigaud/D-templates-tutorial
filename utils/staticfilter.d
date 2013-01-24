module staticfilter;
import std.typetuple;

template staticFilter(alias Pred, T...)
{
    static if (T.length == 0) // End of sequence
        alias TypeTuple!() staticFilter;
    else static if (Pred!(T[0]))
        alias TypeTuple!(T[0], staticFilter!(Pred, T[1..$])) staticFilter;
    else
        alias TypeTuple!(      staticFilter!(Pred, T[1..$])) staticFilter;
}
