// Has anyone a better example?
module init;

template init(T)
{
    static if (is(T == immutable) || is(T == const))
        void init(T t) {} // do nothing
    else static if (is(T == class))
        void init(ref T t)
        {
            t = new T();
        }
    else
        void init(ref T t)
        {
            t = T.init;
        }
}
