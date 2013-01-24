module tree2;
import tree1;

auto tree(T)(T value, Tree!T[] children = null)
{
    return Tree!(T)(value, children);
}

void main()
{
    auto t0 = tree(0); // Yes!
    auto t1 = tree(1, [t0,t0]); // Yes!

    static assert(is( typeof(t1) == Tree!int ));

    auto t2 = tree(t0); // Yes! typeof(t2) == Tree!(Tree!(int))
}
