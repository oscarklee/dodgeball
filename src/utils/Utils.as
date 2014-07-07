package utils 
{
	/**
	 * ...
	 * @author Oklee
	 */
	public class Utils 
	{
		public static function meters2pixels(meters:Number):Number {
			return meters * Constants.PPM;
		}
		
		public static function pixels2meters(pixels:Number):Number {
			return pixels / Constants.PPM;
		}
		
	}

}