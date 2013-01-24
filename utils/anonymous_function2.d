module anonymous_function2;

auto adder(T)(T a)
{
    return (T b) { return a+b;};
}

unittest
{
    auto add1f = adder(1.0); // add1f is an float delegate(float)
    assert(add1f(2.0) == 3.0);

    import std.bigint;

    // addBigOne accepts a BigInt and returns a BigInt
    auto addBigOne = adder(BigInt("1000000000000000"));
    assert(addBigOne(BigInt("1")) == BigInt("1000000000000001"));

    // But:
    // auto error = add1(3.14); // Error! Waiting for an int, getting a double.
}
