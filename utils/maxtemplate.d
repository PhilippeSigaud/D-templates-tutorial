module maxtemplate;

template Max(T1, T2)
{
    static if (T1.sizeof >= T2.sizeof)
        alias T1 Max;
    else
        alias T2 Max;
}
