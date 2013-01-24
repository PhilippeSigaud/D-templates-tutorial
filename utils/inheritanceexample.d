/**
 * Timon Gehr timon.gehr@gmx.ch via puremagic.com
 */
module inheritanceexample;

import std.stdio;

abstract class Cell(T)
{
    abstract void set(T value);
    abstract const(T) get();
private:
    T field;
}

class AddSetter(C: Cell!T,T): C
{
    override void set(T value){field = value;}
}

class AddGetter(C: Cell!T,T): C
{
    override const(T) get(){return field;}
}

class DoubleCell(C: Cell!T,T): C
{
    override void set(T value){super.set(2*value);}
}

class OneUpCell(C: Cell!T,T): C
{
    override void set(T value){super.set(value+1);}
}

class SetterLogger(C:Cell!T,T): C
{
    override void set(T value)
    {
        super.set(value);
        writeln("cell has been set to '",value,"'!");
    }
}

class GetterLogger(C:Cell!T,T): C
{
    override const(T) get()
    {
        auto value = super.get();
        writeln("'",value,"' has been retrieved!");
        return value;
    }
}

// ConcreteCell has a 'true' getter and a 'true' setter
class ConcreteCell(T): AddGetter!(AddSetter!(Cell!T)){}

// OneUpDoubleSetter has a setter that adds 1 to the stored value
// and then doubles it
class OneUpDoubleSetter(T): OneUpCell!(DoubleCell!(AddSetter!(Cell!T))){}

// doubleOneUpSetter has a setter that doubles the stored value and add 1
class DoubleOneUpSetter(T): DoubleCell!(OneUpCell!(AddSetter!(Cell!T))){}

void main()
{
    Cell!string x;
    x = new ConcreteCell!string;
    x.set("hello");
    writeln(x.get());

    Cell!int y;
    y = new SetterLogger!(ConcreteCell!int);
    y.set(123); // prints: "cell has been set to '123'!

    y = new GetterLogger!(DoubleCell!(ConcreteCell!int));
    y.set(1234);
    y.get(); // prints "'2468' has been retrieved!"

    y = new AddGetter!(OneUpDoubleSetter!int);
    y.set(100);
    writeln(y.get()); // prints "202"
    y = new AddGetter!(DoubleOneUpSetter!int);
    y.set(100);
    writeln(y.get()); // prints "201"
}
