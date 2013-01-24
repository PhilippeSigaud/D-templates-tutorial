module usingallmembers2;
import std.typetuple;
import std.stdio;
import myclass;
import allmembers;

void main()
{
    alias AllMembers!(MyClass) O;
    writeln(O.stringof);

    foreach(o; O)
        writeln(o.name, ", of type: " ~ o.Type.stringof);

    /*
    prints:
    i, of type: int
    j, of type: int
    Int, of type: int
    (...)
    __ctor, of type: MyClass()
    __ctor, of type: MyClass(int j)
    (...)
    foo, of type: void(int j)
    foo, of type: int(int j, int k = 0)
    (...)
    */
}
