module hasarithmeticoperations;

template hasArithmeticOperations(Type)
{
    static if (__traits(compiles,
                       {
                           Type t, result;
                           result = t + t; // addition
                           result = t - t; // substraction
                           result = t * t; // multiplication
                           result = t / t; // division
                           result = +t;    // unary +
                           result = -t;    // unary -
                       }))
        enum bool hasArithmeticOperations = true;
    else
        enum bool hasArithmeticOperations = false;
}

static assert(hasArithmeticOperations!int);
static assert(hasArithmeticOperations!double);

struct S {}
static assert(!hasArithmeticOperations!S);
