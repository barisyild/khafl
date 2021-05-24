package ;

import khafl.display.FPS;
import khafl.display.TextField;
import khafl.events.Event;
import khafl.display.Bitmap;
import kha.Assets;
import kha.Image;
import khafl.geom.Rectangle;
import khafl.display.BitmapData;
import khafl.display.Tileset;
import khafl.display.Tile;
import khafl.display.Tilemap;
import khafl.display.Sprite;
import khafl.Application;

class Main extends Sprite {

    public static function main() {
        Application.startApp(Main);
    }

    private var tilemap:Tilemap;
    private var bunnyBitmapData:BitmapData;
    private var bunnies:Array<Bunny>;

    private var gravity:Float;
    private var minX:Int;
    private var minY:Int;
    private var maxX:Int;
    private var maxY:Int;

    private var fps:FPS;

    public function new() {
        super();

        bunnies = [];

        minX = 0;
        maxX = 800;
        minY = 0;
        maxY = 600;
        gravity = 0.5;

        bunnyBitmapData = BitmapData.fromImage(Assets.images.wabbit_alpha);
        var bitmap = new Bitmap(bunnyBitmapData);

        tilemap = new Tilemap();
        tilemap.addEventListener(Event.ENTER_FRAME, onEnterFrame);
        addChild(tilemap);

        addBunnies(10000);


        fps = new FPS();
        addChild(fps);


        trace("bunnies: " + bunnies.length);
    }

    private function addBunnies(size:Int = 100)
    {
        for(i in 0...size)
        {
            addBunny();
        }
    }

    private function addBunny()
    {
        var bunny:Bunny = new Bunny();
        bunny.tileset = new Tileset(bunnyBitmapData, [new Rectangle(0, 0, bunnyBitmapData.width, bunnyBitmapData.height)]);
        bunny.x = 0;
        bunny.y = 0;
        bunny.speedX = Math.random () * 5;
        bunny.speedY = (Math.random () * 5) - 2.5;
        //bunny.scaleX = bunny.scaleY = 50;
        bunnies.push(bunny);

        tilemap.addTile(bunny);
    }

    private function onEnterFrame(e:Event):Void
    {
        fps.update();

        var bunny:Bunny;

        for (i in 0...bunnies.length) {

            bunny = bunnies[i];

            bunny.x += bunny.speedX;
            bunny.y += bunny.speedY;
            bunny.speedY += gravity;

            if (bunny.x > maxX) {

                bunny.speedX *= -1;
                bunny.x = maxX;

            } else if (bunny.x < minX) {

                bunny.speedX *= -1;
                bunny.x = minX;

            }

            if (bunny.y > maxY) {

                bunny.speedY *= -0.8;
                bunny.y = maxY;

                if (Math.random () > 0.5) {

                    bunny.speedY -= 3 + Math.random () * 4;

                }

            } else if (bunny.y < minY) {

                bunny.speedY = 0;
                bunny.y = minY;

            }
        }
    }
}
