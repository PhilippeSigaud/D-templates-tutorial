module pair;

template pair(T)
{
    // template 'pair' declares only a 'pair' member
    T[] pair(T t) { return [t,t];}
}

auto array = pair!(int)(1);  // no need to do pair!(int).pair(1)
