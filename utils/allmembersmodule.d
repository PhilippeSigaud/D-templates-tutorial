module allmembersmodule;
import std.algorithm;
import std.ctype;

// Huuuge list of names
enum algos = [__traits(allMembers, std.algorithm)];
// A bit shorter
enum ctypes = [__traits(allMembers, std.ctype)];

void main()
{
    assert(ctypes == ["object","std","isalnum","isalpha",
                      "iscntrl","isdigit","islower",
                      "ispunct","isspace","isupper","isxdigit",
                      "isgraph","isprint","isascii","tolower",
                      "toupper","_ctype"]);
}
