module validcall;
import std.conv;

bool validCall(alias fun, Args...)(Args args)
{
    return is( typeof({ /* code to test */
                        fun(args);
                        /* end of code to test */
                      }()));
}

// Usage:
T add(T)(T a, T b) { return a+b;}
string conc(A,B)(A a, B b) { return to!string(a) ~ to!string(b);}

void main()
{
    assert( validCall!add(1, 2));   // generates add!(int)
    assert(!validCall!add(1, "abc")); // no template instantiation possible

    assert( validCall!conc(1, "abc")); // conc!(int, string) is OK.
    assert(!validCall!conc(1)       ); // no 1-argument version for conc

    struct S {}

    assert(!validCall!S(1, 2.3)); // S is not callable
}
