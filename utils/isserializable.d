module isserializable;

template isSerializable(Type)
{
    static if (__traits(compiles, {
                                   Type type;
                                   size_t num = type.serialize;
                                  }))
        enum bool isSerializable = true;
    else
        enum bool isSerializable = false;
}
