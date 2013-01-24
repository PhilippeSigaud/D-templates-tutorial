module popallfronts;
import std.range, std.algorithm;
import areallranges;

void popAllFronts(Ranges...)(ref Ranges ranges)
    if(areAllRanges!Ranges)
{
    foreach(index, range; ranges)
        ranges[index].popFront; // to get a ref access
}

unittest
{
    auto arr1 = [0,1,2];
    auto arr2 = "Hello, World!";
    auto arr3 = map!"a*a"(arr1);

    popAllFronts(arr1, arr2, arr3);

    assert(arr1 == [1,2]);
    assert(arr2 == "ello, World!");
    assert(equal( arr3, [1,4]));
}
