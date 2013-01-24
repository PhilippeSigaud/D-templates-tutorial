module getset3;
import std.conv;

enum GetSet { no, yes}

string priv(string type, string index)
{
    return
    "private "~type~" value"~index~";\n"
  ~ type~" get"~index~"() @property { return value"~index~";}\n"
  ~ "void set"~index~"("~type~" _value) { value"~index~" = _value;}";
}

string pub(string type, string index)
{
    return type ~ "value" ~ index ~ ";";
}

string GenerateS(GetSet getset = GetSet.no, T...)()
{
    string result;
    foreach(index, Type; T)
        static if (getset == GetSet.yes)
             result ~= priv(Type.stringof, to!string(index));
        else
            result ~= pub(Type.stringof, to!string(index));
    return result;
}

struct S(GetSet getset = GetSet.no, T...)
{
    mixin(GenerateS!(getset,T));
}

void main()
{
    S!(GetSet.yes, int, string, int) gs;

/* Generates:
struct S!(GetSet.yes, int, string, int)
{
    private int value0;
    int get0() @property { return value0;}
    void set0(int _value) { value0 = _value;}

    private string value1;
    string get1() @property { return value1;}
    void set1(string _value) { value1 = _value;}

    private int value2;
    int get2() @property { return value2;}
    void set2(int _value) { value2 = _value;}
}
*/

    gs.set1("abc");
    assert(gs.get1 == "abc");
}
