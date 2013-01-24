module juxtaposehelper;
import std.traits;
import functionarity;
import staticscan;
import maponalias;

template isNotVoid(T)
{
    enum bool isNotVoid = !is(T == void);
}

/**
 * Given a bunch of functions names, gives the typetuple of their return types.
 * Used by juxtapose.
 */
template ReturnTypes(Funs...)
{
    alias MapOnAlias!(ReturnType, Funs) ReturnTypes;
}

/**
 * Given a bunch of functions names, gives the (flattened) typetuple
 * of their return values. Used by juxtapose.
 */
template ParameterTypeTuples(alias fun, Rest...)
{
    alias MapOnAlias!(ParameterTypeTuple, fun, Rest) ParameterTypeTuples;
}

template SumOfArity(size_t zero, alias fun)
{
    enum size_t SumOfArity = zero + arity!fun;
}

template SumOfArities(F...)
{
    alias StaticScan!(SumOfArity, 0, F) SumOfArities;
}

template SumOfReturn(size_t zero, alias fun)
{
    static if (is(ReturnType!fun == void))
        enum size_t SumOfReturn = zero;
    else
        enum size_t SumOfReturn = zero + 1;
}

template SumOfReturns(Funs...)
{
    alias StaticScan!(SumOfReturn, 0, Funs) SumOfReturns;
}
