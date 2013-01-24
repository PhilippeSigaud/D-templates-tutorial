module gobbler;

struct Gobbler(T...)
{
    alias T Types;
    T store;
    Gobbler!(T, U) opBinary(string op, U)(U u) if (op == "~")
    {
        return Gobbler!(T, U)(store, u);
    }
}

Gobbler!() gobble() { return Gobbler!()();}
