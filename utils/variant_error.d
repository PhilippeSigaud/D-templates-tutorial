module variant_error;
import std.variant;

void main()
{
    Algebraic!(int, double, string) algOne;
    algOne = 1;
    Algebraic!(double, int, string) algTwo = algOne; // fail!
}
