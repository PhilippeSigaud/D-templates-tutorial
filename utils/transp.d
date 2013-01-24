module transp;

struct Transparent(T)
{
    T value;
    alias value this;
}

// factory function
Transparent!T transparent(T)(T t)
{
    return Transparent!T(t);
}
