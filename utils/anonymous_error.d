module anonymous_error;

auto concatenate(A)(A a)
{
    /* !! Not legal D code !! */
    return (B)(B b) { return to!string(a) ~ to!string(b);};
}
