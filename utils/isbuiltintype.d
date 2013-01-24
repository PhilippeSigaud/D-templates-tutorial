module isbuiltintype;

template isBuiltinType(T)
{
    enum isBuiltinType = true;
}

template isBuiltinType(alias a)
{
    enum isBuiltinType = false;
}
