package data;

/**
 * @author Lokbondo Kung; Celia Zhang
 */
class BuddyInstance
{
	private var _buddyId:Int;
	private var _buddyName:String;
	private var _isOnline:Bool;
	
	public function new(buddy_Id:Int, buddy_Name:String, is_Online:Bool) 
	{
		_buddyId = buddy_Id;
		_buddyName = buddy_Name;
		_isOnline = is_Online;
	}
	
	public function getBuddyId():Int
	{
		return _buddyId;
	}
	
	public function getBuddyName():String
	{
		return _buddyName;
	}
	
	public function getStatus():Bool 
	{
		return _isOnline;
	}
}