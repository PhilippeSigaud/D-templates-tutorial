module flatten1;
import std.algorithm;
import rank2;

auto flatten(Arr)(Arr array)
{
    static if (rank!Arr <= 1)
        return array;
    else
    {
        auto children = map!(.flatten)(array);
        return reduce!"a~b"(children); // concatenate the children
    }
}
