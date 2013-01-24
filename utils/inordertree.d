module inordertree;
import std.algorithm;
import tree5;

T[] inOrderL(T, S)(T value, S seed)
{
    return [value] ~ seed;
}

T[] inOrderB(T)(T value, T[][] inOrderChildren)
{
    return [value] ~ reduce!"a~b"(inOrderChildren);
}

void main()
{
    auto t0 = tree(0);
    auto t1 = tree(1, [t0,t0]);
    auto t2 = tree(2, [t1, t0, tree(3)]);

    int[] seed; // empty array
    auto inOrder = t2.fold!(inOrderL, inOrderB)(seed);
    assert(inOrder == [2, 1, 0, 0, 0, 3]);
}
