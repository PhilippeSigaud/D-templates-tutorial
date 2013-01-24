module innerconcatenate;
import std.conv;

auto concatenate(A)(A a)
{
    struct Concatenator
    {
        A a;

        auto opCall(B)(B b) @trusted
        {
            return to!string(a) ~ to!string(b);
        }
    }

    Concatenator c;
    c.a = a; // So as not to activate opCall()

    return c;
}

void main()
{
    auto c = concatenate(3.14);
    auto cc = c("abc");
    assert(cc == "3.14abc");
}
