module curry;
import std.traits;
import checkcompatibility;

struct Curry(alias fun, int index = 0)
{
    alias ReturnType!fun RT;
    alias ParameterTypeTuple!fun PTT;
    PTT args;

    auto opCall(V...)(V values)
        if (V.length > 0
         && V.length + index <= PTT.length)
    {
        // Is fun directly callable with the provided arguments?
        static if (__traits(compiles, fun(args[0..index], values)))
            return fun(args[0..index], values);
        // If not, the new args will be stored. We check their types.
        else static if (!CheckCompatibility!(PTT[index..index + V.length]).With!(V))
            static assert(0, "curry: bad arguments. Waited for "
                            ~ PTT[index..index + V.length].stringof
                            ~ " but got " ~ V.stringof);
        // not enough args yet. We store them.
        else
        {
            Curry!(fun, index+V.length) c;
            foreach(i,a; args[0..index]) c.args[i] = a;
            foreach(i,v; values) c.args[index+i] = v;
            return c;
        }
    }
}

auto curry(alias fun)()
{
    Curry!(fun,0) c;
    return c;
}
