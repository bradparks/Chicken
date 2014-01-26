package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Ohmnivore
	 */
	public class Goal extends FlxSprite
	{
		
		public function Goal(X, Y) 
		{
			super(X, Y);
			//makeGraphic(100, 100, 0xff);
			loadGraphic(Assets.TRAIN);
			
			acceleration.y = 420;
		}
		
	}

}