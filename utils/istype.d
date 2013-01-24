module istype;

template isType(T)
{
    enum isType = true;
}

template isType(alias a)
{
    static if (is(a))
        enum isType = true;
    else
        enum isType = false;
}
