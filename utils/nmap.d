module nmap;
import std.algorithm;
import std.typetuple: allSatisfy;
import acceptingtuple;

// Very easy to do, now:
auto nmap(alias fun, R...)(R ranges) if (allSatisfy!(isInputRange,R))
{
    return map!(tuplify!fun)(zip(ranges));
}
