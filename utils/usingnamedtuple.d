module usingnamedtuple;
import namedtuple;

void main()
{
    auto myCounter = tuple!("counter", "name")
                           (-1, "Who's his Daddy's counter?");

    myCounter.counter = 1;

    // Or even:
    alias tuple!("counter", "name") makeCounter;

    auto c1 = makeCounter(0, "I count ints!");
    auto c2 = makeCounter("Hello", "I'm a strange one, using strings");

    c2.counter ~= " World!";
}
