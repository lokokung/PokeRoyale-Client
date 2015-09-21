package states;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import sprites.maps.MapFactory;
import sprites.PokeMapHandler;
import sprites.pokemon.Pikachu;
import sprites.pokemon.Raichu;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class MainState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		var mapFactory = new MapFactory();
		var map = mapFactory.makeMap(AssetPaths.map1__oel, AssetPaths.tiles1__png, "tiles");
		var pika = new Pikachu();
		var rai = new Raichu();
		var mapHandler = new PokeMapHandler();
		mapHandler.placePokemon(map, pika, 11, 11, false);
		mapHandler.placePokemon(map, rai, 10, 11, false);
		add(map);
		add(pika);
		add(rai);
		super.create();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}
	
}