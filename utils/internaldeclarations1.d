module internaldeclarations1;
import declaration;

// ArrayType is accessible (it's int[])
// array is a completly standard dynamic array of ints.
ArrayOf!(int).ArrayType array;
ArrayOf!(int).ElementType element; // the same, element is an int.

void main()
{
    // the transform function is accessible. Instantiated like this,
    // it's a function from double to string.
    auto s = Transformer!(double,string).transform(3.14159);
    assert(is(typeof(s) == string)); // s is a string
}
