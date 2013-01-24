module mystruct3;

template MyStruct(string name)
{
    alias MyStructImpl!(name).result MyStruct;
}

template MyStructImpl(string name)
{
mixin("struct " ~ name
    ~ " {"
    ~ "/* some code */"
    ~ " }\n"
    ~ "alias " ~ name ~ " result;");
}
