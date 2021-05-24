package khafl.display;
import kha.Framebuffer;
class Stage extends DisplayObjectContainer {
    public var color:Int = 0xffffff;

    public function new() {
        super();
    }

    override private function __update(parent:DisplayObject):Void {
        __worldX = this.x;
        __worldY = this.y;
        __worldScaleX = this.scaleX;
        __worldScaleY = this.scaleY;

        for(children in __children)
        {
            children.__update(this);
        }
    }
}
