package states;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxDestroyUtil;
import flixel.addons.ui.FlxInputText;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Lokbondo Kung; Celia Zhang
 */
class LoginState extends FlxState
{
	private var _btnLogin:FlxButton;
	private var _background:FlxSprite;
	private var _usernameInput:FlxInputText;
	private var _passwordInput:FlxInputText;
	private var _username:String;
	private var _password:String;
	
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		// Add background
		_background = new FlxSprite(0, 0, AssetPaths.blue_wallpaper_640x480__jpg);
		add(_background);
		
		// Add username input text field
		_usernameInput = new FlxInputText(0, 0, 150, "Username", 12, FlxColor.WHITE, FlxColor.GRAY, true);
		_usernameInput.x = (FlxG.width / 2) - (_usernameInput.width / 2);
		_usernameInput.y = (FlxG.height * 3.2 / 5) - (_usernameInput.height / 2);
		_usernameInput.fieldBorderThickness = 0;
		_usernameInput.lines = 1;
		add(_usernameInput);
		
		// Add password input text field
		_passwordInput = new FlxInputText(0, 0, 150, "Password", 12, FlxColor.WHITE, FlxColor.GRAY, true);
		_passwordInput.x = (FlxG.width / 2) - (_passwordInput.width / 2);
		_passwordInput.y = (FlxG.height * 3.5 / 5) - (_passwordInput.height / 2);
		_passwordInput.fieldBorderThickness = 0;
		_passwordInput.lines = 1;
		add(_passwordInput);
		
		// Add login button
		_btnLogin = new FlxButton(0, 0, "Login", clickLogin);
		_btnLogin.x = (FlxG.width / 2) - (_btnLogin.width / 2);
		_btnLogin.y = (FlxG.height * 4/5) - (_btnLogin.height/2);
		add(_btnLogin);
		
		super.create();
	}

	/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
		_btnLogin = FlxDestroyUtil.destroy(_btnLogin);
		_background = FlxDestroyUtil.destroy(_background);
		_usernameInput = FlxDestroyUtil.destroy(_usernameInput);
		_passwordInput = FlxDestroyUtil.destroy(_passwordInput);
	}
	

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		_username = _usernameInput.text;
		_password = _passwordInput.text;
		if (_usernameInput.hasFocus && _username == 'Username')
		{
			_usernameInput.caretIndex = 0;
			_usernameInput.text = '';
		}
		if (_passwordInput.hasFocus && _password == 'Password')
		{
			_passwordInput.caretIndex = 0;
			_passwordInput.text = '';
			_passwordInput.passwordMode = true;
		}
	}
	
	private function clickLogin():Void
	{
		FlxG.switchState(new MainState());
	}
}