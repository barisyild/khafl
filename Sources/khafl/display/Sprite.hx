package khafl.display;
import kha.Framebuffer;
class Sprite extends DisplayObjectContainer {
    public function new() {
        super();
    }

    override private function __render(framebuffer:Framebuffer):Void {
        //TODO: render graphics
        super.__render(framebuffer);
    }
}
