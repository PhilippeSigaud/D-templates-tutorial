module allmembersmodule;
import std.algorithm;
import std.compiler;

// Huuuge list of names
enum algos = [__traits(allMembers, std.algorithm)];
// A bit shorter
enum compiler = [__traits(allMembers, std.compiler)];

void main()
{
    assert(compiler == ["object", "name",
                        "Vendor", "vendor",
                        "version_major", "version_minor",
                        "D_major", "D_minor"]);
}
