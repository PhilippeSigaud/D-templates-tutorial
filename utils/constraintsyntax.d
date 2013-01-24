module constraintsyntax;

T theFunction(T)(T argument)
    if (is(T : int) || is(T : double))
{ return argument; }

struct TheStruct(T)
    if (is(T : int) || is(T : double))
{ /*...*/ }

class TheClass(T)
    if (is(T : int) || is(T : double))
    : BaseClass!T, Interface1
{ /*...*/ }
