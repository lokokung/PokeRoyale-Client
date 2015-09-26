package data;

/**
 * @author Lokbondo Kung; Celia Zhang
 */
class UserData
{
	private var _playerName:String;
	private var _userId:Int;
	private var _gold:Int;
	private var _buddyList:Array<BuddyInstance>;
	private var _matchList:Array<MatchInstance>;
	
	public function new(player_name:String, user_id:Int, gold_amount:Int, buddy_list:Array<BuddyInstance>, match_list:Array<MatchInstance>) 
	{
		_playerName = player_name;
		_userId = user_id;
		_gold = gold_amount;
		_buddyList = buddy_list;
		_matchList = match_list;
	}
	
	public function getPlayerName():String
	{
		return _playerName;
	}
	
	public function getUserId():Int
	{
		return _userId;
	}
	
	public function getGold():Int
	{
		return _gold;
	}
	
	public function getBuddyList():Array<BuddyInstance>
	{
		return _buddyList;
	}
	
	public function getMatchList():Array<MatchInstance>
	{
		return _matchList;
	}
}