package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import model.AMini;
	import model.Hierarchy;
	import Swarrow.models.Globals;
	import Swarrow.models.screenManager.implts.ScreenManager;
	import Swarrow.models.screenManager.interfaces.IscreenManager;
	import view.NavigationPanel;
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Sprite 
	{
		private static var manager:IscreenManager;
		private var navigatePanel:NavigationPanel;
		static public function get screenManager():IscreenManager 
		{
			return manager;
		}
		public function Main():void 
		{
			addEventListener(Event.ADDED_TO_STAGE, addedToStage);
		}
		
		private function addedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, addedToStage);
			var ini:AMini = new AMini(980, 1200, stage);
			ini.init(onInited,'http://allmusiciants.freevar.com/getSearchData.php?');
		}
		
		private function onInited():void 
		{
			navigatePanel = new NavigationPanel();
			addChild(navigatePanel);
			
			manager = new ScreenManager();
			manager.init(this, new Hierarchy(), new Rectangle(0, navigatePanel.height, Globals.width, Globals.height));
			
		}
		
		
	}
	
}