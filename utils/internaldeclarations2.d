module internaldeclarations2;
import declaration;

alias DtoS = Transformer!(double, string);

void main()
{
    auto s = DtoS.transform(3.14159);
    auto m = new DtoS.Modificator(1.618); // DtoS.Modificator is a class
                                          // storing a double and a string.
}
