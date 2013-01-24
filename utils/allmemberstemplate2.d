module allmemberstemplate2;
import allmemberstemplate;

static assert([__traits(allMembers, MyClass!int)]
           == ["field", "toString", "toHash", "opCmp",
               "opEquals", "Monitor", "factory"]);
