package sprites.pokemon;
import flixel.FlxSprite;
import flixel.FlxObject;
import sprites.AbstractPokemon;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class Pikachu extends AbstractPokemon implements IPokemon
{
	public var xOffset:Float;
	public var yOffset:Float;
	public var shadowSize:Int;

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		xOffset = 0;
		yOffset = -4;
		shadowSize = 0;
		
		loadGraphic(PokeSpritePaths.Pikachu_025_Sprites__png, true, 24, 26);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		
		animation.add("lr", [7, 6, 7, 8], 2, true);
		animation.add("u", [4, 3, 4, 5], 2, true);
		animation.add("d", [1, 0, 1, 2], 2, true);
		
		animation.play("d");
	}
	
}