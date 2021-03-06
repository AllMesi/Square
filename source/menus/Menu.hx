package menus;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.FlxState;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Menu extends FlxState
{
	var title:FlxText;
	var play:FlxButton;
	var back:FlxButton;
	var options:FlxButton;
	var reset:FlxButton;
	var vt:FlxButton;
	var test:FlxButton;

	override function create()
	{
		FlxG.camera.zoom += 1.2;
		FlxTween.tween(camera, {zoom: 1}, .5, {ease: FlxEase.quartInOut});
		FlxG.mouse.visible = true;
		FlxG.mouse.enabled = true;
		var backdrop = new misc.FlxBackdrop(misc.Paths.image('sb'));
		backdrop.cameras = [FlxG.camera];
		backdrop.velocity.set(0, 150);
		add(backdrop);

		title = new FlxText(50, 0, 0, "Square Menu", 18);
		title.setFormat("_sans", 16, FlxColor.WHITE, CENTER);
		title.screenCenter(X);
		add(title);

		play = new FlxButton(0, 0, "Play", p);
		play.x = (FlxG.width / 2) - (play.width / 2);
		play.y = (FlxG.height / 2);
		play.loadGraphic(misc.Paths.image('ui/spritesheets/buttons/button'), true, 80, 20);
		add(play);

		options = new FlxButton(0, 30, "Options", o);
		options.x = ((FlxG.width / 2) - options.width / 2);
		options.y = (FlxG.height / 2) + play.height + 3;
		options.loadGraphic(misc.Paths.image('ui/spritesheets/buttons/button'), true, 80, 20);
		add(options);

		reset = new FlxButton(100, 0, "reset", r);
		reset.loadGraphic(misc.Paths.image('ui/spritesheets/buttons/button'), true, 80, 20);
		// add(reset);

		vt = new FlxButton(0, 0, "VT", vtlol);
		vt.loadGraphic(misc.Paths.image('ui/spritesheets/buttons/button'), true, 80, 20);
		// add(vt);

		back = new FlxButton(0, 30, "Back", b);
		back.x = ((FlxG.width / 2) - back.width / 2);
		back.y = (FlxG.height / 2) + options.height + 26;
		back.loadGraphic(misc.Paths.image('ui/spritesheets/buttons/button'), true, 80, 20);
		add(back);

		super.create();
	}

	private function p()
	{
		FlxG.switchState(new menus.SelectSong());
	}

	private function b()
	{
		FlxG.switchState(new menus.Start());
	}

	private function o()
	{
		// FlxG.switchState(new settings.OptionsExper());
		final pause = new settings.OptionsExper(); // .hx
		openSubState(pause);
	}

	private function r()
	{
		FlxG.resetGame();
		//* why *//
	}

	public function vtlol()
	{
		FlxG.switchState(new misc.VT());
		// sdfkshjdfljflkjflkjsdflkjdflkjdflksdjflkdjlkjdfsldkjldkfjsdkfjsfdjkdjkdkfjdfkjdjkfksfdj
	}

	override public function update(elapsed:Float)
	{
		// square.shake(0.0005, 100);
		super.update(elapsed);
		if (FlxG.keys.pressed.CONTROL && FlxG.keys.justPressed.O)
		{
			final pause = new settings.OptionsExper(); // .hx
			openSubState(pause);
		}
	}
}
