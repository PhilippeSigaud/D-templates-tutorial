module mystruct1;

template MyStruct(string name)
{
    enum string MyStruct = "struct " ~ name
                         ~ " { "
                         ~ "/+ some code +/"
                         ~ " }";
}

// For example, with name == "First", it will return
//   "struct First { /+ some code +/ }"
//
