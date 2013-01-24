module makecounter;
import std.traits;
import std.typecons;

auto makeCounter(T)(T _counter = T.init) if (isNumeric!T)
{
    bool sense = true;
    auto changeSense = () { sense = !sense;};
    auto inc = (T increment)
               { _counter += (sense ? increment : -increment); };
    auto dec = (T decrement)
               { _counter += (sense ? -decrement : decrement); };
    auto counter = (){ return _counter;};

    return Tuple!( typeof(changeSense), "changeSense"
                 , typeof(inc), "inc"
                 , typeof(dec), "dec"
                 , typeof(counter), "counter")
                 (changeSense, inc, dec, counter);
}
