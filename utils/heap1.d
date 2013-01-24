module heap1;

bool lessThan(T)(T a, T b) { return a<b;}

struct Heap(Type, alias predicate = lessThan, float reshuffle = 0.5f)
{
    // predicate governs the internal comparison
    // reshuffle deals with internal re-organizing of the heap
    Type[] values;
/*...*/
}
