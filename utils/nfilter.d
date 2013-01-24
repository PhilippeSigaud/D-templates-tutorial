module nfilter;
import std.algorithm;
import std.range;
import std.typetuple : allSatisfy;

import acceptingtuple; // tuplify

auto nfilter(alias fun, R...)(R ranges) if (allSatisfy!(isInputRange, R))
{
    return filter!(tuplify!fun)(zip(ranges));
}
