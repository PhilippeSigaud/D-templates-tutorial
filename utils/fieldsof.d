module fieldsof;

/**
 * Evaluates to an array of strings containing
 * the names of the fields in the given type
 */
template fieldsOf (T)
{
    const fieldsOf = fieldsOfImpl!(T, 0);
}

/**
 * Implementation for fieldsOf
 *
 * Returns: an array of strings containing the names of the fields in the given type
 */
template fieldsOfImpl (T, size_t i)
{
    static if (T.tupleof.length == 0)
        enum fieldsOfImpl = [""];

    else static if (T.tupleof.length - 1 == i)
        enum fieldsOfImpl = [T.tupleof[i].stringof[1 + T.stringof.length + 2 .. $]];

    else
        enum fieldsOfImpl = T.tupleof[i].stringof[1 + T.stringof.length + 2 .. $] ~ fieldsOfImpl!(T, i + 1);
}
