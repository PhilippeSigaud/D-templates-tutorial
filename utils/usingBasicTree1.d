module usingBasicTree1;

import basicTree1;

void main()
{
    auto tree = Tree(0, [Tree(1), Tree(2, [Tree(3), Tree(4), Tree(5)])]);
    assert(!tree.isLeaf);
    assert(tree.size() == 6);
}
