package sprites;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class PokeMapHandler
{

	public function new() 
	{
	}
	
	public function placePokemon(TileMap:FlxTilemap, 
		Pokemon:FlxObject, MapX:Float, MapY:Float)
	{
		Pokemon.x = TileMap.x + 24 * MapX;
		Pokemon.y = TileMap.y + 24 * MapY;
	}
	
}