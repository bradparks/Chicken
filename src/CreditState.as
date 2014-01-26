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
	public class CreditState extends FlxState 
	{
		public var splash:FlxSprite;
		
		public var backbtn:FlxButton;
		
		public var credittext:FlxText;
		
		override public function create():void 
		{
			super.create();
			FlxG.bgColor = 0xff80CAFF;
			FlxG.mouse.show();
			
			splash = new FlxSprite(0, 0, Assets.SPLASH);
			splash.scrollFactor.x = splash.scrollFactor.y = 0;
			add(splash);
			
			backbtn = new FlxButton(10, 10, "Back to menu", goback);
			//backbtn.scale.x = backbtn.scale.y = 2;
			//backbtn.label.size = 13;
			//backbtn.x += backbtn.frameWidth;
			//backbtn.y += backbtn.frameHeight;
			//backbtn.exists = false;
			credittext = new FlxText(10, 60, FlxG.width - 10,
			"The team: " +
			"\n-> 2D Artists: Yury Yakovlev, France Trudel" +
			"\n-> Sound designer: Boris Warembourg" +
			"\n-> Programmers: Manuel Parent, Mark Beiline" +
			"\n\nUses the Flixel engine." +
			"\nMade for the Montreal Game Jam (part of Global Game Jam)."
			);
			credittext.color = 0xff000000;
			credittext.shadow = 0xffffffff;
			credittext.size = 12;
			//credittext.exists = false;
			
			add(credittext);
			add(backbtn);
		}
		
		public function goback():void
		{
			FlxG.switchState(new MenuState());
		}
	}

}