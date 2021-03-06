package misc;

import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxState;

class BreathOrElse extends FlxState
{
	var hilol:FlxText;

	override public function create()
	{
		hilol = new FlxText(0, 0, 0, "breath", 40, true);
		hilol.setFormat("_sans", 40, FlxColor.WHITE, CENTER);
		hilol.screenCenter();
		add(hilol);
		super.create();
	}

	override public function update(elapsed:Float)
	{
		if (FlxG.keys.justPressed.ESCAPE)
			FlxG.switchState(new Start());
		if (FlxG.keys.pressed.SPACE)
		{
			hilol.alpha += 0.01;
		}
		else
		{
			hilol.alpha -= 0.01;
		}
		super.update(elapsed);
	}
}
