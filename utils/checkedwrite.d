module checkedwrite;
import std.stdio;
import std.traits;
import verifychecks;

void cwritef(alias a, Args...)(Args args)
if (isSomeString!(typeof(a))
 && VerifyChecks!(1, ArgsChecks!(a)).on!(Args))
{
    writef(a, args);
}

void cwritefln(alias a, Args...)(Args args)
if (isSomeString!(typeof(a))
 && VerifyChecks!(1, ArgsChecks!(a)).on!(Args))
{
    writefln(a, args);
}
