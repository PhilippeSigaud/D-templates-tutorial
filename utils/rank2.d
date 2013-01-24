module rank2;
import std.range;

template rank(T)
{
    static if (isInputRange!T)                       // is T a range?
        enum size_t rank = 1 + rank!(ElementType!T); // if yes, recurse
    else
        enum size_t rank = 0;                        // base case, stop there
}

unittest
{
    auto c = cycle([[0,1],[2,3]]); // == [[0,1],[2,3],[0,1],[2,3],[0,1]...
    assert(rank!(typeof(c)) == 2); // range of ranges
}
