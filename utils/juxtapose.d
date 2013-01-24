module juxtapose;
import juxtaposehelper;

template juxtapose(Funs...)
{
    Tuple!(staticFilter!(isNotVoid, ReturnTypes!Funs))
    juxtapose(ParameterTypeTuples!Funs params)
    {
        typeof(return) result;
        alias SumOfArities!Funs arities;
        alias SumOfReturns!Funs returns;
        foreach(i, Fun; Funs)
        {
            enum firstParam = arities[i];
            enum lastParam = firstParam + arity!(Fun);
            static if (returns[i] != returns[i+1])
                result.field[returns[i]] = Fun(params[firstParam..lastParam]);
        }
        return result;
    }
}
