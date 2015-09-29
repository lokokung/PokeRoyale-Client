package states;

import data.BuddyInstance;
import gui.main.BuddyPanel;
import gui.main.MatchPanel;
import gui.main.UserHeader;
import data.MatchInstance;
import data.UserData;
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
	
	private var _fakeUser:UserData;
	private var _fakeBuddy:BuddyInstance;
	private var _fakeBuddy2:BuddyInstance;
	private var _fakeMatch:MatchInstance;
	private var _fakeMatch2:MatchInstance;
	private var _userHeader:UserHeader;
	private var _bg:FlxSprite;
	private var _buddyPanel:BuddyPanel;
	private var _matchPanel:MatchPanel;
	
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		_fakeBuddy = new BuddyInstance(2, "Rodmy", false);
		_fakeBuddy2 = new BuddyInstance(3, "Albert", true);
		_fakeMatch = new MatchInstance(2, "Rodmy", 1, [1], Date.fromString("2015-09-20 02:40:00").getTime());
		_fakeMatch2 = new MatchInstance(3, "Albert", 2, [2], Date.now().getTime());
		_fakeUser = new UserData("Bob", 1, 100, 
		            [_fakeBuddy2, _fakeBuddy, _fakeBuddy2, _fakeBuddy2, _fakeBuddy2, _fakeBuddy, _fakeBuddy, _fakeBuddy, _fakeBuddy, _fakeBuddy, _fakeBuddy, _fakeBuddy2],
					[_fakeMatch2, _fakeMatch, _fakeMatch, _fakeMatch, _fakeMatch, _fakeMatch, _fakeMatch, _fakeMatch2]);
		
		_bg = new FlxSprite(0, 0, AssetPaths.MainStateBg__png);
		add(_bg);
		
		_userHeader = new UserHeader(_fakeUser);
		add(_userHeader);
		
		_buddyPanel = new BuddyPanel(_fakeUser, 425, 100);
		add(_buddyPanel);
		
		_matchPanel = new MatchPanel(_fakeUser, 15, 100);
		add(_matchPanel);
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