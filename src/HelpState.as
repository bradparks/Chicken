package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class HelpState extends FlxState 
	{
		public var splash:FlxSprite;
		
		public var backbtn:FlxButton;
		
		public var text:FlxText;
		
		override public function create():void 
		{
			super.create();
			FlxG.bgColor = 0xff80CAFF;
			FlxG.mouse.show();
			
			splash = new FlxSprite(0, 0, Assets.SPLASH);
			splash.scrollFactor.x = splash.scrollFactor.y = 0;
			add(splash);
			
			backbtn = new FlxButton(10, 10, "Back to menu", goback);
			//backbtn.exists = false;
			text = new FlxText(10, 45, FlxG.width - 10,
			"Player 1 controls: " +
			"\nMove left: left arrow" +
			"\nMove right: right arrow" +
			"\nJump: space bar" +
			"\nInsult rival: down arrow" +
			"\n\nPlayer 2 controls: " +
			"\nMove left: A" +
			"\nMove right: D" +
			"\nJump: space bar" +
			"\nInsult rival: W" +
			"\n\nWhen your insult bar is full, insult your adversary to turn him into a random animal (possibly making things bad for him). The point is to reach the right end of the level as fast as possible. Your insult bar recharges as you move to the right. You can also insult your opponent even when your bar isn't full, but that doesn't have any effect other than psychological damage."
			);
			text.color = 0xff000000;
			text.shadow = 0xffffffff;
			text.size = 12;
			//credittext.exists = false;
			
			add(text);
			add(backbtn);
		}
		
		public function goback():void
		{
			FlxG.switchState(new MenuState());
		}
	}

}