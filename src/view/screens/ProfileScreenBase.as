package view.screens 
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import model.profiles.MusicianProfile;
	import PS.model.BaseSprite;
	import PS.model.interfaces.IviewElement;
	import PS.view.button.interfaces.Ibtn;
	import PS.view.button.PsButton;
	import PS.view.factories.defaults.DefaultButtonFactory;
	import PS.view.factories.interfaces.IbuttonFactory;
	import PS.view.layouts.implementations.listTyped.SimpleListLayout;
	import PS.view.layouts.implementations.listTyped.StringListLayout_light;
	import PS.view.layouts.implementations.tagTyped.SimpleTagLayout;
	import PS.view.layouts.interfaces.Ilayout;
	import PS.view.layouts.interfaces.IlistLayout;
	import PS.view.scroller.ListScroller;
	import PS.view.textView.SimpleText;
	import Swarrow.models.screenManager.interfaces.IscreenManager;
	import flash.display.DisplayObjectContainer;
	import Swarrow.models.screenManager.bases.ScreenBase;
	
	/**
	 * ...
	 * @author 
	 */
	public class ProfileScreenBase extends ScreenBase 
	{
		private static const LAYOUT_TAGS:String = 'taglayout';
		private static const LAYOUT_LIST:String = 'listlayout';
		private static const LAYOUT_STRING:String = 'strnglayout';
		private static const PHOTOS3:String = 'photos3';
		private static const GRAPHICS:String = 'graphics';
		private static const BTN:String = 'btn';
		private static const TAGS:String = 'tags';
		private static const CHECKBOX:String = 'checkbox';
		
		
		private var scroller:ListScroller;
		private var backBtn:Ibtn;
		private var _allowBack:Boolean;
		public function ProfileScreenBase(allowBack:Boolean) 
		{
			super();
			scroller = new ListScroller(200, 100);
			scroller.itemProvider = render;
			scroller.snapToPages = false;
			
			addChild(scroller);
			
		}
		override public function show(container:DisplayObjectContainer, params:Object, manager:IscreenManager):void 
		{
			super.show(container, params, manager);
			if (_allowBack)
			{
				backBtn = DefaultButtonFactory.createBtn('Back');
				backBtn.setHandler(currentManager.back);
				addChild(backBtn);
				scroller.y = backBtn.height;
			}
			else scroller.y = 0;
			
		
		}
		override public function hide():void 
		{
			clear();
			super.hide();
			
		}
		
		override public function load(data:Object = null):void 
		{
			super.load(data);
			
			if (data) clear();
			else return;
			
			var items:Array = read(data);
			for each (var item:Object in items) 
			{
				scroller.addItem(item);
			}
			
		}
		override public function clear():void 
		{
			
			super.clear();
		}
		
		
		protected function read(data:Object):Array
		{
			
		}
		protected function render(data:Object):IviewElement
		{
			var res:IviewElement;
			var layout:Ilayout;
			var listLayout:IlistLayout;
			var tagLayout:SimpleTagLayout;
			switch(data.type)
			{
				case LAYOUT_LIST:
					listLayout = new SimpleListLayout();
					list = data.list;
					
					res = listLayout;
					break;
					
				case LAYOUT_STRING:
					listLayout = new StringListLayout_light(data.rectangle as Rectangle);
					listLayout.vertical = false;
					list = data.list;
					
					res = listLayout;
					break;
					
				case LAYOUT_TAGS:
					tagLayout = new SimpleTagLayout(data.rectangle);
					tagLayout.placeMethod = data.placeMethod;
					res = tagLayout;
					break;
					
				case PHOTOS3:
					res = createPhotos(data);
					break;
				case GRAPHICS:
					res = createGraphics(data);
					break;
				case BTN:
					res = createBtn(data);
					break;
				case TAGS:
					res = createTagModule(data);
					break;
				case CHECKBOX:
					res = createCheckBox(data);
					break;
				default: 
					trace('ERROR --------------');
					for (var prop:String in data) trace('data.' + prop + ' = ' + data[prop]);
					throw new Error('invalid data type: ' + data.type);
					break;
			}
			
			return res;
		}
		protected function createPhotos(list:Array):IviewElement
		{
			
		}
		protected function createGraphics(data:Object):IviewElement
		{
			if (data.content is IviewElement) return data.content as IviewElement
			var res:BaseSprite = new BaseSprite;
			if (data.content is DisplayObject) res.addChild(data.content as DisplayObject);
			if (data.content is String)
			{
				var tf:SimpleText = new SimpleText(data.font);
				tf.width = data.rectangle.width;
				tf.autoSize = 'left';
				tf.text = String(data.content);
				res.addChild(tf);
			}
			return res;
			 
		}
		protected function createBtn(data:Object):IviewElement
		{
			var btnName:String = '';
			var res:Ibtn;
			if (data.content is Ibtn) res = data.content as Ibtn;
			else
			{
				if (data.name) btnName = data.name;
				if (data.factory is IbuttonFactory) res = (data.factory as IbuttonFactory).createButton(btnName);
				else if (data.factory is Function) res = data.factory(btnName);
				else res = DefaultButtonFactory.createBtn(btnName);
			}
			if (data.handler is Function)
			{
				if (data.handlerParams) res.setHandler(data.handler as Function, data.handlerParams);
				else res.setHandler(data.handler as Function, data.handlerParams);
			}
			if (data.group) res.group = data.group;
			
			return res;
			
		}
		protected function createTagModule(data:Object):IviewElement
		{
			
		}
		protected function createCheckBox(data:Object):IviewElement
		{
			
		}
	}
	

}