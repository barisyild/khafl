package khafl.display;
import khafl.text.TextFormat;
import kha.Color;
import kha.Assets;
import kha.Font;
import kha.Framebuffer;
class TextField extends InteractiveObject {
    public var text:String;

    private var _defaultTextFormat:TextFormat;
    public var defaultTextFormat(get, set):TextFormat;

    public function get_defaultTextFormat():TextFormat
    {
        return _defaultTextFormat;
    }

    public function set_defaultTextFormat(textFormat:TextFormat):TextFormat
    {
        _defaultTextFormat = textFormat.clone();
        return textFormat;
    }

    public function new() {
        super();
        text = "";
    }

    override private function __render(framebuffer:Framebuffer):Void
    {
        var g = framebuffer.g2;
        g.font = Assets.fonts.roboto_thin;
        g.fontSize = 50;
        g.color = Color.Red;
        g.drawString(text, __worldX, __worldY);

        //Change buffer's color
        g.color = Color.White;
    }
}
