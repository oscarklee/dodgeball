package objects 
{
	import Box2D.Dynamics.b2DebugDraw;
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
		private var room:Room;
		public function World(main:Main) 
		{
			
			super(Constants.gravity, true);
			frameRate = main.stage.frameRate;
			this.main = main;
			
			var player:Player = new Player(this);
			main.addEventListener(Event.ENTER_FRAME, player.tick);
			
			createRoom();
			createBalls();
			debugDraw(Constants.debug);
			
			main.addEventListener(Event.ENTER_FRAME, tick);
		}
		
		private function createRoom():void {
			room = new Room(this);
			main.addChild(room);
		}
		
		private function createBalls():void {
			for (var i:int = 0; i <= Constants.ballsNumber; i++) {
				var ball:Ball = new Ball(this);
				
				//set position
				var diameter:Number = Constants.ballRadio * 2;
				var margin:Number = Constants.roomThick + 0.5;
				var numOfBallsInRow:int = Math.round((getWidth() - 2*margin) / (diameter + 0.2)) + 1;
				var numOfCol:int = i % numOfBallsInRow;
				var numOfRow:int = Math.floor(i / numOfBallsInRow);

				ball.setPosition(margin + numOfCol * (diameter + 0.2), margin + numOfRow * (diameter + 0.2));
				ball.setVelocity(getRandomVel(), getRandomVel());
				
				main.addChild(ball);				
			}
		}
		
		private function getRandomVel():Number {
			return (Math.pow(-1, Math.round(Math.random())+1)) * Constants.ballVelocity;
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
			
			DrawDebugData();
		}
		
		public function debugDraw(enable:Boolean):void {
			if (!enable) return;			
			var dbgDraw:b2DebugDraw = new b2DebugDraw();
			dbgDraw.SetSprite(main);
			dbgDraw.SetFillAlpha(0.3);
			dbgDraw.SetLineThickness(1.0);
			dbgDraw.SetDrawScale(30);
			dbgDraw.SetFlags(b2DebugDraw.e_shapeBit | b2DebugDraw.e_jointBit);
			SetDebugDraw(dbgDraw);
		}
		
		public function getWidth():Number {
			return Utils.pixels2meters(main.stage.stageWidth);
		}
		
		public function getHeight():Number {
			return Utils.pixels2meters(main.stage.stageHeight);
		}
	}

}