package 
{
    import org.flixel.*;
	import flash.events.Event;
	
	[SWF(width = "640", height = "480", backgroundColor = "#80CAFF")]
	[Frame(factoryClass="Preloader")]

	public class Main extends org.flixel.FlxGame
	{
		
		public function Main()
		{
			FlxG.debug = true;
			super(640, 480, MenuState, 1, 30, 30);
		}
	}
	
}