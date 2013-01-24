module calltwice;

template callTwice(alias fun)
{
    auto callTwice(T)(T t)
    {
        return fun(fun(t));
    }
}

unittest
{
    alias callTwice!( (a){ return a+1;}) addTwo;
    assert(addTwo(2) == 4);
}
