package gui.main;

import data.MatchInstance;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.group.FlxTypedGroup;
import DateTools;
/**
 * ...
 * @author Lokbondo Kung, Celia Zhang
 */
class MatchBox extends FlxTypedGroup<FlxSprite>
{
	private var _opponentName:String;
	private var _startTime:Float;
	private var _box:FlxSprite;
	private var _opponentNameDisplay:FlxText;
	private var _timeLeftDisplay:FlxText;
	private var _timeLeft:String;
	private var _x:Int;
	private var _y:Int;
	
	private var MAX_DAYS:Int = 7;
	
	public function new(match:MatchInstance, X:Int=0, Y:Int=0) 
	{
		super();
		_opponentName = match.getOpponentName();
		_startTime = match.getStartTime();
		_x = X;
		_y = Y;
	    _timeLeft = findTimeLeft(_startTime);

		_box = new FlxSprite(_x, _y, AssetPaths.SingleMatchDark__png);
		_opponentNameDisplay = new FlxText(_x + 15, _y + 10, 300, _opponentName, 12, true);
		_timeLeftDisplay = new FlxText(_x + 275, _y + 10, 120, Std.string(_timeLeft), 12, true);
		add(_box);
		add(_opponentNameDisplay);
		add(_timeLeftDisplay);
	}
	
	private function findTimeLeft(_startTime:Float):String
	{
		var timeStampDifference:Float = Date.now().getTime() - _startTime;
		var daysPast:Int = Std.int(timeStampDifference / 86400000);
		var hoursPast:Int = Std.int((timeStampDifference / 3600000) - (daysPast * 24));
		var minutesPast:Int = Std.int((timeStampDifference / 60000) - (daysPast * 1440) - (hoursPast * 60));
		var daysLeft:Int = MAX_DAYS - 1 - daysPast;
		var hoursLeft:Int = 23 - hoursPast;
		var minutesLeft:Int = 59 - minutesPast;
		if (daysPast < MAX_DAYS-1) _timeLeft = '$daysLeft days';
		else _timeLeft = '$hoursLeft hr $minutesLeft min';
		return _timeLeft;
	}
	
}