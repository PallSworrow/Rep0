package view.screens 
{
	import flash.display.DisplayObjectContainer;
	import PS.view.button.interfaces.Ibtn;
	import PS.view.factories.defaults.DefaultButtonFactory;
	import PS.view.scroller.ListScroller;
	import Swarrow.models.screenManager.bases.ScreenBase;
	import Swarrow.models.screenManager.interfaces.IscreenManager;
	import Swarrow.tools.RectangleDispatcher;
	import view.elements.SearchPanelBase;
	import view.elements.UserSearchPanel;
	
	/**
	 * ...
	 * @author 
	 */
	public class SearchScreen extends ScreenBase 
	{
		private var scroller:ListScroller;
		private var panel:SearchPanelBase;
		private var searchBtn:Ibtn;
		public function SearchScreen() 
		{
			super();
			scroller = new ListScroller(200, 100);
			searchBtn = DefaultButtonFactory.createBtn('Найти');
			panel = new UserSearchPanel();
			searchBtn.setHandler(onSearchBtn);
		}
		
		private function onSearchBtn():void 
		{
			
		}
		override public function show(container:DisplayObjectContainer, params:Object, manager:IscreenManager):void 
		{
			addChild(scroller);
			addChild(panel);
			searchBtn.addTo(this);
			super.show(container, params, manager);
		}
		override protected function rectangleChange():void 
		{
			super.rectangleChange();
			panel.width = 200;
			
			scroller.x = rect.x + 25;
			scroller.y = rect.y + 10;
			searchBtn.y = rect.y + 10;
			
			scroller.height = rect.height - 50;
			panel.height = rect.height-panel.y-25
			panel.y = searchBtn.y + searchBtn.height + 5;
			panel.x = rect.bottomRight - panel.width - 25;
			searchBtn.x = panel.x+ (panel.width-searchBtn.width) / 2;
			
		}
		
	}

}