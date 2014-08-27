module genericTree;

struct Tree(Type) {
    Type value;
    Tree[] children;
    
    size_t size() {
        size_t s = 1;
        foreach(child; children)
            s += child.size();
        return s;
    }
    
    bool isLeaf() @property {
        return children.length == 0;
    }
}
