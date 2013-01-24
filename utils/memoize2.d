module memoize2;
import std.traits;
import std.typecons;

enum Storing {
    always,  // there is no tomorrow
    maximum  // sustainable growth
}

enum Discarding {
    oldest,   // only discard the oldest result
    fraction, // discard a fraction (0.5 == 50%)
    all       // burn, burn!
}

struct Memoize(alias fun,
               Storing storing,
               Discarding discarding)
{
    alias ReturnType!fun RT;
    alias ParameterTypeTuple!fun PTT;

    static if (storing == Storing.maximum)
    {
        Tuple!(PTT)[] argsQueue;
        size_t maxNumStored;
    }

    static if (discarding == Discarding.fraction)
        float fraction;

    RT[Tuple!(PTT)] memo; // stores the result, indexed by arguments.

    RT opCall(PTT args)
    {
        if (tuple(args) in memo)      // Have we already seen these args?
        {
            return memo[tuple(args)]; // if yes, use the stored result
        }
        else                          // if not,
        {
            static if (storing == Storing.always)
            {
                RT result = fun(args);// compute the result and store it.
                memo[tuple(args)] = result;
                return result;
            }
            else // Storing.maximum
            {
                if (argsQueue.length >= maxNumStored)
                {
                    static if (discarding == Discarding.oldest)
                    {
                        memo.remove(argsQueue[0]);
                        argsQueue = argsQueue[1..$];
                    }
                    else static if (discarding == Discarding.fraction)
                    {
                        auto num = to!size_t(argsQueue.length * fraction);
                        foreach(elem; argsQueue[0..num])
                            memo.remove(elem);
                        argsQueue = argsQueue[num..$];
                    }
                    else static if (discarding == Discarding.all)
                    {
                        memo = null;
                        argsQueue.length = 0;
                    }
                }

                RT result = fun(args);// compute the result and store it.
                memo[tuple(args)] = result;
                argsQueue ~= tuple(args);
                return result;
            }
        }
    }
}
