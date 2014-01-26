package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxG;
	import org.flixel.FlxButton;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class LoseState extends FlxState
	{
		public var p1haswon:Boolean;
		
		public var splash:FlxSprite;
		
		public var wintext:FlxText;
		
		public var backbtn:FlxButton;
		
		public function LoseState(P1haswon:Boolean) 
		{
			p1haswon = P1haswon;
		}
		
		override public function create():void
		{
			super.create();
			FlxG.mouse.show();
			
			splash = new FlxSprite(0, 0, Assets.LOSEPAGE);
			splash.scrollFactor.x = splash.scrollFactor.y = 0;
			add(splash);
			
			var winstring:String = "";
			if (p1haswon) {
				winstring = "Dear Player 1,"
			}
			
			else
			{
				winstring = "Dear Player 2,"
			}
			
			wintext = new FlxText(0, 10, FlxG.width, winstring);
			wintext.alignment = "center";
			wintext.color = 0xff000000;
			wintext.shadow = 0xffffffff;
			wintext.size = 18;
			
			add(wintext);
			
			backbtn = new FlxButton(FlxG.width/2 - 80, 350, "ChooseLVL", goback);
			backbtn.scale.x = backbtn.scale.y = 2;
			backbtn.label.size = 13;
			backbtn.x += backbtn.frameWidth/2;
			//backbtn.y += backbtn.frameHeight;
			add(backbtn);
		}
		
		public function goback():void
		{
			FlxG.switchState(new SelectState());
		}
	}

}