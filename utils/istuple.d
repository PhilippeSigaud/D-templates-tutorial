module istuple;
import std.typecons;

template isTuple(T)
{
    enum bool isTuple =
        is(typeof({
            void tupleTester(InnerTypes...)(Tuple!(InnerTypes) tup) {}
            T.init possibleTuple;
            tupleTester(possibleTuple);
        }()));
}
