package khafl.display;
import khafl.events.Event;
import khafl.events.EventDispatcher;
import kha.Framebuffer;
import khafl.geom.Rectangle;
class DisplayObject extends EventDispatcher {
    public var stage(default, null):Stage;

    public var x:Float;
    public var y:Float;
    public var visible:Bool;

    private var __worldX:Float;
    private var __worldY:Float;

    private var __instanceId:Int; //This can be useless for optimizations.

    private static var __lastInstanceId:Int = 0;

    public function new() {
        super();
        __instanceId = __lastInstanceId++;
        x = y = 0.0;
        visible = true;
    }

    private function setStage(stage:Stage):Void
    {
        this.stage = stage;
    }

    private function __update(parent:DisplayObject):Void {
        if(!visible)
            return;

        __worldX = parent.__worldX + this.x;
        __worldY = parent.__worldY + this.y;
    }

    private function __render(framebuffer:Framebuffer):Void {
        //no need to render
    }

    private function __enterFrame(event:Event):Void
    {
        dispatchEvent(event);
    }
}
