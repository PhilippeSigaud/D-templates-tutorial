module qualifiedname;
import nameof;

template qualifiedName(alias a)
{
    // does it have a parent?
    static if (__traits(compiles, __traits(parent, a)))
    // If yes, get the name and recurse
        enum qualifiedName = qualifiedName!(__traits(parent, a))
                           ~  "." ~ nameOf!(a);
    // if not, it's a module name. Stop there.
    else
        enum qualifiedName = nameOf!a;
}
