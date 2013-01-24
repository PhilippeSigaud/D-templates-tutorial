module heap2;

auto heap(alias predicate, Type)(Type[] values)
{
    struct Heap
    {
        Type[] values;
        this(Type[] _values)
        {
            /* some code initializing values using predicate */
        }
        /* more heapy code */
    }

    return Heap(values); // alias predicate is implicit there
}
