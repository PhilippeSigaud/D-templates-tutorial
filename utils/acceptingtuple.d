module acceptingtuple;

template tuplify(alias fun)
{
    auto tuplify(T...)(Tuple!T tup)
    {
        return fun(tup.expand);
    }
}
