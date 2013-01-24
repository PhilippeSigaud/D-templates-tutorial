module interleave;
import std.typetuple;

/**
 * Given (T0, T1, T2, ..., Tn) and (U0, U1, ..., Um) will returns
 * the interleaving of the first part with the second part:
 *
 * (T0, U0, T1, U1, ...
 *
 * If one of the inputs is shorter than the other,
 * the longer part is put at the end of the interleaving.
 */
template Interleave(First...)
{
    template With(Second...)
    {
        static if (First.length == 0)
            alias Second With;
        else static if (Second.length == 0)
            alias First With;
        else
            alias TypeTuple!( First[0], Second[0]
                            , Interleave!(First[1..$]).With!(Second[1..$]))
                 With;
    }
}
