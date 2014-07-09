package objects 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.Utils;
	/**
	 * ...
	 * @author Oklee
	 */
	public class Player extends Sprite
	{
		private var player:Ball;
		public function Player(world:World) 
		{
			player = new Ball(world);
			player.setPosition(world.getWidth() / 2, world.getHeight() / 2);
			
			
		}
		
		public function tick(e:Event):void {
			player.setPosition(Utils.pixels2meters(mouseX), Utils.pixels2meters(mouseY));
		}
		
	}

}