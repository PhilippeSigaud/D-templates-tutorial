module nmap2;
import std.algorithm;
import std.functional : adjoin;
import std.range;
import std.typetuple : allSatisfy;
import acceptingtuple; // tuplify

template nmap(fun...) if (fun.length >= 1)
{
    auto nmap(R...)(R ranges) if (allSatisfy!(isInputRange, R))
    {
        alias adjoin!(staticMap!(tuplify, fun)) _fun;
        return map!(_fun)(zip(ranges));
    }
}
