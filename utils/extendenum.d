module extendenum;
import enumdefasstring;

template ExtendEnum(T, string s)
   if (is(T == enum) &&
   is(typeof({mixin("enum a{"~s~"}");})))
{
   mixin(
   "enum ExtendEnum {"
   ~ EnumDefAsString!T()
   ~ s
   ~ "}");
}
