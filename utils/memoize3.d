module memoize3;
import memoize2;

// No runtime arg -> always store
Memoize!(fun, Storing.always, Discarding.all)
memoize(alias fun)()
{
    Memoize!(fun,
             Storing.always,
             Discarding.all) result;
    return result;
}

// One runtime size_t arg -> maximum store / discarding all
Memoize!(fun, Storing.maximum, Discarding.all)
memoize(alias fun)(size_t max)
{
    Memoize!(fun,
             Storing.maximum,
             Discarding.all) result;
    result.maxNumStored = max;
    return result;
}

// Two runtime args (size_t, double) -> maximum store / discarding a fraction
Memoize!(fun, Storing.maximum, Discarding.fraction)
memoize(alias fun)(size_t max, double fraction)
{
    Memoize!(fun,
             Storing.maximum,
             Discarding.fraction) result;
    result.maxNumStored = max;
    result.fraction = fraction;
    return result;
}

// One compile-time argument (discarding oldest), one runtime argument (max)
Memoize!(fun, Storing.maximum, discarding)
memoize(alias fun, Discarding discarding = Discarding.oldest)
(size_t max)
{
    Memoize!(fun,
             Storing.maximum,
             Discarding.oldest) result;
    result.maxNumStored = max;
    return result;
}
