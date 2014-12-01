package view.elements 
{
	import PS.model.BaseSprite;
	import PS.view.layouts.interfaces.IlistLayout;
	import Swarrow.tools.valueManagers.interfaces.IvecStringValueManager;
	
	/**
	 * ...
	 * @author pall
	 */
	public class ListModule extends BaseSprite 
	{
		private var manager:IvecStringValueManager;
		private var _layout:IlistLayout;
		private var currentList:Vector.<String>;
		private var itemProvider:Function;
		
		public function ListModule(itemFactory:Function, listProvider:IvecStringValueManager,editable:Boolean = false) 
		{
			super();
			manager = listProvider;
			itemProvider = itemFactory;
			currentList = manager.getValue();
		}
		
		public function set layout(value:IlistLayout):void 
		{
			if (layout) layout.dispose();
			_layout = value;
			if (!layout) return;
			for (var i:int = 0; i < currentList.length; i++) 
			{
				layout.addItem(itemProvider(currentList[i]));
			}
			layout.addTo(this);
		}
		
		public function get layout():IlistLayout 
		{
			return _layout;
		}
		
	}

}