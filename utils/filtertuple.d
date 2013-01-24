module filtertuple;
import std.typecons;
import std.typetuple;

template FilterTupleTypes(alias pred, alias tup)
{
    static if (tup.field.length)
    {
        static if (pred(tup.field[0]))
            alias TypeTuple!(tup.Types[0], FilterTupleTypes!(pred, tuple(tup.expand[1..$])))
                  FilterTupleTypes;
        else
            alias FilterTupleTypes!(pred, tuple(tup.expand[1..$]))
                  FilterTupleTypes;
    }
    else
    {
        alias TypeTuple!() FilterTupleTypes;
    }

}

template FilterTupleIndices(alias pred, alias tup, size_t ind)
{
    static if (tup.field.length)
    {
        static if (pred(tup.field[0]))
            alias TypeTuple!( ind
                            , FilterTupleIndices!( pred
                                                 , tuple(tup.expand[1..$])
                                                 , ind+1
                                                 )
                            ) FilterTupleIndices;
        else
            alias FilterTupleIndices!( pred
                                     , tuple(tup.expand[1..$])
                                     , ind+1
                                     ) FilterTupleIndices;
    }
    else
    {
        alias TypeTuple!() FilterTupleIndices;
    }

}

/// Filter a tuple on its values.
Tuple!(FilterTupleTypes!(pred, tup)) filterTuple(alias pred, alias tup)()
{
    FilterTupleTypes!(pred, tup) result;
    alias FilterTupleIndices!(pred, tup, 0) indices;
    foreach(i, ind; indices)
    {
        result[i] = tup.field[ind];
    }
    return tuple(result);
}
