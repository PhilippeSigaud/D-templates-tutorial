module overloads1;
import std.typetuple;
import makemember;

template Overloads(alias a, string member)
{
    alias staticMap!(MakeMember, __traits(getOverloads,a, member))
          Overloads;
}
