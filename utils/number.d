module number;
import std.traits;

struct Number(T) if (isNumeric!T)
{
    T num;

    auto opBinary(string op, U)(U u)
         if ((op == "+" || op == "-" || op == "*" || op == "/")
         && ((isNumeric!U) || is(U u == Number!V, V)))
    {
 mixin("alias typeof(a" ~ op ~ "b) Result;
        static if (isNumeric!U)
            return Number!Result(a"~op~"b);
        else
            return Number!Result(a"~op~"b.num);");
    }
}
