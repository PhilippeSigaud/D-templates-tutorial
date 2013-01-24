module storage;

void init(T)(ref T t)
{
    t = T.init;
}

unittest
{
    int i = 10;
    init(i);
    assert(i == 0);
}
