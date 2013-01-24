module differentinstantiations;
import declaration;

alias Transformer!(string,double) StoD;
alias Transformer!(double,string) DtoS;
alias Transformer!(string,int)    StoI;
// Now we can use three different functions and three different classes.
