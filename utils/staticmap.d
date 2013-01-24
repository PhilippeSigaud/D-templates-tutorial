module staticmap;
import std.typetuple;

template staticMap(alias M, T...)
{
    static if (T.length == 0) // End of sequence
        alias TypeTuple!() staticMap; // stop there
    else
        alias TypeTuple!(M!(T[0]), staticMap!(M, T[1..$])) staticMap;
}
