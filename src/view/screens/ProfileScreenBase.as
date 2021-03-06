package view.screens 
{
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	import flash.text.TextFormat;
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
	import Swarrow.tools.valueManagers.interfaces.IboolValueManager;
	import Swarrow.tools.valueManagers.interfaces.IintValueManager;
	import view.constants.Fonts;
	import view.elements.Flag2Module;
	import view.elements.FlagModule;
	import view.elements.ListModule;
	import view.elements.Photo3Module;
	import view.elements.TextModule;
	
	/**
	 * ...
	 * @author 
	 */
	public class ProfileScreenBase extends ScreenBase 
	{
		protected static const LAYOUT_TAGS:String = 'taglayout';
		protected static const LAYOUT_LIST:String = 'listlayout';
		protected static const LAYOUT_STRING:String = 'stringlayout';
		protected static const TEXT:String = 'text';
		protected static const PHOTOS3:String = 'photos3';
		protected static const GRAPHICS:String = 'graphics';
		protected static const BUTTON:String = 'btn';
		protected static const LIST_MODULE:String = 'tags';
		protected static const CHECKBOX:String = 'checkbox';
		protected static const PROVIDER:String = 'provider';
		
		
		
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
				backBtn.addTo(this);
			}
			
		
		}
		override protected function rectangleChange():void 
		{
			super.rectangleChange();
			if (_allowBack)
			{
				backBtn.y = rect.y;
				scroller.y = backBtn.y + backBtn.height;
			}
			else scroller.y = rect.y;
			trace('SCREEN: ' + rect.y);
			scroller.height = rect.bottomLower - scroller.y;
			scroller.width = rect.width;
			/*
			graphics.clear();
			graphics.beginFill(0,1);
			graphics.drawRect(0, scroller.y, 100, 100);
			graphics.endFill();*/
			
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
			scroller.clear();
			super.clear();
		}
		
		
		protected function read(data:Object):Array
		{
			throw 'this method must be overrided';
			return null;
		}
		protected function render(data:Object):IviewElement
		{
			var res:IviewElement;
			var layout:Ilayout;
			var listLayout:IlistLayout;
			var tagLayout:SimpleTagLayout;
			var list:Array;
			var item:Object;
			switch(data.type)
			{
				case LAYOUT_LIST:
					listLayout = new SimpleListLayout();
					list = data.list;
					if (data.interval) listLayout.pagesInterval = data.interval;
					for each(item in list)
					listLayout.addItem(render(item));
					res = listLayout;
					break;
					
				case LAYOUT_STRING:
					if (!data.rectangle) throw new Error('rectangle must be defined');
					listLayout = new StringListLayout_light(data.rectangle as Rectangle);
					list = data.list;
					if (data.interval) listLayout.pagesInterval = data.interval;
					for each(item in list)
					{
						listLayout.addItem(render(item));
						trace(this, LAYOUT_STRING, item);
					}
					res = listLayout;
					break;
					
				case LAYOUT_TAGS:
					tagLayout = new SimpleTagLayout(data.rectangle);
					tagLayout.autoUpdate = false;
					tagLayout.placeMethod = data.placeMethod;
					list = data.list;
					for each(item in list)
					{
						trace('add item: ' + item.tagName);
						tagLayout.addItem(render(item), item.tagName);
					}
					tagLayout.update();
					res = tagLayout;
					break;
				case TEXT:
					res = createText(data);
					break;
				case PHOTOS3:
					res = createPhotos(data);
					break;
				case GRAPHICS:
					res = createGraphics(data);
					break;
				case BUTTON:
					res = createBtn(data);
					break;
				case LIST_MODULE:
					res = createListModule(data);
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
		protected function createText(data:Object):IviewElement
		{
			var res:TextModule = new TextModule(data.manager, data.font);
			res.show();
			return res;
		}
		protected function createPhotos(data:Object):IviewElement
		{
			return new Photo3Module(data.rectangle, data.manager, data.editable);
		}
		protected function createGraphics(data:Object):IviewElement
		{
			if (data.content is IviewElement) return data.content as IviewElement
			var res:BaseSprite = new BaseSprite;
			if (data.content is DisplayObject) res.addChild(data.content as DisplayObject);
			if (data.content is String)
			{
				var tf:SimpleText = new SimpleText();
				if (data.font is TextFormat) tf.defaultTextFormat = data.font;
				if(data.rectangle)tf.width = data.rectangle.width;
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
		protected function createListModule(data:Object):IviewElement
		{
			var provider:Function;
			if (data.factory is Function) provider = data.factory;
			if (data.factory is IbuttonFactory) 
			provider = (data.factory as IbuttonFactory).createButton;
			var lm:ListModule = new ListModule(provider, data.manager, data.editable);
			if (data.layout is Function) data.layout = data.layout();
			if (data.layout is IlistLayout) lm.layout = data.layout;
			else throw new Error('invalid data.layout param: ' + data.layout);
			return lm;
		}
		protected function createCheckBox(data:Object):IviewElement
		{
			var res:FlagModule;
			var format:TextFormat;
			if (data.font is TextFormat) format = data.font;
			else format = Fonts.SIMPLE;
			
			if (data.manager is IintValueManager)
			{
				res = new Flag2Module(data.manager as IintValueManager, 
				data.factory,
				String(data.name), 
				data.options,
				format);
			}
			else
			{
				res = new FlagModule(data.manager as IboolValueManager,
				data.factory,
				String(data.name),
				format);
			}
			return res;
		}
	}
	

}