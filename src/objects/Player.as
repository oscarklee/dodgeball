package objects 
{
	import Box2D.Common.Math.b2Vec2;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import utils.Constants;
	import utils.Utils;
	/**
	 * ...
	 * @author Oklee
	 */
	public class Player extends Ball
	{
		private var left:Boolean = false, right:Boolean = false, up:Boolean = false, down:Boolean = false;
		public function Player(world:World) 
		{
			super(world);
			setColor(Constants.playerColor);
			setPosition(world.getWidth() / 2, world.getHeight() / 2);
			
			//events
			addEventListener(Event.ENTER_FRAME, move);
			world.main.stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDown);
            world.main.stage.addEventListener(KeyboardEvent.KEY_UP,keyUp);
		}
		
<<<<<<< HEAD
		 private function move(e:Event):void {
            var force:b2Vec2 = new b2Vec2(0, 0);
            
            if (left) {
                force.Add(new b2Vec2(-Constants.playerForce,0));
            }
            if (right) {
                force.Add(new b2Vec2(Constants.playerForce,0));
            }
            if (up) {
                force.Add(new b2Vec2(0,-Constants.playerForce));
            }
            if (down) {
                force.Add(new b2Vec2(0,Constants.playerForce));
            }
            // if there is any force, then apply it
            if (force.x || force.y) {
                body.ApplyImpulse(force,body.GetWorldCenter());
            }
        }
=======
		public function tick(e:Event):void {
			player.setPosition(Utils.pixels2meters(mouseX), Utils.pixels2meters(mouseY));
		}
>>>>>>> origin/dev
		
		private function keyDown(e:KeyboardEvent):void {
            switch (e.keyCode) {
                case 37 :
                    left=true;
                    break;
                case 38 :
                    up=true;
                    break;
                case 39 :
                    right=true;
                    break;
                case 40 :
                    down=true;
                    break;
            }
        }
        
        private function keyUp(e:KeyboardEvent):void {
            switch (e.keyCode) {
                case 37 :
                    left=false;
                    break;
                case 38 :
                    up=false;
                    break;
                case 39 :
                    right=false;
                    break;
                case 40 :
                    down=false;
                    break;
            }
        }
	}

}