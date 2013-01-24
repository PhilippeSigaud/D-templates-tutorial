module using_power;
import repeatedcomposition;

// standard function
string foo(string s) { return s ~ s;}

// function templates. You'll see them soon.
Arr[] makeArray(Arr)(Arr array) { return [array,array];}

void main()
{
   // power!(foo, n) is a function.
   assert(power!(foo, 0)("a") == "a");                // identity function
   assert(power!(foo, 1)("a") == foo("a"));           // "aa"
   assert(power!(foo, 2)("a") == foo(foo("a")));      // "aaaa"
   assert(power!(foo, 3)("a") == foo(foo(foo("a")))); // "aaaaaaaa"

   // It's even better with function templates:
   assert(power!(makeArray, 0)(1) == 1);
   assert(power!(makeArray, 1)(1) == [1,1]);
   assert(power!(makeArray, 2)(1) == [[1,1],[1,1]]);
   assert(power!(makeArray, 3)(1) == [[[1,1],[1,1]],[[1,1],[1,1]]]);
}
