package Swarrow.tools 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author pall
	 */
	public class RectangleDispatcher extends EventDispatcher
	{
		private var rect:Rectangle;
		public function RectangleDispatcher(rectangle:Rectangle) 
		{
			rect = rectangle;
		}
		private function alarm():void
		{
			dispatchEvent(new Event(Event.CHANGE));
		}
		public function update(rectangle:Rectangle):void
		{
			rect = rectangle;
			alarm();
		}
		//setters:
		
		public function set x(value:int):void 
		{
			rect.x = value;
			alarm();
		}
		public function set y(value:int):void
		{
			rect.y = value;
			alarm();
		}
		public function set width(value:int):void
		{
			rect.width = value;
			alarm();
		}
		public function set height(value:int):void
		{
			rect.height = value;
			alarm();
		}
		
		//getters:
		
		public function get x():int 	{return rect.x}
		public function get y():int 	{return rect.y}
		public function get width():int {return rect.width}
		public function get height():int{return rect.height}
		
	}

}