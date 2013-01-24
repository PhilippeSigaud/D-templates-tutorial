module usingmystruct1;
import mystruct1;

mixin(MyStruct!"First");  // creates a new type called First (a struct)
mixin(MyStruct!"Second"); // and another one called Second

void main()
{
    // "First" code was injected right there, in module 'mine'.
    First f1, f2;
    Second s1;

    assert(is( typeof(f1) == First));
}
