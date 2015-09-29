package gui.main;
import data.UserData;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class UserHeader extends FlxTypedGroup<FlxSprite>
{
	private var playerName:String;
	private var gold:Int;
	private var _nameTitle:FlxText;
	private var _bg:FlxSprite;
	
	private var _accentColor:Int = 0x0d3d3b;
	
	public function new(user:UserData) 
	{
		super();
		
		playerName = user.getPlayerName();
		gold = user.getGold();
		
		_bg = new FlxSprite(0, 0, AssetPaths.UserHeaderPlainGrey__png);
		add(_bg);
		
		_nameTitle = new FlxText(250, 30, 100, playerName, 15, true);
		_nameTitle.color = _accentColor;
		add(_nameTitle);
	}
	
}