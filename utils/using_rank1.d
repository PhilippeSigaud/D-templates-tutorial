module using_rank1;
import rank1;

static assert(rank!(int)       == 0);
static assert(rank!(int[])     == 1);
static assert(rank!(int[][])   == 2);
static assert(rank!(int[][][]) == 3);

/* It will work for any type, obviously */
struct S {}

static assert(rank!(S)  == 0);
static assert(rank!(S[])== 1);
static assert(rank!(S*) == 0);
