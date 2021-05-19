package khafl.display;
import kha.FastFloat;
import haxe.ds.Vector;

import khafl.geom.Rectangle;
class Tileset {
    public var bitmapData:BitmapData;
    public var rectData:Array<FastFloat>;

    public function new(bitmapData:BitmapData, rects:Array<Rectangle> = null) {
        this.bitmapData = bitmapData;
        this.rectData = new Array();

        if(rects != null)
        {
            for(i in 0...rects.length)
            {
                addRect(rects[i]);
            }
        }
    }

    public function addRect(rect:Rectangle):Int
    {
        if(rect == null)
            return -1;

        var index:Int = rectData.length * 4;

        rectData[index] = rect.x;
        rectData[index+1] = rect.y;
        rectData[index+2] = rect.width;
        rectData[index+3] = rect.height;

        //TODO: Fix returned value!
        return index;
    }
}
