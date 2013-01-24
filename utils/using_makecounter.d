module using_makecounter;
import makecounter;

void main()
{
    auto c = makeCounter(0); // T is int.
    auto c2 = makeCounter!int; // The very same.

    c.inc(5);
    assert(c.counter() == 5);
    c.inc(10);
    assert(c.counter() == 15);
    c.changeSense(); // now each increment will in fact decrement
    c.inc(5);
    assert(c.counter() == 10);
}
