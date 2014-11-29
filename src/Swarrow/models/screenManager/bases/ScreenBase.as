package Swarrow.models.screenManager.bases 
{
	import flash.display.DisplayObject;
	import PS.models.screenManager.interfaces.IscreenManager;
	import flash.geom.Rectangle;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import PS.models.screenManager.interfaces.Iscreen;
	import PS.tools.RectangleDispatcher;
	
	/**
	 * ...
	 * @author pall
	 */
	public class ScreenBase extends Sprite implements Iscreen 
	{
		protected var currentRect:RectangleDispatcher;
		protected var currentManager:IscreenManager
		public function ScreenBase() 
		{
			super();
			
		}
		
		/* INTERFACE PS.models.screenManager.interfaces.Iscreen */
		
		public function show(container:DisplayObjectContainer, rectangle:RectangleDispatcher, params:Object, manager:IscreenManager):void 
		{
			container.addChild(this);
			currentRect = rectangle;
			currentManager = manager;
		}
		
		public function hide():void 
		{
			if (parent) parent.removeChild(this);
		}
		
		public function load(data:Object = null):void 
		{
			
		}
		
		public function clear():void 
		{
			
		}
		
	}

}