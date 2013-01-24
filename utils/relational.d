module relational;
import std.traits;
import std.typetuple;
import std.typecons;
import std.range;
import std.conv;
import isastringliteral;
import istype;
import half;
import interleave;

struct Entry(Data...)
if ( (Data.length % 2 == 0)
  && (allSatisfy!(isAStringLiteral, Half!Data))
  && (allSatisfy!(isType, Half!(Data[1..$], void))))
{
    alias Half!Data Headers;
    alias Half!(Data[1..$], void) Values;
    alias data this;

    Tuple!(Interleave!(Values).With!(Headers)) data;

    this(Values values)
    {
        foreach(i, Unused; Values) data[i] = values[i];
    }

    string toString() @property
    {
        string s = "[";
        foreach(i, Unused; Values)
            s ~= Headers[i] ~ ":" ~ to!string(data[i]) ~ ", ";
        return s[0..$-2] ~ "]";
    }
}

template entry(Headers...)
if (allSatisfy!(isAStringLiteral, Headers))
{
    Entry!(Interleave!(Headers).With!(Values)) entry(Values...)(Values values)
    if (Values.length == Headers.length)
    {
        return typeof(return)(values);
    }
}

template isEntry(E)
{
    enum isEntry = __traits(compiles,
                     {
                          void fun(T...)(Entry!T e) {}
                          fun(E.init);
                     });
}

auto rename(string from, string to, E)(E e)
if (isEntry!E)
{
    enum index = staticIndexOf!(from, E.Headers);
    static if (index == -1)
        static assert(false, "Bad index in rename: no header called "
                             ~ from ~ " in " ~ E.Headers.stringof);
    else
        return entry!(E.Headers[0..index],
                      to,
                      E.Headers[index+1..$])(e.data.expand);
}

auto rename(string from, string to, D)(D db)
if (isDatabase!D)
{
    ReturnType!(rename!(from, to, ElementType!D))[] result;
    foreach(i, elem; db)
        result ~= rename!(from, to)(elem);
    return result;
}


template isDatabase(D)
{
    static if (isDynamicArray!D && isEntry!(ElementType!D))
        enum bool isDatabase = true;
    else
        enum bool isDatabase = false;
}

template isSomeHeader(E)
if (isEntry!E)
{
    template isSomeHeader(string s)
    {
        static if (staticIndexOf!(s, E.Headers) != -1)
            enum bool isSomeHeader = true;
        else
            enum bool isSomeHeader = false;
    }
}

template HeaderValue(E)
if (isEntry!E)
{
    template HeaderValue(string header)
    if (staticIndexOf!(header, E.Headers) != -1)
    {
        alias TypeTuple!(header, E.Values[staticIndexOf!(header, E.Headers)])
              HeaderValue;
    }
}

template project(Headers...)
if (Headers.length > 0)
{
    auto project(E)(E e)
    {
        static if (isEntry!E && allSatisfy!(isSomeHeader!E, Headers))
        {
            alias staticMap!(HeaderValue!E, Headers)
                  HeadersAndValues;
            Entry!(HeadersAndValues) result;
            foreach(i, Unused; Headers)
                mixin("result." ~ Headers[i] ~ " = e." ~ Headers[i] ~ ";");
            return result;
        }
        else static if (isDatabase!E
                     && allSatisfy!(isSomeHeader!(ElementType!E), Headers))
        {
            alias staticMap!(HeaderValue!(ElementType!E), Headers)
                  HeadersAndValues;

            Entry!(HeadersAndValues)[] result;
            Entry!(HeadersAndValues)   elem;

            foreach(i,Unused; e)
            {
                foreach(j, Unused2; Headers)
                    mixin("elem." ~ Headers[j] ~ " = e[i]." ~ Headers[j] ~ ";");
                result ~= elem;
            }
            return result;
        }
        else
            static assert(0, "Cannot project on " ~ Headers.stringof[5..$]
                           ~ " for type " ~ E.stringof);
    }
}
