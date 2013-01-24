module usingfields;
import fields;

struct Point {
    mixin Fields!(int, "x", "y", "z", "w");
}

struct Size {
    mixin Fields!(int, "width", "height");
}
