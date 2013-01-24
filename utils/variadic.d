module variadic;

string toStrings(string sep = ", ", Args...)(Args args)
{
    import std.conv;
    string result;
    foreach(index, argument; args)
    {
        result ~= to!string(argument);
        if (index != args.length - 1)
            result ~= sep; // not for the last one
    }
    return result;
}

unittest
{
    assert( toStrings(1, "abc", 3.14, 'a', [1,2,3])
                  == "1, abc, 3.14, a, [1, 2, 3]");
}
