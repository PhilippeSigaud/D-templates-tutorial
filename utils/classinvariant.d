module classinvariant;

class MyClass(T, U, V)
{
    /*...*/

    invariant ()
    {
        static if (is(T == U))
        {
            /* invariant code */
        }
        else
        { } /* empty invariant */
    }
}
