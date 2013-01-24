module usingoverloads1;
import std.stdio;
import overloads1;
import myclass;

void main()
{
    alias Overloads!(MyClass, "foo") o;

    /*
    prints:
    foo, of type: void(int j)
    foo, of type: int(int j, int k = 0)
    */
    foreach(elem; o)
        writeln(elem.name, ", of type: ", elem.Type.stringof);
}
