module ctvalue;

auto callTwice(alias fun, T)(T arg)
    // Is it OK to do fun(fun(some T))?
    if (is(typeof({
                      fun(fun(T.init));
                  }())))
{
    return fun(fun(arg));
}
