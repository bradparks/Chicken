package  
{
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class SpriteHolder 
	{
		//public var left:Anim;
		//public var right:Anim;
		public var anim:Class;
		public var fwidth:int;
		public var fheight:int;
		public var walkfps:Number = 6;
		
		public var RUN_SPEED:int = 400;
		public var GRAVITY:int = 420;
		public var JUMP_SPEED:int = 420;
		public var DRAG_SPEED:int = 200;
		public var MAX_SPEED:int = 400;
		
		//public function SpriteHolder(Left:Anim, Right:Anim, Fwidth:int, Fheight:int)
		public function SpriteHolder(Sprite:Class, Fwidth:int, Fheight:int) 
		{
			//left = Left;
			//right = Right;
			anim = Sprite;
			fwidth = Fwidth;
			fheight = Fheight;
		}
		
	}

}