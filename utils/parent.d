module parent;
import nameof;
import cclass;

// C is more precisely a cclass.C)
static assert(nameOf!(__traits(parent, C)) == "cclass");

void main()
{
    auto c = new C(); // c is "parent.main.c"
    assert(nameOf!(__traits(parent, c)) == "main");
    assert(nameOf!(__traits(parent, c.i)) == "C");
    c.foo(1);
}
