package gui.main;

import flixel.group.FlxTypedGroup;
import flixel.FlxSprite;
import data.BuddyInstance;
import data.UserData;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.FlxBasic;
import flixel.util.FlxDestroyUtil;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class BuddyPanel extends FlxTypedGroup<FlxBasic>
{
	private var _buddyList:Array<BuddyInstance>;
	private var _bg:FlxSprite;
	private var _upArrow:FlxButton;
	private var _downArrow:FlxButton;
	private var _buddyTitle:FlxText;
	private var _x:Int;
	private var _y:Int;
	private var _buddyBox:BuddyBox;
	private var _buddyBoxList:Array<BuddyBox>;
	private var _startIndex:Int;
	private var _endIndex:Int;
	private var _page:Int;
	private var _totalPages:Int;
	private var _txtPage:FlxText;
	private var _numMatches:Int;

	
	private var BOXES_PER_PAGE:Int = 6;
	private var _accentColor:Int = 0x0d3d3b;

	
	public function new(user:UserData, X:Int, Y:Int) 
	{
		super();
		
		_buddyList = user.getBuddyList();
		_x = X;
		_y = Y;
		_numMatches = _buddyList.length;
		_startIndex = 0;
		if (_numMatches < BOXES_PER_PAGE) _endIndex = _numMatches;
		else _endIndex = BOXES_PER_PAGE;
		_page = 1;
		_totalPages = Math.ceil(_numMatches / BOXES_PER_PAGE);
		
		_buddyTitle = new FlxText(_x, _y - 20, 200, "Friends", 12, true);
		_bg = new FlxSprite(_x, _y, AssetPaths.BuddyPanelGrey__png);
		_upArrow = new FlxButton(_x + 87, _y + 13, "", seePrev);
		_downArrow = new FlxButton(_x + 87, _y + 240, "", seeNext);
		_upArrow.loadGraphic(AssetPaths.UpArrow__png);
		_downArrow.loadGraphic(AssetPaths.DownArrow__png);
		_buddyTitle.color = _accentColor;
		add(_buddyTitle);
		add(_bg);
		add(_upArrow);
		add(_downArrow);
		
		_buddyBoxList = new Array<BuddyBox>();
		addBoxes();
	}
	
	private function seePrev():Void
	{
		if (_startIndex == 0) return null;
		removeBoxes();
		_startIndex -= BOXES_PER_PAGE;
		_endIndex = BOXES_PER_PAGE;
		_page -= 1;
		addBoxes();
	}
	
	private function seeNext():Void
	{
		if (_page == _totalPages) return null;
		removeBoxes();
		_startIndex += BOXES_PER_PAGE;
		_endIndex += BOXES_PER_PAGE;
		_page = _page + 1;
		addBoxes();
	}
	
	private function addBoxes():Void
	{
		var boxY:Int = _y + 40;
		for (i in _startIndex..._endIndex)
		{
			if (i == _numMatches) break;
			_buddyBox = new BuddyBox(_buddyList[i], _x + 25, boxY);
			add(_buddyBox);
			_buddyBoxList.push(_buddyBox);
			boxY = boxY + 30;
		}
	}
	
	private function removeBoxes():Void
	{
		for (i in 0...BOXES_PER_PAGE)
		{
			_buddyBox = _buddyBoxList.pop();
			_buddyBox = FlxDestroyUtil.destroy(_buddyBox);
		}
	}
}