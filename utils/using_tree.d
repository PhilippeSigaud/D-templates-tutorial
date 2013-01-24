module using_tree;
import tree1;

void main()
{
    auto t0 = Tree!int(0);
    auto t1 = Tree!int(1, [t0,t0]);
    Tree!int[] children = t1.children;
}
