module record;

template Record(T, U, V)
{
    import std.typecons: Tuple, tuple;

    // The real work is done here
    // Use as many symbols as you need.
    alias Tuple!(T,U) Pair;
    alias Pair[V] AssocArray;
    alias AssocArray[] Record;
}
