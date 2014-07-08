package objects 
{
	import Box2D.Collision.Shapes.b2PolygonShape;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2FixtureDef;
	import flash.display.Sprite;
	import utils.Utils;
	import utils.Constants;
	
	/**
	 * ...
	 * @author Oklee
	 */
	public class Room extends Sprite 
	{
		private var world:World;
		private var boxes:Array;
		public function Room(world:World) 
		{
			this.world = world;
			boxes = new Array(4);
			
			var thick:Number = Constants.roomThick;
			boxes.push(drawBox(thick, 0, world.getWidth() - 2*thick, thick));
			boxes.push(drawBox(thick, world.getHeight() - thick, world.getWidth() - 2*thick, thick));
			boxes.push(drawBox(0, thick, thick, world.getHeight() - 2*thick));
			boxes.push(drawBox(world.getWidth() - thick, thick, thick, world.getHeight() - 2*thick));
		}
		
		private function drawBox(x:Number, y:Number, w:Number, h:Number):b2Body {
			var boxSprite:Sprite = new Sprite();
			var bodyDef:b2BodyDef = new b2BodyDef();
			var body:b2Body;
			var box:b2PolygonShape = new b2PolygonShape();
			var fixtureDef:b2FixtureDef = new b2FixtureDef();
			var hx:Number = w / 2;
			var hy:Number = h / 2;
			
			bodyDef.position.Set(x + hx, y + hy);
			box.SetAsBox(hx, hy);
			fixtureDef.friction = 1;
			fixtureDef.shape = box;
			bodyDef.userData = boxSprite;
			body = world.CreateBody(bodyDef);
			body.CreateFixture(fixtureDef);

			if (!Constants.debug) draw(boxSprite, w, h); 
			return body;
		}
		
		private function draw(boxSprite:Sprite, w:Number, h:Number):void {
			boxSprite.graphics.clear();
			boxSprite.graphics.beginFill(0x00ff00, 1);
			boxSprite.graphics.drawRect(-Utils.meters2pixels(w / 2), 
										-Utils.meters2pixels(h / 2), 
										Utils.meters2pixels(w),
										Utils.meters2pixels(h));
			addChild(boxSprite);
		}
		
		public function shake():void {
			boxes[0].SetPosition(new b2Vec2(2, 2));
		}
		
	}

}