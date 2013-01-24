module rangewrapper;
import std.range;

struct RangeWrapper(Range)
    // Does Range comply with the input range 'concept'?
    if (isInputRange!Range)
{
   /* Here we know that Range has at least three member functions:
      .front(), .popFront() and .empty(). We can use them happily.*/
}

// In the factory function too.
auto rangeWrapper(Range)(Range range) if (isInputRange!Range)
{
    return RangeWrapper!(Range)(range);
}
