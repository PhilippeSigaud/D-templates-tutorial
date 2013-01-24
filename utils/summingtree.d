module summingtree;
import std.algorithm;
import tree5;

typeof(T.init + S.init)
sumLeaf(T, S)(T value, S seed)
{
    return value + seed;
}

T sumBranch(T)(T value, T[] summedChildren)
{
    return value + reduce!"a+b"(summedChildren);
}

import std.stdio;

void main()
{
    auto t0 = tree(0);
    auto t1 = tree(1, [t0,t0]);
    auto t2 = tree(2, [t1, t0, tree(3)]);

    int sum = t2.fold!(sumLeaf, sumBranch)(0);
    assert(sum == 2 + (1 + 0 + 0) + (0) + (3));
}

