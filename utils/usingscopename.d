module usingscopename;
import std.stdio;
import scopename;

class C
{
    mixin getScopeName; // 1

    int i;
    int foo(int j)
    {
        int k;
        mixin getScopeName; // 2
        writeln(scopeName);
        return i+k;
    }
}

void main()
{
    auto c = new C();
    writeln(c.scopeName); // "test.C" (1)
    c.foo(1);             // "test.C.foo" (2)

    mixin getScopeName; // 3
    writeln(scopeName); // "test.main" (3)
}
