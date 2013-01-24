module deduced;
import std.typecons: Tuple;

template Deduced(T : U[], V = T, U)
{
    alias Tuple!(T,U,V) Deduced;
}

alias Deduced!(int[], double) D1; // U deduced to be int. Force V to be a double.
alias Deduced!(int[]) D2; // U deduced to be int. V is int, too.
