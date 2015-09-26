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
	private var _startTime:Date;
	
	public function new(opponent_id:Int, opponent_name:String, match_id:Int, available_maps:Array<Int>, start_time:Date) 
	{
		_opponentId = opponent_id;
		_opponentName = opponent_name;
		_matchId = match_id;
		_availableMaps = available_maps;
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
	
	public function getStartTime():Date
	{
		return _startTime;
	}
}