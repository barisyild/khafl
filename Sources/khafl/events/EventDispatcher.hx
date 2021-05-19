package khafl.events;
class EventDispatcher {
    //TODO: fix lazy implement.

    private var __map:Map<String, Array<Event->Void>>;

    public function new() {
        __map = new Map();
    }

    public function addEventListener(type:String, listener:Event->Void, useCapture:Bool = false, priority:Int = 0, useWeakReference:Bool = false):Void
    {
        var pool:Array<Event->Void>;

        if(__map.exists(type))
        {
            pool = cast __map.get(type);
        }else{
            pool = [];
        }

        pool.push(listener);

        __map.set(type, pool);
    }

    public function removeEventListener(type:String, listener:Event->Void, useCapture:Bool = false):Void
    {
        if(!__map.exists(type))
            return;

        var pool:Array<Event->Void> = cast __map.get(type);

        pool.remove(listener);

        if(pool.length == 1)
        {
            __map.remove(type);
        }else{
            __map.set(type, pool);
        }
    }

    public function dispatchEvent(event:Event):Void
    {
        var type:String = event.type;

        if(!__map.exists(type))
            return;

        var pool:Array<Event->Void> = cast __map.get(type);

        for(callback in pool)
        {
            callback(event);
        }
    }
}
