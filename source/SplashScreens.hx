package;

import openfl.system.System;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxSave;
import lime.app.Application;

/**
*	unused now bc no one cares
*/

class SplashScreens extends FlxState
{
	var haxeflixel:FlxText;
	var cj:FlxText;
	override public function create()
	{
		Square.log("test log", false);
		Application.current.window.resize(1280, 720);
		Application.current.window.x = 0;
		Application.current.window.y = 30;
		
		Square.unloadmouse(false);
		FlxG.camera.fade(FlxColor.BLACK, 0.77, true, function()
		{
			new FlxTimer().start(3, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 0.77, false, function()
				{
       	            FlxG.switchState(new LoadState());
       	        });
			}, 0);
      	});
		var backdrop = new FlxBackdrop(Paths.image('hf'));
		backdrop.cameras = [FlxG.camera];
		backdrop.velocity.set(150, 150);

		haxeflixel = new FlxText(0, 0, 0, "Made with Haxeflixel", 10, true);
		haxeflixel.setFormat("_sans", 16, FlxColor.WHITE, CENTER);
		haxeflixel.screenCenter();

		cj = new FlxText(0, 0, 0, Square.VER, 10, true);
		cj.setFormat("_sans", 16, FlxColor.WHITE, CENTER);

		add(backdrop);
		add(haxeflixel);
		// add(cj);
		
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
	public function new(x:Float = 10, y:Float = 10, color:Int = 0x000000)
	{
		super();
	}
}
