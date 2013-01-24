module scopename;
public import qualifiedname;

mixin template getScopeName()
{
    enum scopeName = qualifiedName!(__traits(parent, scopeName));
}
