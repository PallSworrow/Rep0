package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import model.AMini;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			var ini:AMini = new AMini(980, 1200, stage);
			ini.init(onInited);
		}
		
		private function onInited():void 
		{
			trace('inited');
		}
		
	}
	
}