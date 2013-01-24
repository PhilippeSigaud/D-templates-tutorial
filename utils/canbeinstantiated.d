module canbeinstantiated;

template CanBeInstantiatedWith(alias templateName, Types...)
{
    // is templateName!(Types) a valid type?
    static if (is( templateName!(Types) ResultType ))
    // here you can use ResultType (== templateName!(Types))
        alias ResultType CanBeInstantiatedWith;
    else
        alias void       CanBeInstantiatedWith;
}
