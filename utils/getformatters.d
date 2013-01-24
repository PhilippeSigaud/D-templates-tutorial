module getformatters;
import std.conv;
import std.traits;

string getFormatters(S)(S s) if (isSomeString!S)
{
    dstring ds = to!dstring(s);
    bool afterPercent = false;
    bool error;
    string result = "alias TypeTuple!(";
    foreach(elem; ds)
    {
        if (error) break;
        if (afterPercent)
        {
            switch (elem)
            {
                case '%':
                    afterPercent = false;
                    break;
                case 'd':
                case 'i':
                    result ~= "isIntegral,"; // integers
                    afterPercent = false;
                    break;
                case 'u':
                case 'x':
                case 'X':
                case 'o':
                    result ~= "isUnsigned,"; // unsigned integral
                    afterPercent = false;
                    break;
                case 'f':
                case 'F':
                case 'e':
                case 'E':
                case 'g':
                case 'G':
                    result ~= "isFloatingPoint,"; // floating point
                    afterPercent = false;
                    break;
                case 'c':
                    result ~= "isSomeChar,"; // char
                    afterPercent = false;
                    break;
                case 's':
                    result ~= "isAnyType,"; // any string-convertible type
                    afterPercent = false;
                    break;
                /* flags, width, */
                case '+':
                case '-':
                case '#':
                case '.':
                case ' ':
                case '0':
                    ..
                case '9':
                    break;
                default:
                    error = true; // Error!
                    break;
            }
        }
        else
        {
            if (elem == '%') afterPercent = true;
        }
    }

    // Get rid of the last comma:
    if (result.length > 17) result = result[0..$-1];
    // finishing the alias code
    result ~= ") ArgsChecks;";

    if (afterPercent // finished the string but still in "afterPercent" mode
     || error)
        result = "static assert(0, \"Bad format string: \" ~ a);";

    return result;
}
