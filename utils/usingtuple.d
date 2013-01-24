module usingtuple;
import std.typecons;

void main()
{
    // tuple1 is a Tuple!(int,double,string)
    auto tuple1 = tuple(1, 3.14159, "abc");
    // tuple2 is a Tuple!(char,char,char)
    auto tuple2 = tuple('a','b','c');
}
