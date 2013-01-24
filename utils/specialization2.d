module specialization2;

template InnerType(T : U*, U) // Specialization for pointers
{
    alias U InnerType;
}

template InnerType(T : U[], U) // Specialization for dyn. arrays
{ /*...*/ }

template InnerType(T) // Standard, default case
{ /*...*/ }

void main()
{
    int* p;
    int i;
    alias InnerType!(typeof(p)) Pointer; // pointer spec. selected
    alias InnerType!(typeof(i)) Default; // standard template selected
}
