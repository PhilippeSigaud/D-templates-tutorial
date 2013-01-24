module getset2;

enum GetSet { no, yes}

struct S(GetSet getset = GetSet.no, T)
{
    enum priv = "private T value;\n"
              ~ "T get() @property { return value;}\n"
              ~ "void set(T _value) { value = _value;}";

    enum pub = "T value;";

    mixin( (getset == GetSet.yes) ? priv : pub);
}
