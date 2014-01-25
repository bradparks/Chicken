package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class MenuState extends FlxState 
	{
		public var playbtn:FlxButton;
		public var helpbtn:FlxButton;
		public var creditbtn:FlxButton;
		public var disclaimer:FlxText;
		
		override public function create():void 
		{
			super.create();
			FlxG.bgColor = 0xff80CAFF;
			FlxG.mouse.show();
			
			playbtn = new FlxButton(10, 10, "Play", play);
			helpbtn = new FlxButton(10, 45, "Help", help);
			creditbtn = new FlxButton(10, 80, "Credits", credits);
			disclaimer = new FlxText(10, 105, FlxG.width - 10,
			"Disclaimer: This game requires two players. We're profoundly sorry if you have no friends nearby.");
			disclaimer.color = 0xff000000;
			disclaimer.shadow = 0xffffffff;
			disclaimer.size = 12;
			
			add(playbtn);
			add(helpbtn);
			add(creditbtn);
			add(disclaimer);
		}
		
		public function play():void
		{
			FlxG.switchState(new PlayState());
		}
		
		public function credits():void
		{
			FlxG.switchState(new CreditState());
		}
		
		public function help():void
		{
			FlxG.switchState(new HelpState());
		}
	}

}