module usingmemoize1;
import memoize1;

int veryLongCalc(int i, double d, string s)
{
    /* ... cheating here ... */
    return i;
}

void main()
{
    auto vlcMemo = memoize!(veryLongCalc);

   // calculate veryLongCalc(1, 3.14, "abc")
   // takes minutes!
   int res1 = vlcMemo(1, 3.14, "abc");
   int res2 = vlcMemo(2, 2.718, "def");// minutes again!
   int res3 = vlcMemo(1, 3.14, "abc"); // a few ms to get res3
}
