module makemember;
public import member;
import nameof;

template MakeMember(alias member)
{
    mixin( "alias Member!(\""
         ~ nameOf!member
         ~ "\", typeof(member)) MakeMember;");
}

template MakeNamedMember(string name)
{
    template MakeNamedMember(alias member)
    {
        mixin( "alias Member!(\""
             ~ name
             ~ "\", typeof(member)) MakeNamedMember;");
    }
}
