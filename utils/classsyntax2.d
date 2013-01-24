module classsyntax2;

class Base(T) {}
interface Interface1 {}
interface Interface2(alias fun, bool b) {}

class MyClass(Type, alias fun, bool b = false)
    : Base!(Type), Interface1, Interface2!(fun,b)
{ /*...*/ }
