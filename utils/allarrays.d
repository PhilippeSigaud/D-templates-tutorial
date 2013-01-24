module allarrays;

template AllArraysOf(T)
{
    alias T    Element;
    alias T*   PointerTo;
    alias T[]  DynamicArray;
    alias T[1] StaticArray;
    alias T[T] AssociativeArray;
}
