package data;

/**
 * @author Lokbondo Kung; Celia Zhang
 */
class MatchInstance
{
	private var _opponentId:Int;
	private var _opponentName:String;
	private var _matchId:Int;
	private var _availableMaps:Array<Int>;
	private var _startTime:Float;
	
	public function new(opponent_id:Int, opponent_name:String, match_id:Int, available_maps:Array<Int>, start_time:Float) 
	{
		_opponentId = opponent_id;
		_opponentName = opponent_name;
		_matchId = match_id;
		_availableMaps = available_maps;
		_startTime = start_time;
	}
	
	public function getOpponentId():Int
	{
		return _opponentId;
	}
	
	public function getOpponentName():String
	{
		return _opponentName;
	}
	
	public function getMatchId():Int
	{
		return _matchId;
	}
	
	public function getAvailableMaps():Array<Int>
	{
		return _availableMaps;
	}
	
	public function getStartTime():Float
	{
		return _startTime;
	}
}