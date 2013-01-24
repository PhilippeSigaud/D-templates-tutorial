module using_calltwice;
import calltwice;

unittest
{
    enum b = 3; // Manifest constant, initialized to 3
    alias callTwice!( (a){ return a+b;}) addTwoB;
    assert(addTwoB(2) == 2 + 3 + 3);
}
