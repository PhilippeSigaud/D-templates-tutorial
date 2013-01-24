module constraints_error;

template Temp(T)
if (is(T:int))   // #1, specialized for ints
{ /*...*/ }

template Temp(T) // #2, generic case
{ /*...*/ }

alias Temp!int TI;// Error!
