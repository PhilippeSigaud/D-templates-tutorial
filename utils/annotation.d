module annotation;
import std.typetuple;

struct Meta(string Name, alias Data)
{
    enum name = Name;
    alias Data data;
}

template isMeta(T)
{
    static if (__traits(hasMember, T, "name")
            && __traits(hasMember, T, "data"))
        enum isMeta = true;
    else
        enum isMeta = false;
}

template GetName(alias a)
{
    enum string GetName = a.name;
}

template isAnnotated(T)
{
    static if (__traits(compiles, T.Annotations))
        enum bool isAnnotated = true;
    else
        enum bool isAnnotated = false;
}

string getNames(Metadata...)() @property
{
    alias staticMap!(GetName, Metadata) names;
    string result;
    foreach(name; names)
        result ~= "\""~name~"\",";
    if (names.length) result = result[0..$-1];
    return "alias TypeTuple!(" ~ result ~ ") names;";
}

struct Annotated(T, Metadata...)
if (allSatisfy!(isMeta, Metadata))
{
    T value;
    alias value this;
    mixin(getNames!(Metadata));
    Metadata metadata;

    auto property(string s)() @property
    {
        static if (staticIndexOf!(s, names) != -1)
            return metadata[staticIndexOf!(s, names)];
        else
            static assert(false, "Unknown property: " ~ s);
    }

    bool hasAnnotation(string name) @property
    {
        foreach(n; names)
            if (name == n) return true;
        return false;
    }
}

// auto annotated(T)(T value)
// {
//     return Annotated!(T)(value);
// }

template annotated(Metadata...) if (Metadata.length)
{
    auto annotated(T)(T value)
    {
    //     alias TypeTuple!(Metadata) MetaTypes;
        static if (isAnnotated!(T))
            return Annotated!(T.AnnotatedType, T.Annotations, Metadata)(value.value);
        else
        {
            Annotated!(T, Metadata) a;
            a.value = value;
            return a;
        }
    }
}
