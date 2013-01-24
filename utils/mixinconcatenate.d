module mixinconcatenate;
import std.typecons;

mixin template Concatenate()
{
    Tuple!(typeof(this), U) opBinary(string op, U)(U u)
    if (op == "~")
    {
        return tuple(this, u);
    }
}
