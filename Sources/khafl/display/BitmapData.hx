package khafl.display;

import kha.Image;

@:access(khafl.display.BitmapData)
class BitmapData {
    private var __width:Int;
    public var width(get, never):Int;

    private function get_width():Int
    {
        return __width;
    }

    private var __height:Int;
    public var height(get, never):Int;

    private function get_height():Int
    {
        return __height;
    }

    private var __image:Image;

    public function new(width:Int, height:Int) {
        __width = width;
        __height = height;

        __image = Image.create(width, height);
    }

    public function dispose():Void
    {
        __image.unload();
    }

    public static function fromImage(image:Image):BitmapData
    {
        var bitmapData:BitmapData = new BitmapData(image.width, image.height);
        bitmapData.__image = image;
        return bitmapData;
    }
}
