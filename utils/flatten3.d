module flatten3;
import std.range;

import rank2;

struct Flatten(Range)
{
    alias ElementType!Range    SubRange;
    alias ElementType!SubRange Element;

    Range range;
    SubRange subRange;

    this(Range _range) {
        range = _range;
        if (!range.empty) subRange = range.front;
    }

    Element front() { return subRange.front;}

    bool empty() { return range.empty;}

    void popFront() {
        if (!subRange.empty) subRange.popFront;
        while(subRange.empty && !range.empty) {
            range.popFront;
            if (!range.empty) subRange = range.front;
        }
    }
}
