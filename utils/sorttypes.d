module sorttypes;
import std.typecons;
import staticreduce;

template Max(T1, T2)
{
    static if (T1.stringof >= T2.stringof)
        alias T1 Max;
    else
        alias T2 Max;
}

template AddToSorted(Sorted, Type)
{
// Length 0: already sorted
    static if (Sorted.Types.length == 0)
        alias Tuple!(Type) AddToSorted;
// Smaller than the first one: put Type in first place
    else static if (is(Max!(Sorted.Types[0], Type) == Sorted.Types[0]))
        alias Tuple!(Type, Sorted.Types) AddToSorted;
// Bigger than the last one: put Type at the end
    else static if (is(Max!(Sorted.Types[$-1], Type) == Type))
        alias Tuple!(Sorted.Types, Type) AddToSorted;
// Else, compare to the middle type and recurse left or right of it
    else static if (is(Max!(Sorted.Types[$/2], Type) == Type))
        alias Tuple!(Sorted.Types[0..$/2],
                     AddToSorted!(Tuple!(Sorted.Types[$/2..$]),Type).Types)
              AddToSorted;
    else
        alias Tuple!(AddToSorted!(Tuple!(Sorted.Types[0..$/2]),Type).Types,
                     Sorted.Types[$/2..$])
              AddToSorted;
}

template Sort(Types...)
{
    alias staticReduce!(AddToSorted, Tuple!(), Types) Sort;
}
