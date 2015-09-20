package sprites.maps;

import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class MapFactory
{

	public function new() 
	{
		
	}
	
	public function makeMap(ogmoMap:Dynamic, tileSet:Dynamic, layerName:String):FlxTilemap
	{
		var mapLoader = new FlxOgmoLoader(ogmoMap);
		var map = mapLoader.loadTilemap(tileSet, 24, 24, layerName);
		return map;
	}
	
}