module anonymousclass;

// stores a function and a default return value.
auto acceptor(alias fun, D)(D defaultValue)
{
    return new class
    {
        this() {}

        auto opCall(T)(T t)
        {
            static if (__traits(compiles, fun(T.init)))
                return fun(t);
            else
                return defaultValue;
        }
    };
}

unittest
{
    int add1(int i) { return i+1;}
    auto accept = acceptor!(add1)(-1);

    auto test1 = accept(10);
    assert(test1 == 11);

    auto test2 = accept("abc");
    assert(test2 == -1); // default value
}
