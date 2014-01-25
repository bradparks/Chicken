package  
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class Assets 
	{
		[Embed(source="../assets/images/Tuiles_32.png")]
        public static const FOREST:Class;
		
		[Embed(source="../assets/images/turtle3.png")]
        public static const TURTLE:Class;
		
		[Embed(source="../assets/images/pig.png")]
        public static const PIG:Class;
		
		[Embed(source="../assets/images/human_walk_idle.png")]
        public static const HUMAN:Class;
		
		[Embed(source="../assets/images/ChickenSprite.png")]
        public static const CHICKEN:Class;
		
		[Embed(source="../assets/lvls/mapCSV_Group1_Map1.csv", mimeType="application/octet-stream")]
		public static const LEVEL:Class;
		
		[Embed(source="../assets/insults.txt", mimeType="application/octet-stream")]
		public static const INSULTS:Class;
		
		[Embed(source="../assets/badinsults.txt", mimeType="application/octet-stream")]
		public static const BADINSULTS:Class;
		
		public static var CASUAL_INSULTS:Array = [];
		public static var INSULTS_OF_DEATH:Array = [];
		
		public static var animals:Array = ["pig", "chicken", "turtle", "human", "chicken"];
		
		public static var animaldict:Dictionary = new Dictionary();
		
		public static function ParseInsults():void 
		{
			var x:String = new INSULTS;
			var y:String = new BADINSULTS;
			
			
			CASUAL_INSULTS = x.split("\n");
			INSULTS_OF_DEATH = y.split("\n");
			
			//trace(CASUAL_INSULTS.length, INSULTS_OF_DEATH.length);
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
			
			animaldict["pig"] = pig;
			animaldict["turtle"] = turtle;
			animaldict["human"] = human;
			animaldict["chicken"] = chicken;
		}
		
	}

}