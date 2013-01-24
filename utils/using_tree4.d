module using_tree4;
import std.conv;
import tree4;

int addOne(int a) { return a+1;}

void main()
{
    auto t0 = tree(0);
    auto t1 = tree(1, [t0,t0]);
    auto t2 = tree(2, [t1, t0, tree(3)]);

/* t2 is       2
             / | \
            1  0  3
           / \
          0   0
*/

    // t2 is a Tree!(int)
    static assert(is( t2.Type == int ));

    // Adding one to all values

    auto t3 = t2.map!(addOne);

/* t3 is       3
             / | \
            2  1  4
           / \
          1   1
*/

    assert(t3.value == 3);

    // Converting all values to strings
    auto ts = t2.map!(to!string); // we convert every value into a string;

/* ts is      "2"
             / | \
           "1""0""3"
           / \
         "0"  "0"
*/

    assert(is( ts.Type == string ));
    assert(ts.value == "2");
}
