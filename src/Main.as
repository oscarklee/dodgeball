package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import objects.World;
	
	/**
	 * ...
	 * @author Oklee
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		
		//public var world:b2World;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var word:World = new World(this);
		}

	}

}