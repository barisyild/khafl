package khafl;

import khafl.display.DisplayObject;

//This class was created entirely for OpenFL compatibility.
class Lib {
    public static var current:DisplayObject;

    public static function getTimer():Int {
        return Std.int(kha.System.time * 1000);
    }
}
