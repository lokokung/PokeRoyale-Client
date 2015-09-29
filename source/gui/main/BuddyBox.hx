package gui.main;

import data.BuddyInstance;
import flixel.group.FlxTypedGroup;
import flixel.FlxBasic;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxColorUtil;
/**
 * ...
 * @author Lokbondo Kung, Celia Zhang
 */
class BuddyBox extends FlxTypedGroup<FlxBasic>
{

	private var _buddyName:String;
	private var _isOnline:Bool;
	private var _x:Int;
	private var _y:Int;
	private var _btnFriend:FlxButton;
	private var _txtName:FlxText;
	
	private var _accentColor:Int = 0x0d3d3b;
	
	public function new(buddy:BuddyInstance, X:Int=0, Y:Int=0) 
	{
		super();
		
		_buddyName = buddy.getBuddyName();
		_isOnline = buddy.getStatus();
		_x = X;
		_y = Y;
		_txtName = new FlxText(_x + 30, _y + 5, 100, _buddyName, 12, true);
		_txtName.color =_accentColor;
		if (_isOnline == true)
		{
			_btnFriend = new FlxButton(_x, _y, "", onlineInteract);
			_btnFriend.loadGraphic(AssetPaths.OnlineFriend__png);
		}
		else 
		{
			_btnFriend = new FlxButton(_x, _y, "", offlineInteract);
			_btnFriend.loadGraphic(AssetPaths.OfflineFriend__png);
		}
		add(_btnFriend);
		add(_txtName);
	}
	
	private function onlineInteract():Void
	{
		trace("online");
	}
	
	private function offlineInteract():Void
	{
		trace("ogglinf");
	}
}