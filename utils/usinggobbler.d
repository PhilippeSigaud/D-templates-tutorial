module usinggobbler;
import std.typetuple;
import gobbler;

void main()
{
    auto list = gobble ~ 1 ~ "abc" ~ 3.14 ~ "another string!";
    assert(is(list.Types == TypeTuple!(int, string, double, string)));
    assert(list.store[2] == 3.14);
}
