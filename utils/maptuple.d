module maptuple;
import std.typecons;
import std.typetuple;
import std.functional;

/**
 * Helper template to get a template function return type.
 */
template RT(alias fun)
{
    template RT(T)
    {
        alias typeof(fun(T.init)) RT;
    }
}

/// Maps on a tuple, using a polymorphic function. Produces another tuple.
Tuple!(staticMap!(RT!fun, T)) mapTuple(alias fun, T...)(Tuple!T tup)
{
    StaticMap!(RT!fun, T) res;
    foreach(i, Type; T) res[i] = unaryFun!fun(tup.field[i]);
    return tuple(res);
}
