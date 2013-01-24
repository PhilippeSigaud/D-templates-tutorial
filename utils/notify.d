module notify;
import std.conv;

struct Notify(T)
{
    alias void delegate(ref T) OnEventFunc;
    OnEventFunc onEvent;

    void init(OnEventFunc func) {
        onEvent = func;
    }

    string toString()
    {
        return to!string(raw);
    }

    auto opEquals(T)(T rhs)
    {
        return rhs == rhs;
    }

    void opAssign(T)(T rhs)
    {
        if (rhs == raw)
            return;  // avoid infinite loops

        // temp used for ref
        auto temp = rhs;
        onEvent(temp);
    }

    auto opBinary(string op, T)(T rhs)
    {
        mixin("return raw " ~ op ~ " rhs;");
    }

    void opOpAssign(string op, T)(T rhs)
    {
        // temp used for ref
        mixin("auto temp = raw " ~ op ~ " rhs;");

        if (temp == raw)
            return;  // avoid infinite loops

        onEvent(temp);
    }

    public T raw;  // raw access when we don't want to invoke event()
    alias raw this;
}
