package khafl.events;
class Event {
    public static inline var ENTER_FRAME:String = "enterFrame";

    public var bubbles(default, null):Bool;
    public var cancelable(default, null):Bool;
    public var type(default, null):String;

    public function new(type:String, bubbles:Bool = false, cancelable:Bool = false)
    {
        this.type = type;
        this.bubbles = bubbles;
        this.cancelable = cancelable;
    }
}
