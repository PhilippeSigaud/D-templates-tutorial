module myclass;

class MyClass
{
    int i; // field
    alias i j; // symbol alias

    alias int Int; // type alias

    struct Inner {} // Inner type

    template Temp(T) { alias T Temp;} // template

    this() { i = 0;} // constructor #1
    this(int j) { i = j;} // constructor #2
    ~this() { }

    void foo(int j) { ++i;} // foo overload #1
    int foo(int j, int k = 0) { return i+j;} // foo overload #2

    alias foo bar; // symbol alias

    unittest
    {
        int i;
    }
}
