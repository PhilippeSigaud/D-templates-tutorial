module flatten2;

import std.range;
import rank2;

struct Flatten(Range)
{
    Range range;
    /*...*/
}

auto flatten(Range)(Range range)
{
    static if (rank!Range == 0)
        static assert(0, "flatten needs a range.");
    else static if (rank!Range == 1)
        return range;
    else
        return Flatten!(Range)(range);
}
