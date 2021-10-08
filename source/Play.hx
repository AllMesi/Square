package;

import flixel.util.FlxColor;
import lime.app.Application;
import openfl.Lib;
import flixel.FlxG;
import flixel.FlxState;
import flixel.ui.FlxButton;
import square.Square;
import flixel.FlxSprite;

class Play extends FlxState
{
	public static var curStage:String = '';
    var button1:FlxButton;
    var button2:FlxButton;
	var button3:FlxButton;
	var button4:FlxButton;
	var one = new FlxSprite(0, 0, Paths.image('white'));
	override public function create()
	{
		 
		add(one);

        button1 = new FlxButton(0, 0, "Back", b);
		button1.loadGraphic(Paths.image('ui/spritesheets/buttons/button'), true, 80, 20);
		add(button1);

        button2 = new FlxButton(0, 20, "VT", vt);
		button2.loadGraphic(Paths.image('ui/spritesheets/buttons/button'), true, 80, 20);
		add(button2);

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('MenuMusic'));
		}

		super.create();
	}

	override public function update(elapsed:Float)
	{
        Square.shake(0.0005, 100);
        if (!FlxG.keys.pressed.ALT && FlxG.keys.justPressed.ENTER)
        {
            final pause = new PauseSub();
            openSubState(pause);
        }

		super.update(elapsed);
	}

	function b()
	{
		FlxG.switchState(new Menu());
	}

    function vt()
    {
        FlxG.switchState(new VT());
    }

}
