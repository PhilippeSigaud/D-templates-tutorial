module tree3;
import std.array;

struct Tree(T)
{
    alias T Type;
    T value;
    Tree[] children;

    bool isLeaf() @property { return children.empty;}
}

void main()
{
    Tree!string t0 =Tree!string("abc");
    alias typeof(t0) T0;

    static assert(is( T0.Type == string ));
}
