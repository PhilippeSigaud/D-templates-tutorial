module tree5;
import std.array;

Tree!(T) tree(T)(T value, Tree!T[] children = null)
{
    return Tree!(T)(value, children);
}

struct Tree(T)
{
    alias T Type;
    T value;
    Tree[] children;

    bool isLeaf() @property { return children.empty;}

    typeof(ifLeaf(T.init, S.init))
    fold(alias ifLeaf, alias ifBranch = ifLeaf, S)(S seed)
    {
        if (isLeaf)
        {
            return ifLeaf(value, seed);
        }
        else
        {
            typeof(Tree.init.fold!(ifLeaf, ifBranch)(seed))[] foldedChildren;
            foreach(child; children)
                foldedChildren ~= child.fold!(ifLeaf, ifBranch)(seed);
            return ifBranch(value, foldedChildren);
        }
    }
}
