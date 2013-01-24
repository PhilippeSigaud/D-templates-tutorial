module networksort;
import std.range;
import std.functional;
import std.exception;
import buildsortingcode;
import stringinterpolation;

template networkSort(size_t l)
{
    mixin(
interpolate!(
    "void networkSort(alias pred = \"a < b\", R)(ref R input)
     if (isRandomAccessRange!R)
     {
         enforce(input.length >= #,
                 \"Calling networkSort!# with a range of less than # elements\");
          ElementType!R t1, t2;")(l)
      ~ buildSortingCode!(l)
 ~ "}");
}
