module flatten4;
import rank2;
public import flatten3;

auto flatten(Range)(Range range)
{
    static if      (rank!Range == 0)
        static assert(0, "flatten needs a range.");
    else static if (rank!Range == 1)
        return range;
    else static if (rank!Range == 2)
        return Flatten!(Range)(range);
    else         // rank 3 or higher
        return flatten(Flatten!(Range)(range));
}
