module internaldeclarations2;
import declaration;

alias Transformer!(double, string) StoD;

void main()
{
    auto s = StoD.transform(3.14159);
    auto m = new StoD.Modificator(1.618); // StoD.Modificator is a class
                                          // storing a double and a string.
}
