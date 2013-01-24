module fields;
import std.typetuple;
import isastringliteral;

mixin template Fields(T, fields...)
    if (allSatisfy!(isAStringLiteral, fields))
{
    alias typeof(this) This;

    static string __makeFields(T, fields...)()
    {
        string res;
        foreach(field; fields) res ~= T.stringof~ " " ~ field ~ ";\n";
        return res;
    }

    static string __makeOpBinaryFields(string op, fields...)()
    {
        string res;
        foreach(field; fields)
            res ~= "res." ~ field
                 ~ " = this." ~ field ~ op ~ " rhs." ~ field ~ ";\n";
        return res;
    }

    mixin(__makeFields!(T, fields)());

    This opBinary(string op)(This rhs)
    {
        This res;
        mixin(__makeOpBinaryFields!(op, fields)());
        return res;
    }

    void opOpAssign(string op)(This rhs)
    {
        mixin("this = this " ~ op ~ " rhs;");
    }
}
