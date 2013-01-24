module rank1;

template rank(T)
{
    static if (is(T t == U[], U))        // is T an array of U, for some type U?
        enum size_t rank = 1 + rank!(U); // then let's recurse down.
    else
        enum size_t rank = 0;            // Base case, ending the recursion.
}
