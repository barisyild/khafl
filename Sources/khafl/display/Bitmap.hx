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

        if(__worldScaleX == 1.0 && __worldScaleY == 1.0)
        {
            g.drawImage(bitmapData.__image, __worldX, __worldY);
        }else{
            g.drawScaledImage(bitmapData.__image, __worldX, __worldY, bitmapData.width * __worldScaleX, bitmapData.height * __worldScaleY);
        }
    }
}
