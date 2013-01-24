module usingnotify;
import std.stdio;
import usingfields;
import notify;

class Widget
{
    this()
    {
        point.init((ref Point pt) { writefln("changed point to %s", pt); });
        size.init((ref Size sz)   { writefln("changed size to %s", sz); });
    }

    Notify!Point point;
    Notify!Size size;
}
