package sprites;
import flixel.FlxSprite;

/**
 * @author Lokbondo Kung; Celia Zhang
 */
interface IPokemon 
{
	public var x(default, set):Float;
	public var y(default, set):Float;
	public var xOffset:Float;
	public var yOffset:Float;
	public var shadowSize:Int;
	public var shadowSprite:FlxSprite;
}