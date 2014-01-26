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
		
		[Embed(source="../assets/images/Losepage.png")]
        public static const LOSEPAGE:Class;
		
		[Embed(source="../assets/images/help.png")]
        public static const HELPPAGE:Class;
		
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
		
		[Embed(source="../assets/images/human_fixed.png")]
        public static const HUMAN:Class;
		
		[Embed(source="../assets/images/ChickenSprite.png")]
        public static const CHICKEN:Class;
		
		[Embed(source="../assets/images/elephant2.png")]
        public static const ELEPHANT:Class;
		
		
		// MISCS
		//[Embed(source="../assets/lvls/mapCSV_Group1_Map1.csv", mimeType="application/octet-stream")]
		//public static const LEVEL:Class;
		
		[Embed(source="../assets/data/genericinsults.txt", mimeType="application/octet-stream")]
		public static const INSULTS:Class;
		
		[Embed(source="../assets/data/badinsults.txt", mimeType="application/octet-stream")]
		public static const BADINSULTS:Class;
		
		[Embed(source="../assets/data/chickeninsults.txt", mimeType="application/octet-stream")]
		public static const CHICKENINSULTS:Class;
		
		[Embed(source="../assets/data/elephantinsults.txt", mimeType="application/octet-stream")]
		public static const ELEPHANTINSULTS:Class;
		
		[Embed(source="../assets/data/humaninsults.txt", mimeType="application/octet-stream")]
		public static const HUMANINSULTS:Class;
		
		[Embed(source="../assets/data/piginsults.txt", mimeType="application/octet-stream")]
		public static const PIGINSULTS:Class;
		
		[Embed(source="../assets/data/turtleinsults.txt", mimeType="application/octet-stream")]
		public static const TURTLEINSULTS:Class;
		
		
		
		public static var CASUAL_INSULTS:Array = [];
		public static var INSULTS_OF_DEATH:Array = [];
		public static var INSULTS_OF_CHICKEN:Array = [];
		public static var INSULTS_OF_PIG:Array = [];
		public static var INSULTS_OF_HUMAN:Array = [];
		public static var INSULTS_OF_TURTLE:Array = [];
		public static var INSULTS_OF_ELEPHANT:Array = [];
		//public static var animals:Array = ["pig", "chicken", "turtle", "human", "elephant"];
		public static var animals:Array = ["pig", "chicken", "turtle", "elephant"];
		public static var animaldict:Dictionary = new Dictionary();
		
		//Level embedding
		[Embed(source="../assets/lvls/mapCSV_Group1_Map1.csv", mimeType="application/octet-stream")]
		public static const LEVEL:Class;
		
		[Embed(source="../assets/lvls/l2.csv", mimeType="application/octet-stream")]
		public static const LEVEL2:Class;
		
		[Embed(source="../assets/lvls/level3.csv", mimeType="application/octet-stream")]
		public static const LEVEL3:Class;
		
		public static var lvls:Array = [LEVEL, LEVEL2, LEVEL3];
		
		public static function ParseInsults():void 
		{
			var a:String = new INSULTS;
			var b:String = new BADINSULTS;
			var c:String = new PIGINSULTS;
			var d:String = new ELEPHANTINSULTS;
			var e:String = new CHICKENINSULTS;
			var f:String = new HUMANINSULTS;
			var g:String = new TURTLEINSULTS;
			
			
			CASUAL_INSULTS = a.split("\n");
			INSULTS_OF_DEATH = b.split("\n");
			INSULTS_OF_PIG = c.split("\n");
			INSULTS_OF_ELEPHANT = d.split("\n");
			INSULTS_OF_CHICKEN = e.split("\n");
			INSULTS_OF_HUMAN = f.split("\n");
			INSULTS_OF_TURTLE = g.split("\n");
			
			//trace(INSULTS_OF_DEATH);
		}
		
		public static function loadAnimals():void
		{
			var pig:SpriteHolder = new SpriteHolder(PIG, 64, 44);   ////2     can't jump properly
			pig.GRAVITY = 275;
			pig.JUMP_SPEED = 170;
			pig.RUN_SPEED = 150;
			pig.DRAG_SPEED = 200;
			pig.MAX_SPEED = 200;
			
			var turtle:SpriteHolder = new SpriteHolder(TURTLE, 68, 32); ///3  really slow, can't jump as well
			turtle.GRAVITY = 500;
			turtle.JUMP_SPEED = 140;
			turtle.RUN_SPEED = 100;
			turtle.DRAG_SPEED = 50;
			turtle.MAX_SPEED = 40;
			turtle.MAX_JUMPS = 2;
			
			var human:SpriteHolder = new SpriteHolder(HUMAN, 37, 100);
			human.GRAVITY = 420;
			human.JUMP_SPEED = 800;
			human.JUMP_SPEED = 800;
			human.RUN_SPEED = 120;
			human.DRAG_SPEED = 100;
			human.MAX_SPEED = 230;
			
			var chicken:SpriteHolder = new SpriteHolder(CHICKEN, 48, 46); ////1  can fly, space button mash
			chicken.GRAVITY = 420;
			chicken.JUMP_SPEED = 120;
			chicken.RUN_SPEED = 200;
			chicken.MAX_JUMPS = 8;
			chicken.DRAG_SPEED = 200;
			chicken.MAX_SPEED = 400;
			chicken.walkfps = 18;
			
			var elephant:SpriteHolder = new SpriteHolder(ELEPHANT, 158, 102);  // can fly, space button mash
			elephant.GRAVITY = 500;
			elephant.JUMP_SPEED = 200;
			elephant.MAX_JUMPS = 20;
			elephant.RUN_SPEED = 300;
			elephant.DRAG_SPEED = 300;
			elephant.MAX_SPEED = 300;
			//elephant.walkfps = 18;
			
			
			animaldict["pig"] = pig;
			animaldict["turtle"] = turtle;
			animaldict["human"] = human;
			animaldict["chicken"] = chicken;
			animaldict["elephant"] = elephant;
		}
		
	}

}