module qualified;
import std.typetuple;

/**
* Given a type T, generates all qualified versions of T
* that you find interesting (eleven versions all in all).
*/
template Qualified(T)
{
    alias TypeTuple!(
                     T, const(T), immutable(T), shared(T),
                     T[],const(T)[],immutable(T)[], shared(T)[],
                     const(T[]), immutable(T[]), shared(T[])
                    ) Qualified;
}

// All 16 built-in types you're interested in.
alias TypeTuple!(
                 bool,
                 ubyte,byte,
                 ushort,short,
                 uint,int,
                 ulong,long,
                 float,double,real,
                 char,wchar,dchar
                ) ValueTypes;

// Bang, 11*16 types generated.
alias staticMap!(Qualified,ValueTypes) QualifiedTypes;

// If you're really a pervert (note that there will be duplicates)
alias staticMap!(Qualified, QualifiedTypes) DoublyQualifiedTypes;
