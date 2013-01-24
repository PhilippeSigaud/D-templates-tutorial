module usingallmembers1;

class MyClass
{
    int i;

    this() { i = 0;}
    this(int j) { i = j;}
    ~this() { }

    void foo() { ++i;}
    int foo(int j) { return i+j;}
}

void main()
{
    // Put in an array for a more human-readable printing
    enum myMembers = [__traits(allMembers, MyClass)];

    // See "i" and "foo" in the middle of standard class members
    // "foo" appears only once, despite it being overloaded.
    assert(myMembers == ["i", "__ctor", "__dtor", "foo", "toString",
                         "toHash", "opCmp", "opEquals", "Monitor", "factory"]);
}
