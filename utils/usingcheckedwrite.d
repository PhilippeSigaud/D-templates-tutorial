module usingcheckedwrite;
import checkedwrite;

void main()
{
    cwritefln!"For sample #%d, the results are (%s, %f)"( 0, "foo", 3.14); // OK

 // NOK: bad number or args: waited for 3 args, got 2.
 // cwritefln!"For sample #%d, the results are (%s, %f)"( 0, "foo");

 // NOK: arg #3 of type double does not verify check isFloatingPoint
 // cwritefln!"For sample #%d, the results are (%s, %f)"( 0, 3.14, "foo");
}
