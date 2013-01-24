module morph;

// What morph will return will heavily depend on T and U
auto morph(alias f, T, U)(U arg)
{
    static if (is(T == class))
        return new T(f(arg));
    else static if (is(T == struct))
        return T(f(arg));
    else
        return; // void-returning function.
}
