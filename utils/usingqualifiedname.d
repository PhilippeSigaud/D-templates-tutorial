module usingqualifiedname;
import qualifiedname;
import cclass;

void main()
{
    auto c = new C();
    assert(qualifiedName!c == "usingqualifiedname.main.c");

    assert(qualifiedName!(c.foo) == "cclass.C.foo"); // same in both cases
    assert(qualifiedName!(C.foo) == "cclass.C.foo");
}
