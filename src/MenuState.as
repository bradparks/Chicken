package  
{
	import org.flixel.FlxSprite;
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
		public var splash:FlxSprite;
		
		public var playbtn:FlxButton;
		public var helpbtn:FlxButton;
		public var creditbtn:FlxButton;
		public var disclaimer:FlxText;
		
		override public function create():void 
		{
			super.create();
			FlxG.bgColor = 0xff80CAFF;
			FlxG.mouse.show();
			
			splash = new FlxSprite(0, 0, Assets.SPLASH);
			splash.scrollFactor.x = splash.scrollFactor.y = 0;
			add(splash);
			
			playbtn = new FlxButton(FlxG.width / 2 - 40, 340, "Play", play);
			playbtn.scale.x = playbtn.scale.y = 2;
			playbtn.label.size = 13;
			helpbtn = new FlxButton(FlxG.width / 2 - 40, 385, "Help", help);
			helpbtn.scale.x = helpbtn.scale.y = 2;
			helpbtn.label.size = 13;
			creditbtn = new FlxButton(FlxG.width / 2 - 40, 430, "Credits", credits);
			creditbtn.scale.x = creditbtn.scale.y = 2;
			creditbtn.label.size = 13;
			disclaimer = new FlxText(10, 105, FlxG.width - 10,
			"Disclaimer: This game requires two players. We're profoundly sorry if you have no friends nearby.");
			disclaimer.color = 0xff000000;
			disclaimer.shadow = 0xffffffff;
			disclaimer.size = 12;
			
			add(playbtn);
			add(helpbtn);
			add(creditbtn);
			add(disclaimer);
			
			FlxG.playMusic(Assets.CHIPTUNE_THEME);
		}
		
		override public function destroy(): void
		{
			FlxG.music.stop();
		}
		
		public function play():void
		{
			FlxG.switchState(new SelectState());
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