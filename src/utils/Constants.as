package utils 
{
	import Box2D.Common.Math.b2Vec2;
	
	/**
	 * ...
	 * @author Oklee
	 */
	public class Constants 
	{
		public static var debug:Boolean = true;
		public static var gravity:b2Vec2 = new b2Vec2(0.0, 0.0);
		public static var timeStep:Number = 1.0;
		public static var velocityIterations:int = 10;
		public static var positionIterations:int = 10;
		
		public static var PPM:Number = 30; //Pixels per meter
<<<<<<< HEAD
		public static var ballsNumber:Number = 10;
=======
		public static var ballsNumber:Number = 5;
>>>>>>> origin/dev
		public static var ballRadio:Number = 0.2;
		public static var ballColor:Number = 0xff0000;
		public static var ballVelocity:Number = 6;
		
		public static var playerForce:Number = 1; //force of the player to advance in Newtons
		public static var playerColor:Number = 0x0000FF;
		
		public static var roomThick:Number = 0.2;
		
	}

}