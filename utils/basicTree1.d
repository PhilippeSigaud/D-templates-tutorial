module basicTree1;

struct Tree {
    int value;
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
