module def;

template Default(T = int, bool flag = false)
{
    static if (flag)
        alias T Default;
    else
        alias void Default;
}

alias Default!(double) D1;       // Instantiate Default!(double, false)
alias Default!(double, true) D2; // Instantiate Default!(double, true) (Doh!)
alias Default!() D3;             // Instantiate Default!(int, false)
