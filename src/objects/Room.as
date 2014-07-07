package objects 
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import flash.display.Sprite;
	import utils.Utils;
	
	/**
	 * ...
	 * @author Oklee
	 */
	public class Room extends Sprite 
	{
		private var world:World;
		public function Room(world:World) 
		{
			this.world = world;
			
			var thick:Number = 0.2;
			//drawBox(0, 0, world.getWidth(), thick);
			drawBox(0, 1, world.getWidth(), thick);
		}
		
		private function drawBox(x:Number, y:Number, w:Number, h:Number):void {
			var boxSprite:Sprite = new Sprite();
			var bodyDef:b2BodyDef = new b2BodyDef();
			var body:b2Body;
			var box:b2PolygonShape = new b2PolygonShape();
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			
			bodyDef.position.Set(x, y);
			box.SetAsBox(w, h);
			fixtureDef.shape = box;
			bodyDef.userData = boxSprite;
			body = world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);
			
			boxSprite.graphics.clear();
			boxSprite.graphics.beginFill(0x00ff00, 1);
			boxSprite.graphics.drawRect(Utils.meters2pixels(x), 
										Utils.meters2pixels(y), 
										Utils.meters2pixels(w),
										Utils.meters2pixels(h));
			addChild(boxSprite);
			
		}
		
	}

}