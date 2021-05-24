package khafl.display;
import khafl.events.Event;
import kha.Framebuffer;
class DisplayObjectContainer extends InteractiveObject {
    private var __children:Array<DisplayObject>;

    public var __numChildren:Int;
    public var numChildren(get, never):Int;

    private function get_numChildren():Int
    {
        return __numChildren;
    }

    public function new() {
        super();
        __children = [];
        __numChildren = 0;
    }

    override private function __update(parent:DisplayObject):Void {
        if(!visible)
            return;

        __worldX = parent.__worldX + this.x;
        __worldY = parent.__worldY + this.y;
        __worldScaleX = parent.__worldScaleX * this.scaleX;
        __worldScaleY = parent.__worldScaleY * this.scaleY;

        for(children in __children)
        {
            children.__update(parent);
        }
    }

    override private function __render(framebuffer:Framebuffer):Void
    {
        for(children in __children)
        {
            children.__render(framebuffer);
        }
    }

    override private function __enterFrame(event:Event):Void
    {
        super.__enterFrame(event);
        for(children in __children)
        {
            children.__enterFrame(event);
        }
    }

    public function addChild(child:DisplayObject):Void
    {
        addChildAt(child, __numChildren);
    }

    public function addChildAt(child:DisplayObject, index:Int):Void
    {
        if(child == null)
        {
            //TODO: implement TypeError.
            throw "Error #2007: Parameter child must be non-null.";
        }

        child.setStage(stage);

        __children.insert(index, child);
        __numChildren++;
    }

    public function removeChild(child:DisplayObject):DisplayObject
    {
        return removeChildAt(__children.indexOf(child));
    }

    public function removeChildAt(index:Int):DisplayObject
    {
        if (index >= 0 && index < __children.length)
        {
            var child:DisplayObject = __children[index];

            if(Std.isOfType(child, Stage))
            {
                //TODO: change this exception.
                throw "You cannot remove stage.";
            }

            __children.splice(index, 1);
            __numChildren--;

            return child;
        }

        return null;
    }
}
