package khafl.text;
class TextFormat {

    public var align:TextFormatAlign;
    public var blockIndent:Null<Int>;
    public var bold:Null<Bool>;
    public var bullet:Null<Bool>;
    public var color:Null<Int>;
    public var font:String;
    public var indent:Null<Int>;
    public var italic:Null<Bool>;
    public var kerning:Null<Bool>;
    public var leading:Null<Int>;
    public var leftMargin:Null<Int>;
    public var letterSpacing:Null<Float>;
    public var rightMargin:Null<Int>;
    public var size:Null<Int>;
    public var tabStops:Array<Int>;
    public var target:String;
    public var underline:Null<Bool>;
    public var url:String;

    public function new(font:String = null, size:Null<Int> = null, color:Null<Int> = null, bold:Null<Bool> = null, italic:Null<Bool> = null, underline:Null<Bool> = null, url:String = null, target:String = null, align:TextFormatAlign = null, leftMargin:Null<Int> = null, rightMargin:Null<Int> = null, indent:Null<Int> = null, leading:Null<Int> = null)
    {
        this.font = font;
        this.size = size;
        this.color = color;
        this.bold = bold;
        this.italic = italic;
        this.underline = underline;
        this.url = url;
        this.target = target;
        this.align = align;
        this.leftMargin = leftMargin;
        this.rightMargin = rightMargin;
        this.indent = indent;
        this.leading = leading;
    }

    public function clone():TextFormat
    {
        var newFormat = new TextFormat(font, size, color, bold, italic, underline, url, target);

        newFormat.align = align;
        newFormat.leftMargin = leftMargin;
        newFormat.rightMargin = rightMargin;
        newFormat.indent = indent;
        newFormat.leading = leading;

        newFormat.blockIndent = blockIndent;
        newFormat.bullet = bullet;
        newFormat.kerning = kerning;
        newFormat.letterSpacing = letterSpacing;
        newFormat.tabStops = tabStops;

        return newFormat;
    }
}
