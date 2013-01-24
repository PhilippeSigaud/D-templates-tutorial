module templatedconstructors;

struct S(T)
{
    this(U)(U u) { /*...*/ }
}

void main()
{
    auto s = S!string(1); // T is string, U is int.
}
