module stringinterpolation;
import std.conv;

template interpolate(string code)
{
    string interpolate(Args...)(Args args) {
        string[] stringified;
        foreach(index, arg; args) stringified ~= to!string(arg);

        string result;
        int i;
        int zero = to!int('0');

        while (i < code.length) {
            if (code[i] == '#') {
                int j = 1;
                int index;
                while (i+j < code.length
                    && to!int(code[i+j])-zero >= 0
                    && to!int(code[i+j])-zero <= 9)
                {
                    index = index*10 + to!int(code[i+j])-zero;
                    ++j;
                }

                result ~= stringified[index];
                i += j;
            }
            else {
                result ~= code[i];
                ++i;
            }
        }

        return result;
    }
}
