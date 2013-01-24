module staticswitch;

template staticSwitch(List...) // List[0] is the value commanding the switching
                               // It can be a type or a symbol.
{
    static if (List.length == 1) // No slot left: error
        static assert(0, "StaticSwitch: no match for " ~ List[0].stringof);
    else static if (List.length == 2) // One slot left: default case
        enum staticSwitch = List[1];
    else static if (is(List[0] == List[1]) // Comparison on types
                || (  !is(List[0])         // Comparison on values
                   && !is(List[1])
                   && is(typeof(List[0] == List[1]))
                   && (List[0] == List[1])))
        enum staticSwitch = List[2];
    else
        enum staticSwitch = staticSwitch!(List[0], List[3..$]);
}
