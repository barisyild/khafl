package khafl;

import khafl.events.Event;
import kha.Assets;
import khafl.display.Stage;
import khafl.display.DisplayObject;
import kha.Framebuffer;


@:access(khafl.Lib)
@:access(khafl.display.Stage)
class Application {
    private static var __stage:Stage;

    public static function startApp(app:Class<DisplayObject>):Void
    {
        __initializeKHA(app);
    }

    private static function __initializeKHA(app):Void
    {
        trace("Initialize Kha");
        kha.System.init({}, function()
        {
            Assets.loadEverything(function():Void
            {
                __initializeStage();
                __initializeApp(app);

                kha.System.notifyOnRender(function(framebuffer:Framebuffer) {
                    __stage.__enterFrame(new Event(Event.ENTER_FRAME));

                    __stage.__update(null);

                    framebuffer.g2.begin(true, __stage.color); //Clear background with default color.
                    __stage.__render(framebuffer);
                    framebuffer.g2.end();
                });
            });
        });
    }

    private static function __initializeStage():Void
    {
        __stage = new Stage();
    }

    private static function __initializeApp(app:Class<DisplayObject>):Void
    {
        var displayObject:DisplayObject = Type.createInstance(app, []);
        Lib.current = cast displayObject;
        __stage.addChild(displayObject);
    }

}