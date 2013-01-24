module sortingnetwork;

int ceilLog2(int n)
{
    int i;
    if ((n & (n-1)) == 0) i = -1;
    while (n > 0) { ++i; n/= 2;}
    return i;
}

/**
 * Given a length n, returns an array of indices pairs
 * corresponding to a sorting network for length n.
 * Looks a bit like C code, isn't it?
 */
int[2][] sortingNetwork(int n)
{
    int[2][] network;
    auto t = ceilLog2(n);
    auto p = 1 << (t-1);
    while (p > 0)
    {
        auto q = 1 << (t-1);
        auto r = 0;
        auto d = p;
        while (d > 0)
        {
            for(int i = 0; i<=(n-d-1); ++i)
            {
                if (r == (i & p)) network ~= [i, i+d];
            }
            d = q-p;
            q /= 2;
            r = p;
        }
        p /= 2;
    }
    return network;
}
