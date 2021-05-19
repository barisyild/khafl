package khafl.display;
import khafl.events.Event;
class FPS extends TextField {
    private var startTime:Int = 0;
    private var framesNumber:Int = 0;

    public function new() {
        super();
    }

    //Source: https://code.tutsplus.com/tutorials/quick-tip-how-to-build-a-frame-rate-counter-in-actionscript-30--active-3479
    public function update():Void
    {
        var currentTime:Float = (khafl.Lib.getTimer() - startTime) / 1000; //Gets the time in seconds since the function is executed

        framesNumber++; //Ads one to the frame counter

        if (currentTime > 1) //If the time in seconds is greater than 1
        {
            text = "FPS: " + (Math.floor((framesNumber/currentTime)*10.0)/10.0); //Calculates the frame rate and displays it in the textfield
            startTime = khafl.Lib.getTimer(); //Reset the start time
            framesNumber = 0; //Reset the number of frames
        }
    }
}