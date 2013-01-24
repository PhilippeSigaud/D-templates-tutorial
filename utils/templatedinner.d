module templatedinner;

struct Outer(O)
{
    O o;

    struct Inner(I)
    {
        O o;
        I i;
    }

    auto inner(I)(I i) { return Inner!(I)(o,i);}
}

auto outer(O)(O o) { return Outer!(O)(o);}

void main()
{
    auto o = outer(1); // o is an Outer!int;
    auto i = o.inner("abc"); // Outer.Outer!(int).Inner.Inner!(string)
}
