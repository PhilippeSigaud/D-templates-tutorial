module checkedinheritance;
import superlist;
import interfacelist;

template CheckedInheritance(Base)
{
    alias CheckedImpl!(Base).Result CheckedInheritance;
}

template CheckedImpl(Base)
{
    /* Rewrite the
}

// It works!
class NoError : CheckedInheritance!(MyClass) { /*...*/ }
