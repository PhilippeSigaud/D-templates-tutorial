module specialization1;

template ElementType(T : U[], U) // can only be instantiated with arrays
{
    alias U ElementType;
}

template ElementType(T : U[n], U, size_t n) // only with static arrays
{
    alias U ElementType;
}

class Array { alias int ElementType;}

template ElementType(T : Array)
{
    alias Array.ElementType ElementType;
}
