module tree1;
import std.array;

struct Tree(T)
{
    T value;
    Tree[] children;

    bool isLeaf() @property { return children.empty;}
    /* More tree functions: adding children, removing some,... */
}
