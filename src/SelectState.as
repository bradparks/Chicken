package  
{
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxButton;
	import org.flixel.FlxPoint;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class SelectState extends FlxState
	{
		public var splash:FlxSprite;
		
		public var lvlindex:uint = 1;
		
		public var backbtn:FlxButton;
		
		override public function create():void 
		{
			super.create();
			
			splash = new FlxSprite(0, 0, Assets.SPLASH);
			splash.scrollFactor.x = splash.scrollFactor.y = 0;
			add(splash);
			
			createlvls();
			
			backbtn = new FlxButton(FlxG.width - 90, FlxG.height - 30, "Back to menu", goback);
			add(backbtn);
		}
		
		internal function createlvls():void
		{
			var numberolvls:uint = Assets.lvls.length;
			for (var currentlvl:uint = 1; currentlvl <= numberolvls;  currentlvl++)
			{
				lvlindex = currentlvl;
				var lvlbutton:FlxButton = new FlxButton(10 + 180 * (currentlvl - 1), 10 + 45 * (currentlvl/3), String(currentlvl), loadlvl);
				lvlbutton.scrollFactor = new FlxPoint(0, 0);
				lvlbutton.scale.x = lvlbutton.scale.y = 2;
				lvlbutton.x += lvlbutton.frameWidth / 2;
				lvlbutton.y += lvlbutton.frameHeight / 2;
				lvlbutton.label.size = 13;
				add(lvlbutton);
			}
		}
		
		public function loadlvl():void
		{
			//trace(lvltoload);
			super.destroy();
			FlxG.switchState(new PlayState(lvlindex - 1));
		}
		
		public function goback():void
		{
			FlxG.switchState(new MenuState());
		}
	}

}