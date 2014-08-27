module basicTree2;

struct IntTree {
    int value;
    IntTree[] children;
    
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

struct FloatTree {
    float value;
    FloatTree[] children;
    
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
