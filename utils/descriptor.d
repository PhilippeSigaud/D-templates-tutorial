module descriptor;
import std.stdio;

struct Descriptor(T)
{
    T value;
    alias value this;

    string description() @property
    {
        import std.conv;

        return "Descriptor holding a " ~ T.stringof
             ~ " of value " ~ to!string(value) ~ ".\n"
             ~ "(sizeof: " ~ to!string(T.sizeof) ~ " bytes)";
    }
}

void main()
{
    auto d = Descriptor!double(1.0);
    writeln(d.description); // "Descriptor holding a double of value 1
                            //  (sizeof: 8 bytes)"
}
