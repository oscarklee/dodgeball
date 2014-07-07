package objects 
{
	import Box2D.Common.Math.b2Vec2;
	import flash.display.Sprite;
	import utils.Constants;
	import utils.Utils;
	
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Collision.Shapes.b2CircleShape;
	import Box2D.Dynamics.b2FixtureDef;
	
		
	/**
	 * ...
	 * @author Oklee
	 */
	public class Ball extends Sprite 
	{
		private var bodyDef:b2BodyDef;
		private var circleShape:b2CircleShape;
		private var body:b2Body;
		private var fixtureDef:b2FixtureDef;
		public function Ball(world:World) 
		{
			bodyDef = new b2BodyDef();
			fixtureDef = new b2FixtureDef();
			circleShape = new b2CircleShape(Constants.ballRadio);
			fixtureDef.shape = circleShape;
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.userData = this;
			body = world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			
			//draw the ball
			draw();
		}
		
		public function draw():void {
			graphics.clear();
			graphics.beginFill(Constants.ballColor, 1);
			graphics.drawCircle(x, y, Utils.meters2pixels(Constants.ballRadio));
		}
		
		public function setPosition(x:Number, y:Number):void {
			body.SetPosition(new b2Vec2(x, y));
		}
		
	}

}