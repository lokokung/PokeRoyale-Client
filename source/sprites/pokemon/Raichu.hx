package sprites.pokemon;
import flixel.FlxSprite;
import flixel.FlxObject;
import sprites.AbstractPokemon;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class Raichu extends AbstractPokemon implements IPokemon
{
	public var xOffset:Float;
	public var yOffset:Float;
	public var shadowSize:Int;

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		xOffset = -3;
		yOffset = -6;
		shadowSize = 0;
		
		loadGraphic(PokeSpritePaths.Raichu_026_Sprites__png, true, 30, 30);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		
		animation.add("lr", [7, 6, 7, 8], 2, true);
		animation.add("u", [4, 3, 4, 5], 2, true);
		animation.add("d", [1, 0, 1, 2], 2, true);
		animation.add("hurt_d", [0, 9, 1, 9, 2, 9], 2, true);
		animation.add("hurt_u", [3, 10, 4, 10, 5, 10], 2, true);
		animation.add("hurt_lr", [6, 11, 7, 11, 8, 11], 2, true);

		
		animation.play("hurt_lr");
	}
	
}