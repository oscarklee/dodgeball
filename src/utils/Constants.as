package utils 
{
	import Box2D.Common.Math.b2Vec2;
	
	/**
	 * ...
	 * @author Oklee
	 */
	public class Constants 
	{
		public static var gravity:b2Vec2 = new b2Vec2(0.0, 9.8);
		public static var timeStep:Number = 1.0;
		public static var velocityIterations:int = 10;
		public static var positionIterations:int = 10;
		
		public static var PPM:Number = 30; //Pixels per meter
		public static var ballsNumber:Number = 5;
		public static var ballRadio:Number = 0.2;
		public static var ballColor:Number = 0xff0000;
		
	}

}