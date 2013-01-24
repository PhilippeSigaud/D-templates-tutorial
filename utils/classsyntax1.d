module classsyntax1;

class Base {}
interface Interface1 {}
interface Interface2 {}

class MyClass(Type, alias fun, bool b = false)
    : Base, Interface1, Interface2
{ /*...*/ }
