module tester;
import qualified;

void myFun(T)(T t) {}

template test(alias fun)
{
    void on(T...)()
    {
        foreach(Type; T)
            static if (!__traits(compiles, fun(Type.init)))
                pragma(msg, "Bad testing combination: "
                          ~ fun.stringof ~ " and " ~ Type.stringof);
    }
}

unittest
{
    test!(myFun).on!(QualifiedTypes);
}
