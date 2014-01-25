package  
{
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class Anim 
	{
		public var name:String;
		public var frames:Array;
		public var frameRate:Number;
		public var looped:Boolean
		
		public function Anim(Name:String, Frames:Array, FrameRate:Number = 12, Looped:Boolean = true) 
		{
			name = Name;
			frames = Frames;
			frameRate = FrameRate;
			looped = Looped;
		}
		
	}

}