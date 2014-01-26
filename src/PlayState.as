package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
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
		
		public const RESPAWN_DIST : int = 100;
		
		public var map:FlxTilemap;
		public var p1:Player;
		public var p2:Player;
		public var dummy:FlxObject = new FlxObject();
		public var players:FlxGroup = new FlxGroup();
		public var skybox:FlxSprite;
		
		public var mountaingroup:FlxGroup = new FlxGroup();
		public var backtreesgroup:FlxGroup = new FlxGroup();
		public var fronttreesgroup:FlxGroup = new FlxGroup();
		
		public var mountain1:FlxSprite;
		public var mountain2:FlxSprite;
		public var backtrees:FlxSprite;
		public var fronttrees:FlxSprite;
		
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
			
			skybox = new FlxSprite(0, 0, Assets.SKYBOX);
			skybox.scrollFactor.x = skybox.scrollFactor.y = 0;
			add(skybox);
			
			//add(mountaingroup);
			mountain1 = new FlxSprite(0, FlxG.height - 402, Assets.MOUNTAINS);
			mountain1.scrollFactor.x = 0.2;
			mountain1.scrollFactor.y = 0;
			add(mountain1);
			
			backtrees = new FlxSprite(0, FlxG.height - 241, Assets.TREES_FRONT);
			backtrees.scrollFactor.x = 0.4;
			backtrees.scrollFactor.y = 0;
			add(backtrees);
			
			fronttrees = new FlxSprite(0, FlxG.height - 305, Assets.TREES_FRONT);
			fronttrees.scrollFactor.x = 0.6;
			fronttrees.scrollFactor.y = 0;
			add(fronttrees);
			
			add(mountaingroup);
			add(backtrees);
			add(fronttrees);
			
			FlxG.flash();
			
			Registry.lvl = this;
			
			map = new FlxTilemap;
			//trace(new Assets.LEVEL);
			map.loadMap(new Assets.LEVEL, Assets.FOREST, 32, 32);
			map.setTileProperties(4, FlxObject.NONE);
			map.setTileProperties(5, FlxObject.NONE);
			map.setTileProperties(9, FlxObject.NONE);
			add(map);
			
			p1 = new Player(50, 0);
			p2 = new Player(110, 0, 0xffff0000, false);
			p1.enemy = p2;
			p2.enemy = p1;
			players.add(p1);
			players.add(p2);
			add(p1);
			add(p2);
			
			FlxG.camera.follow(dummy, FlxCamera.STYLE_PLATFORMER);
			
			goal = new Goal(map.x + map.width - 200, 0);
			add(goal);
			
			FlxG.worldBounds = new FlxRect(map.x, map.y, map.width, map.height);
			FlxG.camera.setBounds(0, 0, map.width, map.height);
			PickCamera();
			
			for (var x = (FlxG.worldBounds.width / int(2520 * 0.2)) + 1; x++)
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
			
			PickCamera();
			RespawnIfOutOfScreen();
		}
		
		private function PickCamera()
		{
			if ( p1.x > p2.x )
			{
				dummy.x = Utils.Lerp(dummy.x, p1.x, 0.1);
				dummy.y = Utils.Lerp(dummy.y, p1.y, 0.1);
			}
			else
			{
				dummy.x = Utils.Lerp(dummy.x, p2.x, 0.1);
				dummy.y = Utils.Lerp(dummy.y, p2.x, 0.1);
			}
		}
		
		private function RespawnIfOutOfScreen():void
		{
			if ( ! p1.onScreen() )
			{
				Respawn(p1, p2);
			}
			else if ( ! p2.onScreen() )
			{
				Respawn(p2, p1);
			}
		}
		
		private function Respawn( pToRespawn:Player, target:Player):void 
		{
			var spawnX : int = target.x + RESPAWN_DIST;
			var tileSize : int = map.width / map.widthInTiles;
			var column : int = (spawnX / map.width) * map.widthInTiles;
			
			for ( var i : int = map.heightInTiles ; i > 0 ; --i )
			{
				var tile : int = map.getTile(column, i);
				if ( tile != 0 )
				{
					var spawnY = (tileSize * i)-pToRespawn.height;
					break;
				}
			}
			
			pToRespawn.x = spawnX;
			pToRespawn.y = spawnY;
		}
	}

}