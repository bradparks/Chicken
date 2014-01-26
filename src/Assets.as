package  
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class Assets 
	{
		// SOUND STUFF
		public static const SFX_LEVEL : Number = 2;
		
		// MUSICS
		[Embed(source="../assets/images/Splash.png")]
        public static const SPLASH:Class;
		
		[Embed(source="../assets/images/Train2.png")]
        public static const TRAIN:Class;
		
		[Embed(source="../assets/music/darkLoop.mp3")]
        public static const DARK_LOOP:Class;
		
		[Embed(source="../assets/music/happyLoop.mp3")]
        public static const HAPPY_LOOP:Class;
		
		[Embed(source="../assets/music/neutralLoop.mp3")]
        public static const NEUTRAL_LOOP:Class;
		
		[Embed(source="../assets/music/theme_chiptune.mp3")]
        public static const CHIPTUNE_THEME:Class;
		
		
		// SFX
		[Embed(source="../assets/sounds/SFX_jump.mp3")]
		public static const SFX_JUMP:Class;
		
		[Embed(source="../assets/sounds/SFX_spawn_chicken.mp3")]
		public static const SFX_SPAWN_CHICKEN:Class;
		
		[Embed(source="../assets/sounds/SFX_spawn_elephant.mp3")]
		public static const SFX_SPAWN_ELEPHANT:Class;
		
		[Embed(source="../assets/sounds/SFX_spawn_man.mp3")]
		public static const SFX_SPAWN_MAN:Class;
		
		[Embed(source="../assets/sounds/SFX_spawn_pig.mp3")]
		public static const SFX_SPAWN_PIG:Class;
		
		[Embed(source="../assets/sounds/SFX_spawn_turtle.mp3")]
		public static const SFX_SPAWN_TURTLE:Class;
		
		[Embed(source="../assets/sounds/SFX_step_chicken.mp3")]
		public static const SFX_STEP_CHICKEN:Class;
		
		[Embed(source="../assets/sounds/SFX_step_elephant.mp3")]
		public static const SFX_STEP_ELEPHANT:Class;
		
		[Embed(source="../assets/sounds/SFX_step_man_or_pig.mp3")]
		public static const SFX_STEP_MAN_PIG:Class;
		
		[Embed(source="../assets/sounds/SFX_step_turtle.mp3")]
		public static const SFX_STEP_TURTLE:Class;
		
		// GFX
		[Embed(source="../assets/images/icon.png")]
		public static const ICON:Class;
		
		[Embed(source="../assets/images/icon_chicken.png")]
		public static const ICON_CHICKEN:Class;
		
		[Embed(source="../assets/images/icon_elephant.png")]
		public static const ICON_ELEPHANT:Class;
		
		[Embed(source="../assets/images/icon_pig.png")]
		public static const ICON_PIG:Class;
		
		[Embed(source="../assets/images/icon_turtle.png")]
		public static const ICON_TURTLE:Class;
		
		[Embed(source="../assets/images/progressbar_border.png")]
		public static const GAUGE:Class;
		
		[Embed(source="../assets/images/Tuiles_32.png")]
        public static const FOREST:Class;
		
		[Embed(source="../assets/images/TuileCiel2.png")]
		public static const SKYBOX:Class;
		
		[Embed(source="../assets/images/Mountains.png")]
		public static const MOUNTAINS:Class;
		
		[Embed(source="../assets/images/TreeLineBack.png")]
		public static const TREES_BACK:Class;
		
		[Embed(source="../assets/images/TreeLineFront.png")]
		public static const TREES_FRONT:Class;
		
		[Embed(source="../assets/images/turtle3.png")]
        public static const TURTLE:Class;
		
		[Embed(source="../assets/images/pig.png")]
        public static const PIG:Class;
		
		[Embed(source="../assets/images/human_walk_idle.png")]
        public static const HUMAN:Class;
		
		[Embed(source="../assets/images/ChickenSprite.png")]
        public static const CHICKEN:Class;
		
		[Embed(source="../assets/images/elephant.png")]
        public static const ELEPHANT:Class;
		
		
		// MISCS
		//[Embed(source="../assets/lvls/mapCSV_Group1_Map1.csv", mimeType="application/octet-stream")]
		//public static const LEVEL:Class;
		
		[Embed(source="../assets/insults.txt", mimeType="application/octet-stream")]
		public static const INSULTS:Class;
		
		[Embed(source="../assets/badinsults.txt", mimeType="application/octet-stream")]
		public static const BADINSULTS:Class;
		
		
		
		public static var CASUAL_INSULTS:Array = [];
		public static var INSULTS_OF_DEATH:Array = [];
		public static var animals:Array = ["pig", "chicken", "turtle", "elephant"];
		public static var animaldict:Dictionary = new Dictionary();
		
		//Level embedding
		[Embed(source="../assets/lvls/mapCSV_Group1_Map1.csv", mimeType="application/octet-stream")]
		public static const LEVEL:Class;
		
		public static var lvls:Array = [LEVEL];
		
		public static function ParseInsults():void 
		{
			var x:String = new INSULTS;
			var y:String = new BADINSULTS;
			
			
			CASUAL_INSULTS = x.split("\n");
			INSULTS_OF_DEATH = y.split("\n");
			
			//trace(INSULTS_OF_DEATH);
		}
		
		public static function loadAnimals():void
		{
			var pig:SpriteHolder = new SpriteHolder(PIG, 64, 44);
			pig.GRAVITY = 275;
			pig.JUMP_SPEED = 250;
			pig.RUN_SPEED = 300;
			pig.DRAG_SPEED = 300;
			pig.MAX_SPEED = 300;
			pig.JUMP_SOUND = Assets.SFX_JUMP;
			pig.SPAWN_SOUND = Assets.SFX_SPAWN_PIG;
			pig.STEP_SOUND = Assets.SFX_STEP_MAN_PIG;
			
			var turtle:SpriteHolder = new SpriteHolder(TURTLE, 68, 32);
			turtle.GRAVITY = 420;
			turtle.JUMP_SPEED = 340;
			turtle.RUN_SPEED = 200;
			turtle.DRAG_SPEED = 200;
			turtle.MAX_SPEED = 200;
			turtle.MAX_JUMPS = 2;
			turtle.JUMP_SOUND = Assets.SFX_JUMP;
			turtle.SPAWN_SOUND = Assets.SFX_SPAWN_TURTLE;
			turtle.STEP_SOUND = Assets.SFX_STEP_TURTLE;
			
			var human:SpriteHolder = new SpriteHolder(HUMAN, 38, 100);
			human.GRAVITY = 420;
			human.JUMP_SPEED = 200;
			human.RUN_SPEED = 230;
			human.DRAG_SPEED = 500;
			human.MAX_SPEED = 230;
			human.JUMP_SOUND = Assets.SFX_JUMP;
			human.SPAWN_SOUND = Assets.SFX_SPAWN_MAN;
			human.STEP_SOUND = Assets.SFX_STEP_MAN_PIG;
			
			var chicken:SpriteHolder = new SpriteHolder(CHICKEN, 48, 46);
			chicken.GRAVITY = 420;
			chicken.JUMP_SPEED = 200;
			chicken.RUN_SPEED = 400;
			chicken.DRAG_SPEED = 400;
			chicken.MAX_SPEED = 400;
			chicken.walkfps = 18;
			chicken.JUMP_SOUND = Assets.SFX_JUMP;
			chicken.SPAWN_SOUND = Assets.SFX_SPAWN_CHICKEN;
			chicken.STEP_SOUND = Assets.SFX_STEP_CHICKEN;
			
			var elephant:SpriteHolder = new SpriteHolder(ELEPHANT, 158, 105);
			elephant.GRAVITY = 500;
			elephant.JUMP_SPEED = 200;
			elephant.RUN_SPEED = 300;
			elephant.DRAG_SPEED = 300;
			elephant.MAX_SPEED = 300;
			//elephant.walkfps = 18;
			elephant.JUMP_SOUND = Assets.SFX_JUMP;
			elephant.SPAWN_SOUND = Assets.SFX_SPAWN_ELEPHANT;
			elephant.STEP_SOUND = Assets.SFX_STEP_ELEPHANT;
			
			animaldict["pig"] = pig;
			animaldict["turtle"] = turtle;
			animaldict["human"] = human;
			animaldict["chicken"] = chicken;
			animaldict["elephant"] = elephant;
		}
		
	}

}