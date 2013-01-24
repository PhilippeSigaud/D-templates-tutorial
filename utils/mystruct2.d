module mystruct2;

template MyStruct(string name)
{
    alias MyStructImpl!(name).result MyStruct;
}

template MyStructImpl(string name)
{
    enum string code = "struct " ~ name
                     ~ " { "
                     ~ "/+ some code +/"
                     ~ " }";
    mixin(code);
    mixin("alias " ~ name ~ " result;");
}
