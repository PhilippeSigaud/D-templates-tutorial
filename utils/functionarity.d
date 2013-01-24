module functionarity;
import std.traits;

template arity(alias fun)
if (isFunction!fun)
{
    enum size_t arity = ParameterTypeTuple!(fun).length;
}
