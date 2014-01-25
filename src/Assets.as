package  
{
	import flash.utils.Dictionary;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class Assets 
	{
		[Embed(source="../assets/images/forest.png")]
        public static const FOREST:Class;
		
		[Embed(source="../assets/images/turtle3.png")]
        public static const TURTLE:Class;
		
		[Embed(source="../assets/images/pig.png")]
        public static const PIG:Class;
		
		[Embed(source="../assets/lvls/mapCSV_Group1_Map1.csv", mimeType="application/octet-stream")]
		public static const LEVEL:Class;
		
		[Embed(source="../assets/insults.txt", mimeType="application/octet-stream")]
		public static const INSULTS:Class;
		
		public static var CASUAL_INSULTS:Array = [];
		public static var INSULTS_OF_DEATH:Array = [];
		
		public static var animals:Array = ["pig", "chicken", "turtle"];
		
		public static var animaldict:Dictionary = new Dictionary();
		
		public static function ParseInsults():void 
		{
			var x:String = new INSULTS;
			var low:String = x.split("\n\n", 2)[0];
			var high:String = x.split("\n\n", 2)[1];
			
			CASUAL_INSULTS = low.split("\n");
			INSULTS_OF_DEATH = high.split("\n");
			
			//trace(CASUAL_INSULTS.length, INSULTS_OF_DEATH.length);
		}
		
		public static function loadAnimals():void
		{
			var pig:SpriteHolder = new SpriteHolder(PIG, 64, 44);
			pig.GRAVITY = 275;
			pig.JUMP_SPEED = 200;
			pig.RUN_SPEED = 300;
			pig.DRAG_SPEED = 300;
			pig.DRAG_SPEED = 300;
			
			var turtle:SpriteHolder = new SpriteHolder(TURTLE, 68, 32);
			
			animaldict["pig"] = pig;
			animaldict["turtle"] = turtle;
		}
		
	}

}