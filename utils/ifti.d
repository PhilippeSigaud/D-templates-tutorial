module ifti;
import function_declaration2;

struct Foo {}

void main()
{
    string res1 = concatenate(1, 3.14); // A is int and B is double
    string res2 = concatenate("abc", Foo()); // A is string, B is Foo

    auto res3 = select(3,4); // how is "max", Arg is int.
    auto res4 = select!"min"(3.1416, 2.718); // how is "min", Arg is double.
}
