package khafl.display;

import kha.FastFloat;
import kha.Framebuffer;

@:access(khafl.display.Tile)
@:access(khafl.display.BitmapData)

class Tilemap extends DisplayObject {

    public var __container:TileContainer;
    public var numTiles(get, never):Int;

    private function get_numTiles():Int
    {
        return __container.__length;
    }

    public function new() {
        super();
        __container = new TileContainer();
    }

    public function addTile(tile:Tile):Void
    {
        __container.addTile(tile);
    }

    override private function __render(framebuffer:Framebuffer):Void
    {
        var g = framebuffer.g2;
        __renderTileContainer(framebuffer, __container);
    }

    private inline function __renderTileContainer(framebuffer:Framebuffer, tileContainer:TileContainer):Void
    {
        var id, tileset, rectangleX, rectangleY, rectangleWidth, rectangleHeight;
        for(tile in tileContainer.__children)
        {
            if(tile.__length > 0)
            {
                __renderTileContainer(framebuffer, cast tile);
            }else{
                tileset = tile.tileset;

                id = tile.id;

                rectangleX = tileset.rectData[id];
                rectangleY = tileset.rectData[id+1];
                rectangleWidth = tileset.rectData[id+2];
                rectangleHeight = tileset.rectData[id+3];

                framebuffer.g2.drawSubImage(tile.tileset.bitmapData.__image, __worldX + tile.x, __worldY + tile.y, rectangleX, rectangleY, rectangleWidth, rectangleHeight);
            }
        }
    }
}
