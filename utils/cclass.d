module cclass;
import nameof;

class C
{
    int i;
    int foo(int j)
    {
        int k; // k is "cclass.C.foo.k"
        assert(nameOf!(__traits(parent, k)) == "foo");
        return i+k;
    }
}
