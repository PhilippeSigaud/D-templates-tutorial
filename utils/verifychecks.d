module verifychecks;
import std.conv;
import std.traits;
import std.typetuple;
import isanytype;
import getformatters;

template ArgsChecks(alias a) if (isSomeString!(typeof(a)))
{
    mixin(getFormatters(a));
}

template VerifyChecks(int which, Checks...)
{
    template on(Args...)
    {
        static if (Checks.length != Args.length)
            static assert( 0
                         , "ctwrite bad number of args: waited for "
                         ~ to!string(Checks.length)
                         ~ " args, got "
                         ~ to!string(Args.length)
                         ~ ".");
        else static if (Checks.length == 0) // end of process
            enum on = true;
        else static if ({ alias Checks[0] C; return C!(Args[0]);}()) // recurse
            enum on = VerifyChecks!(which+1, Checks[1..$]).on!(Args[1..$]);
        else
            static assert( 0
                         , "cwrite bad arg: arg #"
                         ~ to!string(which)
                         ~ " of type "
                         ~ Args[0].stringof
                         ~ " does not verify check "
                         ~ __traits(identifier, Checks[0]));
    }
}
