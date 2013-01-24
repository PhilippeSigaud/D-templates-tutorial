module allmembers;
import overloads2;
import std.typetuple;

template GetOverloads(alias a)
{
    template GetOverloads(string member)
    {
        alias Overloads!(a, member) GetOverloads;
    }
}

template AllMembers(alias a)
{
    alias staticMap!(GetOverloads!(a), __traits(allMembers, a)) AllMembers;
}
