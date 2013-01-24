module baseelementtype;
import std.range;
import rank2;

template BaseElementType(T)
{
    static if (rank!T == 0)      // not a range
        static assert(0, T.stringof ~ " is not a range.");
    else static if (rank!T == 1) // simple range
        alias ElementType!T                     BaseElementType;
    else                         // at least range of ranges
        alias BaseElementType!(ElementType!(T)) BaseElementType;
}
