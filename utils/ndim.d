module ndim;

template NDimArray(T, size_t r)
{
    static if (r == 0)
        alias T NDimArray;
    else
        alias NDimArray!(T, r-1)[] NDimArray;
}
