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
		Pokemon:IPokemon, MapX:Float, MapY:Float, ?Shadow:Bool=true)
	{
		Pokemon.x = TileMap.x + Pokemon.xOffset + 24 * MapX;
		Pokemon.y = TileMap.y + Pokemon.yOffset + 24 * MapY;
	}
	
}