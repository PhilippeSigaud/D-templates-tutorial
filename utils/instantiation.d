module instantiation;
import declaration;

void main()
{
    ArrayOf!(int).ArrayType myArray;

     // From is an alias for the type double
     // To for the type int
    alias Transformer!(double,int) transfo;

    struct MyStruct { /*...*/ }

    // "MyStruct" is a identifier -> captured by alias
    auto name = nameOf!(MyStruct).name;

    alias
    ComplicatedOne!( int[]   // a type
                   , "Hello" // a string literal
                   , ArrayOf // a name
                   , true    // a boolean literal
                   , 1+2     // calculated to be the integral '3'.
                   ) complicatedExample;

    alias Minimalist!() min1;

    // Rest is (double,string,"abc")
    // Rest is (double,string,"abc")
    alias OneOrMore!( int
                    , double, string, "abc"
                    ) oneOrMore;

    // Types is a 1-element tuple: (int)
    alias ZeroOrMore!(int) zero1;
    // Types is (int,double,string)
    alias ZeroOrMore!(int,double,string) zero2;
    // Types is the empty tuple: ()
    alias ZeroOrMore!() zero3;

    // Selects the one-arg version
    alias Multiple!(int) mult1;
    // The three args version.
    alias Multiple!(int,double,string) mult2;
    // Error! No 0-arg version
    //alias Multiple!() mult3;
}
