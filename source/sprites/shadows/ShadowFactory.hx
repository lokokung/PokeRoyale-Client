package sprites.shadows;
import flixel.FlxSprite;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class ShadowFactory
{
	
	public var xOffset:Float = 0;
	public var yOffset:Float = 0;

	public function new() 
	{
		
	}
	
	public function makeShadow(ShadowSize:Int):FlxSprite
	{
		var shadowSprite:FlxSprite = new FlxSprite(0, 0);
		shadowSprite.loadGraphic(AssetPaths.Shadows__png, 22, 8);
		shadowSprite.frame = ShadowSize;
		return shadowSprite;
	}
	
}