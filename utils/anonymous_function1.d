module anonymous_function1;

auto adder(int a)
{
    return (int b) { return a+b;};
}

unittest
{
    auto add1 = adder(1); // add1 is an int delegate(int)
    assert(add1(2) == 3);
}
