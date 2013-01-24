module ttiteration;

import std.typetuple;

unittest
{
    alias TypeTuple!(string, int, double) T;
    T t;
    t[0] = "abc";
    t[1] = 1;
    t[2] = 3.14;

    string[T.length] s;

    foreach(index, Type; T) // Iteration on types.
                            // Type is a different, er, type at each position
    {
        static if(is(Type == double))
            s[index] = Type.stringof;
    }
    assert(s ==  ["", "", "double"]);

    void bar(T)(ref T d) { T t; d = t;}

    foreach(index, value; t) // Iteration on values.
                             // value has a different type at each position!
    {
        bar(t[index]); // use t[iindex], not 'value' to get a ref access
    }

    assert(t[0] == "");
    assert(t[1] == 0);

    import std.math;
    assert(std.math.isnan(t[2]));
}
