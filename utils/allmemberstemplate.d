module allmemberstemplate;

class MyClass(T)
{
    T field;
}

static assert([__traits(allMembers, MyClass)] == ["MyClass"]);
