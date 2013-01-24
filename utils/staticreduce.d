module staticreduce;

template staticReduce(alias bin, Types...) // Types[0] is the seed
{
    static if (Types.length < 2)
        static assert(0, "staticReduce: tuple "
               ~ Types.stringof ~ " has not enough elements (min: 2 elements)");
    else static if (Types.length == 2) // end of recursion
        alias bin!(Types[0], Types[1]) staticReduce;
    else // recurse
        alias staticReduce!(bin, bin!(Types[0], Types[1])
                               , Types[2..$])
              staticReduce;
}
