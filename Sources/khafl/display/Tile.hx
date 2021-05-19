package khafl.display;
class Tile {
    private var __length:Int;
    public var parent:TileContainer;

    public var id:Int;
    public var x:Float;
    public var y:Float;
    public var tileset:Tileset;

    public function new() {
        __length = 0;
        id = 0;
        x = 0.0;
        y = 0.0;
    }
}
