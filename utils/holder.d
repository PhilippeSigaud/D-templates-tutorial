module holder;
import std.conv;

struct Holder(Type)
{
    Type value;

    this(AnotherType)(AnotherType _value)
    {
        value = to!Type(_value);
    }
}

void main()
{
    Holder!int h = Holder!int(3.14);
    assert(h.value == 3);
}
