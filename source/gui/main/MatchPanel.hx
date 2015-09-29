package gui.main;

import data.UserData;
import flixel.group.FlxTypedGroup;
import flixel.FlxSprite;
import data.MatchInstance;
import flixel.text.FlxText;
import flixel.FlxBasic;
import flixel.ui.FlxButton;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxColor;

/**
 * ...
 * @author Lokbondo Kung, Celia Zhang
 */
class MatchPanel extends FlxTypedGroup<FlxBasic>
{
	private var _matchList:Array<MatchInstance>;
	private var _numMatches:Int;
	private var _startIndex:Int;
	private var _endIndex:Int;
	private var _x:Int;
	private var _y:Int;
	private var _matchTitle:FlxText;
	private var _timeLeftTitle:FlxText;
	private var _btnNext:FlxButton;
	private var _btnPrev:FlxButton;
	private var _page:Int;
	private var _totalPages:Int;
	private var _txtPage:FlxText;
	private var _matchBox:MatchBox;
	private var _matchBoxList:Array<MatchBox>;
	
	private var BOXES_PER_PAGE:Int = 7;
	private var _accentColor:Int = 0x0d3d3b;
	
	public function new(user:UserData, X:Int = 0, Y:Int = 0) 
	{
		super();
		
		_matchList = user.getMatchList();
	    _x = X;
		_y = Y;
		_numMatches = _matchList.length;
		_startIndex = 0;
		if (_numMatches < BOXES_PER_PAGE) _endIndex = _numMatches;
		else _endIndex = BOXES_PER_PAGE;
		
		_matchTitle = new FlxText(_x, _y - 20, 200, "Current Matches", 12, true);
		_timeLeftTitle = new FlxText(_x + 300, _y - 20, 200, "Time Left", 12, true);
		_matchTitle.color = _accentColor;
		_timeLeftTitle.color = _accentColor;
		add(_matchTitle);
		add(_timeLeftTitle);
		
		_matchBoxList = new Array<MatchBox>();
		addBoxes();
		
		_btnPrev = new FlxButton(_x + 10, _y + 300, "Previous", loadPrevBoxes);
		_btnNext = new FlxButton(_x + 300, _y + 300, "Next", loadNextBoxes);
		_page = 1;
		_totalPages = Math.ceil(_numMatches / BOXES_PER_PAGE);
		_txtPage = new FlxText(_x + 155, _y + 300, 100, 'Page $_page of $_totalPages', 12, true);
		_txtPage.color = _accentColor;
		add(_btnPrev);
		add(_btnNext);
		add(_txtPage);
	}
	
	override public function update():Void 
	{	
		super.update();
	}
	
	private function addBoxes()
	{
		var boxY:Int = _y;
		for (i in _startIndex..._endIndex)
		{
			if (i == _numMatches) break;
			_matchBox = new MatchBox(_matchList[i], _x, boxY);
			add(_matchBox);
			_matchBoxList.push(_matchBox);
			boxY = boxY + 40;
		}
	}
	
	private function removeBoxes()
	{
		for (i in 0...BOXES_PER_PAGE)
		{
			_matchBox = _matchBoxList.pop();
			_matchBox = FlxDestroyUtil.destroy(_matchBox);
		}
	}
	
	private function loadPrevBoxes():Void
	{
		if (_startIndex == 0) return null;
		removeBoxes();
		_startIndex -= BOXES_PER_PAGE;
		_endIndex = BOXES_PER_PAGE;
		_page -= 1;
		_txtPage.text = 'Page $_page of $_totalPages';
		addBoxes();
	}
	
	private function loadNextBoxes():Void
	{
		if (_page == _totalPages) return null;
		removeBoxes();
		_startIndex += BOXES_PER_PAGE;
		_endIndex += BOXES_PER_PAGE;
		_page = _page + 1;
		_txtPage.text = 'Page $_page of $_totalPages';
		addBoxes();
	}
	
}