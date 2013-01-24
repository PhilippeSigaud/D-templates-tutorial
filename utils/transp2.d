module transp2;
import transp;

struct Thin(T)
{
    T value;
    alias value this;
}

Thin!T thin(T)(T t)
{
    return Thin!T(t);
}

unittest
{
    auto i = transparent(10);
    auto t = thin(i); // Works.
    assert(t == 10); // Yep, value was transmitted correctly.

    assert(is(typeof(t) == Thin!(Transparent!int)));
}
