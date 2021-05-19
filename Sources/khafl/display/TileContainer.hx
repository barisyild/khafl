package khafl.display;
class TileContainer extends Tile {
    public var numTiles(get, never):Int;

    @:noCompletion private function get_numTiles():Int
    {
        return __length;
    }

    @:noCompletion private var __children:Array<Tile>;

    public function new() {
        __children = [];

        super();
    }

    public function addTile(tile:Tile):Tile
    {
        return addTileAt(tile, __length);
    }

    public function addTileAt(tile:Tile, index:Int):Tile
    {
        if (tile == null) return null;

        if (tile.parent == this)
        {
            __children.remove(tile);
            __length--;
        }

        __children.insert(index, tile);
        tile.parent = this;
        __length++;

        return tile;
    }

    public function addTiles(tiles:Array<Tile>):Array<Tile>
    {
        for (tile in tiles)
        {
            addTile(tile);
        }

        return tiles;
    }

    public function removeTile(tile:Tile):Tile
    {
        if (tile != null && tile.parent == this)
        {
            tile.parent = null;
            __children.remove(tile);
            __length--;
        }

        return tile;
    }

    public function removeTileAt(index:Int):Tile
    {
        if (index >= 0 && index < numTiles)
        {
            return removeTile(__children[index]);
        }

        return null;
    }

    /**
		Removes all Tile instances from the tile list of the TileContainer instance.
		@param	beginIndex	The beginning position.
		@param	endIndex	The ending position.
	**/
    public function removeTiles(beginIndex:Int = 0, endIndex:Int = 0x7fffffff):Void
    {
        if (beginIndex < 0) beginIndex = 0;
        if (endIndex > __children.length - 1) endIndex = __children.length - 1;


        for(i in beginIndex...endIndex)
        {
            removeTileAt(beginIndex);
        }
    }
}
