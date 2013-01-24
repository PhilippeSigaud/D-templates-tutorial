module function_declaration1;
import std.conv : to;

// declaration:
template myFunc(T, int n)
{
    auto myFunc(T t) { return to!int(t) * n;}
}

void main()
{
    // call:
    auto result = myFunc!(double,3)(3.1415);

    assert(result == to!int(3.1415)*3);
}
