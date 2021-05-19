package khafl.display;
import kha.Framebuffer;
@:access(khafl.display.BitmapData)
class Bitmap extends DisplayObject {
    public var bitmapData:BitmapData;

    public function new(bitmapData:BitmapData = null) {
        super();
        this.bitmapData = bitmapData;
    }

    override private function __render(framebuffer:Framebuffer):Void
    {
        var g = framebuffer.g2;
        g.drawImage(bitmapData.__image, __worldX, __worldY);
    }
}
