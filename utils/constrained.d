module constrained;

template Constrained(T)
    if (is(T : int)) { /*...*/ } // #1
template Constrained(T)
    if (is(T : string)) { /*...*/ } // #2
template Constrained(T,U)
    if (is(T : int) && !is(U : float)) { /*...*/ } // #3
template Constrained(T,U)
    if (is(T : int) && is(U : float)) { /*...*/ } // #4

alias Constrained!(int) C1;       // #1
// alias Constrained!(string) C2; // Error, no declaration fits (string)
alias Constrained!(int,string) C3;// #3 and #4 considered, but #4 is dropped.
                                  // So #3 it is.
