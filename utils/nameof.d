module nameof;

template nameOf(alias a)
{
    enum string nameOf = __traits(identifier, a);
}

unittest
{
    int foo(int i, int j) { return i+j;}
    enum name = nameOf!foo; // name is available at compile-time

    assert(name == "foo");
}
