module repeatedcomposition;

template power(alias fun, uint exponent)
{
    static if (exponent == 0) // degenerate case -> id function
        auto power(Args)(Args args) { return args; }
    else static if (exponent == 1) // end-of-recursion case -> fun
        alias fun power;
    else
        auto power(Args...)(Args args)
        {
            return .power!(fun, exponent-1)(fun(args));
        }
}
