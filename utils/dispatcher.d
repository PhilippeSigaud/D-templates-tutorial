module dispatcher;
import std.typetuple;

struct Dispatcher
{
    int foo(int i) { return i*i;}
    string opDispatch(string name, T...)(T t)
    {
        return "Dispatch activated: " ~ name ~ ":" ~ TypeTuple!(T).stringof;
    }
}

void main()
{
    Dispatcher d;

    auto i = d.foo(1); // compiler finds foo, calls foo.
    auto s1 = d.register("abc"); // no register member -> opDispatch activated;
    assert(s1 == "Dispatch activated: register:(string)");

    auto s2 = d.empty; // no empty member, no argument.
    assert(s2 == "Dispatch activated: empty:()");
}
