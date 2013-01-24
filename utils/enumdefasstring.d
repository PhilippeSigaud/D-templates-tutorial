module enumdefasstring;

string EnumDefAsString(T)()
if (is(T == enum))
{
   string result = "";
   foreach (e; __traits(allMembers, T))
       result ~= e ~ " = T." ~ e ~ ",";
   return result;
}
