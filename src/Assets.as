package  
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class Assets 
	{
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
		
		// TODO
		
		// GFX
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
		
		[Embed(source="../assets/images/human3.png")]
        public static const HUMAN:Class;
		
		[Embed(source="../assets/images/ChickenSprite.png")]
        public static const CHICKEN:Class;
		
		[Embed(source="../assets/images/elephant.png")]
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
		public static var animals:Array = ["pig", "chicken", "turtle", "human", "elephant"];
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
			var pig:SpriteHolder = new SpriteHolder(PIG, 64, 44);
			pig.GRAVITY = 275;
			pig.JUMP_SPEED = 250;
			pig.RUN_SPEED = 300;
			pig.DRAG_SPEED = 300;
			pig.MAX_SPEED = 300;
			
			var turtle:SpriteHolder = new SpriteHolder(TURTLE, 68, 32);
			turtle.GRAVITY = 420;
			turtle.JUMP_SPEED = 340;
			turtle.RUN_SPEED = 200;
			turtle.DRAG_SPEED = 200;
			turtle.MAX_SPEED = 200;
			turtle.MAX_JUMPS = 2;
			
			var human:SpriteHolder = new SpriteHolder(HUMAN, 38, 100);
			human.GRAVITY = 420;
			human.JUMP_SPEED = 200;
			human.RUN_SPEED = 230;
			human.DRAG_SPEED = 500;
			human.MAX_SPEED = 230;
			
			var chicken:SpriteHolder = new SpriteHolder(CHICKEN, 48, 46);
			chicken.GRAVITY = 420;
			chicken.JUMP_SPEED = 200;
			chicken.RUN_SPEED = 400;
			chicken.DRAG_SPEED = 400;
			chicken.MAX_SPEED = 400;
			chicken.walkfps = 18;
			
			var elephant:SpriteHolder = new SpriteHolder(ELEPHANT, 158, 105);
			elephant.GRAVITY = 500;
			elephant.JUMP_SPEED = 200;
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