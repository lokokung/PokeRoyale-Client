package sprites;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.tile.FlxTile;
import flixel.tile.FlxTilemap;
import flixel.util.FlxSort;
import sprites.maps.MapFactory;
import sprites.shadows.ShadowFactory;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class PokeMapHandler 
{
	private var _state:FlxState;
	private var _shadowFactory:ShadowFactory;
	private var _map:FlxTilemap;
	private var _mapFactory:MapFactory;
	private var _playerAPokemons:FlxTypedGroup<AbstractPokemon>;
	private var _playerBPokemons:FlxTypedGroup<AbstractPokemon>;
	private var _playerAPokemonShadow:FlxTypedGroup<FlxSprite>;
	private var _playerBPokemonShadow:FlxTypedGroup<FlxSprite>;
	private var _playerAState:Array<Array<AbstractPokemon>>;
	private var _playerBState:Array<Array<AbstractPokemon>>;

	public function new(state:FlxState, shadowFactory:ShadowFactory, 
		mapFactory:MapFactory, mapId:Int=1) 
	{
		this._state = state;
		this._shadowFactory = shadowFactory;
		this._mapFactory = mapFactory;
		this._playerAPokemonShadow = new FlxTypedGroup(15);
		this._playerBPokemonShadow = new FlxTypedGroup(15);
		this._playerAPokemons = new FlxTypedGroup(15);
		this._playerBPokemons = new FlxTypedGroup(15);
		this._playerAState = [for (x in 0...12) [for (y in 0...12) null]];
		this._playerBState = [for (x in 0...12) [for (y in 0...12) null]];
		
		setMap(mapId);
		this._state.add(this._playerAPokemonShadow);
		this._state.add(this.
		this._state.add(this._playerAPokemons);
		this._state.add(this._playerBPokemons);
	}
	
	public function setMap(MapId:Int)
	{
		var newMap:FlxTilemap = null;
		switch (MapId) 
		{
			case 0:
				newMap = null;
			case 1:
				newMap = this._mapFactory.makeMap(
					AssetPaths.map1__oel, AssetPaths.tiles1__png, "tiles");
			default:
		}
		
		if (this._map != null)
		{
			this._state.replace(_map, newMap);
			this._map.destroy();
		}
		else
		{
			this._state.add(newMap);
		}
		this._map = newMap;
	}
	
	public function placePokemon(PokemonId:Int, PlayerId:Int, 
		GridX:Int, GridY:Int, ?Shadow:Bool = true)
	{
		var playerSprites:FlxTypedGroup<AbstractPokemon> = null;
		var playerState:Array<Array<AbstractPokemon>> = null;
		var playerShadows:FlxTypedGroup<FlxSprite> = null;
		switch(PlayerId)
		{
			case 0:
				playerSprites = this._playerAPokemons;
				playerState = this._playerAState;
				playerShadows = this._playerAPokemonShadow;
			case 1:
				playerSprites = this._playerBPokemons;
				playerState = this._playerBState;
				playerShadows = this._playerBPokemonShadow;
		}
		
		var oldPokemon = playerState[GridX][GridY];
		if (oldPokemon != null)
		{
			playerSprites.remove(oldPokemon);
			oldPokemon.destroy();
		}
		
		var newPokemon:IPokemon = PokemonIdMap.idMap.get(PokemonId)(0, 0);
		newPokemon.x = this._map.x + newPokemon.xOffset + 24 * GridX;
		newPokemon.y = this._map.y + newPokemon.yOffset + 24 * GridY;
		playerSprites.add(cast(newPokemon, AbstractPokemon));
		playerSprites.sort(FlxSort.byY, FlxSort.ASCENDING);
		playerState[GridX][GridY] = cast(newPokemon, AbstractPokemon);
		if (Shadow)
		{
			var shadowSprite:FlxSprite = _shadowFactory.makeShadow(newPokemon.shadowSize);
			newPokemon.shadowSprite = shadowSprite;
			
		}
	}
	
}