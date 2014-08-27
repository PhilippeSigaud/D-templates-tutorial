module differentinstantiations;
import declaration;

alias StoD = Transformer!(string,double);
alias DtoS = Transformer!(double,string);
alias StoI = Transformer!(string,int);
// Now we can use three different functions and three different classes.
