module templateintrospection;

template Temp(A, B)
{
    A a;
    B foo(A a, B b) { return b;}
    int i;
    alias A    AType;
    alias A[B] AAType;
}

static assert([__traits(allMembers, Temp)]
           == ["a", "foo", "i", "AType", "AAType"]);
static assert([__traits(allMembers, Temp!(double,string))]
           == ["a","foo", "i", "AType", "AAType"]);
