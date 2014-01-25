package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxState;
	import org.flixel.FlxTilemap;
	import org.flixel.FlxG;
	import org.flixel.FlxCamera;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class PlayState extends FlxState
	{
		public var map:FlxTilemap;
		public var p1:Player;
		public var p2:Player;
		public var players:FlxGroup = new FlxGroup();
		
		public var goal:Goal;
		
		public function PlayState()
		{
			super();
			Assets.ParseInsults();
			Assets.loadAnimals();
		}
		
		override public function create():void
		{
			// Set a background color
			//FlxG.cameras.bgColor = 0xff80CAFF;
			FlxG.bgColor = 0xff80CAFF;
			
			super.create();
			
			FlxG.flash();
			
			Registry.lvl = this;
			
			map = new FlxTilemap;
			//trace(new Assets.LEVEL);
			map.loadMap(new Assets.LEVEL, Assets.FOREST, 32, 32);
			add(map);
			
			p1 = new Player(50, 0);
			p2 = new Player(110, 0, 0xffff0000, false);
			p1.enemy = p2;
			p2.enemy = p1;
			players.add(p1);
			players.add(p2);
			add(p1);
			add(p2);
			
			goal = new Goal(map.x + map.width - 200, 0);
			add(goal);
			
			FlxG.worldBounds = new FlxRect(map.x, map.y, map.width, map.height);
			FlxG.camera.setBounds(0, 0, map.width, map.height);
			FlxG.camera.follow(p2, FlxCamera.STYLE_PLATFORMER);
		}
		
		/**
		 * Function that is called when this state is destroyed - you might want to 
		 * consider setting all objects this state uses to null to help garbage collection.
		 */
		override public function destroy():void
		{
			super.destroy();
		}

		/**
		 * Function that is called once every frame.
		 */
		override public function update():void
		{
			super.update();
			
			FlxG.collide(map, players);
			FlxG.collide(map, goal);
			FlxG.collide(players);
		}	
	}

}