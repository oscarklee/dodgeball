package objects 
{
	import Box2D.Dynamics.b2World;
	import utils.Constants;
	import flash.events.Event;
	import flash.display.Sprite;
	import Box2D.Dynamics.b2Body;
	import utils.Utils;
	
	/**
	 * ...
	 * @author Oklee
	 */
	public class World extends b2World
	{
		private var main:Main;
		private var frameRate:Number;
		public function World(main:Main) 
		{
			
			super(Constants.gravity, true);
			frameRate = main.stage.frameRate;
			this.main = main;
			
			createRoom();
			//createBalls();
			
			main.addEventListener(Event.ENTER_FRAME, tick);
		}
		
		private function createRoom():void {
			var room:Room = new Room(this);
			main.addChild(room);
		}
		
		private function createBalls():void {
			for (var i:int = 1; i <= Constants.ballsNumber; i++) {
				var ball:Ball = new Ball(this);
				
				//set position
				ball.setPosition(i * (Constants.ballRadio + 0.5), 2 * Constants.ballRadio);
				
				main.addChild(ball);				
			}
		}
		
		public function tick(e:Event):void {
			Step(Constants.timeStep / frameRate, Constants.velocityIterations, Constants.positionIterations);
			
			// Go through body list and update sprite positions/rotations
			for (var bb:b2Body = GetBodyList(); bb; bb = bb.GetNext()) {
				if (bb.GetUserData() is Sprite) {
					var sprite:Sprite = bb.GetUserData() as Sprite;
					sprite.x = bb.GetPosition().x * frameRate;
					sprite.y = bb.GetPosition().y * frameRate;
					sprite.rotation = bb.GetAngle() * (180/Math.PI);
				}
			}
		}
		
		public function getWidth():Number {
			return Utils.pixels2meters(main.stage.stageWidth);
		}
		
		public function getHeight():Number {
			return Utils.pixels2meters(main.stage.stageHeight);
		}
	}

}