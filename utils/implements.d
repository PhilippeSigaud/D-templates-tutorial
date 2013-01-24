module implements;
import std.typetuple;
import allmembers;

/**
 * Statically check if symbol 'a' implements interface I
 * (that is, if all members of I are found in members of a.
 */
template implements(alias a, I) if (is(I == interface))
{
    alias implementsImpl!(a, AllMembers!I) implements;
}

template implementsImpl(alias a, Items...)
{
    static if (Items.length == 0)
        enum implementsImpl = true;
    else static if (staticIndexOf!(Items[0], AllMembers!a) == -1)
        enum implementsImpl = false;
    else
        enum implementsImpl = implementsImpl!(a, Items[1..$]);
}

interface I
{
    int foo(int i);
    void foo();

    string toString();
}

class Bad
{
    void foo(int i) {}
}

struct Good
{
    int field;

    int foo(int i) { return i;}
    void foo() { field = 1;}

    string toString() { return "I'm a good struct!";}
}

unittest
{
    assert( implements!(Good, I));
    assert(!implements!(Bad, I));
}
