package khafl.geom;
import kha.FastFloat;
class Rectangle {
    public var x:FastFloat;
    public var y:FastFloat;
    public var width:FastFloat;
    public var height:FastFloat;

    public function new(x:FastFloat = 0.0, y:FastFloat = 0.0, width:FastFloat = 0.0, height:FastFloat = 0.0) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
}
