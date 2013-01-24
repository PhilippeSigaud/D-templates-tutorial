module maker;
import std.algorithm;
import std.conv;

template make(A)
    if (is(A a == class )
     || is(A a == struct))
{
    auto make(Args...)(Args args)
    {
        static if (is(A a == class))
            return new A(args);
        else
            return A(args);
    }
}

struct S {int i;}
class C
{
    int i;
    this(int ii) { i = ii;}
    override string toString() @property
    {
        return "C("~to!string(i)~")";
    }
}

void main()
{
    auto array = [0,1,2,3];

    auto structRange = map!( make!S )(array);
    auto classRange  = map!( make!C )(array);

     assert(equal(structRange, [S(0), S(1), S(2), S(3)]));
    assert(classRange.front.toString == "C(0)");
}
