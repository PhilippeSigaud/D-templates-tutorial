module tupledemonstration;

template TupleDemonstration(T...)
{
    alias T TupleDemonstration;
}

unittest
{
    TupleDemonstration!(string, int, double) t;

    assert(t.length == 3);
    t[0] = "abc";
    t[1] = 1;
    t[2] = 3.14;
    auto t2 = t[1..$];
    assert(t2[0] == 1);
    assert(t2[1] == 3.14);

    void foo(int i, double d) {}
    foo(t2); // OK.

    double[] array = [t2]; // see, between [ and ]
    assert(array == [1.0, 3.14]);
}
