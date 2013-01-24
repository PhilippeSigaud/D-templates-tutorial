module memoize1;
import std.traits;
import std.typecons;

struct Memoize(alias fun)
{
    alias ReturnType!fun RT;
    alias ParameterTypeTuple!fun PTT;
    RT[Tuple!(PTT)] memo; // stores the result, indexed by arguments.

    RT opCall(PTT args)
    {
        if (tuple(args) in memo)      // Have we already seen these args?
        {
            return memo[tuple(args)]; // if yes, use the stored result
        }
        else // if not, compute the result and store it.
        {
            RT result = fun(args);
            memo[tuple(args)] = result;
            return result;
        }
    }
}

Memoize!fun memoize(alias fun)()
{
    Memoize!fun memo;
    return memo;
}
