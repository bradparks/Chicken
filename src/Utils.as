package
{
	public class Utils
	{
		public static function Lerp( start : int, end : int, percent : Number) : int
		{
			return (start + percent*(end - start));
		}
	}
}