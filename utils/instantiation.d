module instantiation;
import declaration;

void main()
{
    ArrayOf!(int).ArrayType myArray;

     // From is an alias for the type double
     // To for the type int
    alias transfo = Transformer!(double,int);

    struct MyStruct { /*...*/ }

    // "MyStruct" is a identifier -> captured by alias
    auto name = nameOf!(MyStruct).name;

    alias complicatedExample =
    ComplicatedOne!( int[]   // a type
                   , "Hello" // a string literal
                   , ArrayOf // a name
                   , true    // a boolean literal
                   , 1+2     // calculated to be the integral '3'.
                   );

    alias min1 = Minimalist!(); // No argument

    // FirstType is 'int'
    // Rest is 'double,string,"abc"'
    alias oneOrMore =
          OneOrMore!( int
                    , double, string, "abc"
                    );

    // Types is a 1-element tuple: (int)
    alias zero1 = ZeroOrMore!(int);
    // Types is (int,double,string)
    alias zero2 = ZeroOrMore!(int,double,string);
    // Types is the empty tuple: ()
    alias zero3 = ZeroOrMore!();

    // Selects the one-arg version
    alias mult1 = Multiple!(int);
    // The three args version.
    alias mult2 = Multiple!(int,double,string);
    // Error! No 0-arg version
    //alias mult3 = Multiple!();
}
