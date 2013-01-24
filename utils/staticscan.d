module staticscan;
import std.typetuple;

/**
Gives the TypeTuple resulting from the successive applications of F to reduce
the T list.
*/
template StaticScan(alias F, T...)
{
    static if (T.length == 0)
        alias TypeTuple!() StaticScan; // This case should never happen with normal use
    static if (T.length == 1)
        alias TypeTuple!(T[0]) StaticScan;
    else
        alias TypeTuple!(T[0], StaticScan!(F, F!(T[0], T[1]), T[2..$])) StaticScan;
}
