module maponalias;
import std.typetuple;

/**
 * Maps the Mapper template on the alias list.
 */
template MapOnAlias(alias Mapper, alias current, Rest...)
{
    static if (Rest.length)
        alias TypeTuple!(Mapper!current, MapOnAlias!(Mapper, Rest)) MapOnAlias;
    else
        alias Mapper!current MapOnAlias;
}

template MapOnAlias(alias Mapper)
{
    alias TypeTuple!() MapOnAlias;
}
