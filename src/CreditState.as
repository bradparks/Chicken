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
	public class CreditState extends FlxState 
	{
		public var backbtn:FlxButton;
		
		public var credittext:FlxText;
		
		override public function create():void 
		{
			super.create();
			FlxG.bgColor = 0xff80CAFF;
			FlxG.mouse.show();
			
			backbtn = new FlxButton(10, 10, "Back to menu", goback);
			//backbtn.exists = false;
			credittext = new FlxText(10, 45, FlxG.width - 10,
			"The team: " +
			"\n-> Artists: Yury Yakovlev, France " +
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