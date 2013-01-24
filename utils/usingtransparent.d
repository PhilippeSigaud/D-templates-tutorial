module usingtransparent;
import transp;

void main()
{
    auto i = transparent(10);
    assert(i == 10); // equality testing

    i = 1; // Assignment from an int

    ++i; // ++ acts on i.value
    assert(i == 2);

    // int-accepting function
    int foo(int ii) { return ii+1;}

    assert(foo(i) == 3); // function calls

    int trueInt = i; // transmits its value

    assert(trueInt == 2);
    assert(i == 2);
    assert(i == trueInt);

    // Successive calls all collapse into one Transparent.
    i = transparent(transparent(i));
}
