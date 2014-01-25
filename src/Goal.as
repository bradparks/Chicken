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
			makeGraphic(100, 100, 0xff00ff00);
			
			acceleration.y = 420;
		}
		
	}

}