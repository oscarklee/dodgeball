package objects 
{
	import Box2D.Common.Math.b2Vec2;
	import flash.display.Sprite;
	import flash.geom.ColorTransform;
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
		protected var body:b2Body;
		private var fixtureDef:b2FixtureDef;
		protected var world:World;
		public function Ball(world:World) 
		{
			this.world = world;
			
			bodyDef = new b2BodyDef();
			fixtureDef = new b2FixtureDef();
			circleShape = new b2CircleShape(Constants.ballRadio);
			fixtureDef.friction = 1;
			fixtureDef.shape = circleShape;
			fixtureDef.restitution = 1;
			bodyDef.type = b2Body.b2_dynamicBody;
			bodyDef.userData = this;
			body = world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			
			//draw the ball
			if (!Constants.debug) draw();
		}
		
		public function draw():void {
			graphics.clear();
			graphics.beginFill(Constants.ballColor, 1);
			graphics.drawCircle(x, y, Utils.meters2pixels(Constants.ballRadio));
		}
		
		public function setPosition(x:Number, y:Number):void {
			body.SetPosition(new b2Vec2(x, y));
		}
		
		public function setVelocity(x:Number, y:Number):void {
			body.SetLinearVelocity(new b2Vec2(x, y));
		}
		
		public function setColor(color:Number):void {
			var newColor:ColorTransform = new ColorTransform();
			newColor.color = color;
			transform.colorTransform = newColor;
		}
		
	}

}