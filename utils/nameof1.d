module nameof1;

template nameOf(alias name)
{
    enum string nameOf = name.stringof;
}

struct Example { int i;}

void main()
{
    Example example;

    auto s1 = nameOf!(Example);
    auto s2 = nameOf!(example);

    assert(s1 == "Example");
    assert(s2 == "example");
}
