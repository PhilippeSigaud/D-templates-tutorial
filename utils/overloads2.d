module overloads2;
import std.typetuple;
import makemember;

/**
 * Gets the overloads of a given member, as a Member type tuple.
 */
template Overloads(alias a, string member)
{
    // a.member is a method
    static if (__traits(compiles, __traits(getOverloads, a, member))
        && __traits(getOverloads, a, member).length > 0)
        alias staticMap!(MakeNamedMember!(member), __traits(getOverloads, a, member))
              Overloads;
    else // field or alias
    // a.member is a field, or a symbol alias
        static if (is(typeof(__traits(getMember, a, member))))
            mixin( "alias Member!(\""
                 ~ member
                 ~ "\", typeof(__traits(getMember, a, member))) Overloads;");
    // a.member is a type alias
    else static if (mixin( "is(Member!(\""
                         ~ member
                         ~ "\", __traits(getMember, a, member)))"))
        mixin( "alias Member!(\""
             ~ member
             ~ "\", __traits(getMember, a, member)) Overloads;");
    // a.member is template
    else
        mixin( "alias Member!(\""
             ~ member
             ~ "\", void) Overloads;");
}
