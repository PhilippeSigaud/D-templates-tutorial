module inoutclauses;
import std.complex, std.math, std.traits;

auto squareRoot(N)(N n) if (isNumeric!N || isComplex!N)
in
{
    // no need to do that for a complex.
    static if (isNumeric!N)
        enforce(n > 0);

}
body
{
    return sqrt(n);
}
