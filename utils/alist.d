module alist;
import std.typetuple;
import std.stdio;
import half;

struct AList(T...)
{
    static if (T.length >= 2 && T.length % 2 == 0)
        alias Half!T Keys;
    else static if (T.length >= 2 && T.length % 2 == 1)
        alias Half!(T[0..$-1]) Keys;
    else
        alias TypeTuple!() Keys;

    static if (T.length >= 2)
        alias Half!(T[1..$]) Values;
    else
        alias TypeTuple!() Values;

    template at(alias a)
    {
        // key not found, but default value present
        static if ((staticIndexOf!(a, Keys) == -1) && (T.length % 2 == 1))
            enum at = T[$-1]; // default value
        else static if ((staticIndexOf!(a, Keys) == -1) && (T.length % 2 == 0))
            static assert(0, "AList: no key equal to " ~ a.stringof);
        else //static if (Keys[staticIndexOf!(a, Keys)] == a)
            enum at = Values[staticIndexOf!(a, Keys)];
    }
}

void main()
{
    alias AList!( 1,     "abc"
                , 2,     'd'
                , 3,     "def"
                , "foo", 3.14
                ,        "Default") al;

    writeln("Keys: ", al.Keys.stringof);
    writeln("Values: ", al.Values.stringof);
    writeln("at!1: ", al.at!(1));
    writeln("at!2: ", al.at!(2));
    writeln("at!\"foo\": ", al.at!("foo"));
    writeln("Default: ", al.at!4);
}
