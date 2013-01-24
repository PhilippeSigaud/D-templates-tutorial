module istuple;
import std.typecons;

template isTuple(T)
{
    static if (is(typeof({
              void tupleTester(InnerTypes...)(Tuple!(InnerTypes) tup) {}
              T.init possibleTuple;
              tupleTester(possibleTuple);
              }())))
        enum bool isTuple = true;
    else
        enum bool isTuple = false;
}
