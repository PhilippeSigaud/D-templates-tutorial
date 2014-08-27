module isbuiltintype;

template isSymbol(alias a)
{
    enum isSymbol = true;
}

template isBuiltinType(T)
{
    static if (__traits(compiles, isSymbol!(T)))
        enum isBuiltinType = false;
    else
        enum isBuiltinType = true;
}

template isBuiltinType(alias a)
{
    enum isBuiltinType = false;
}
