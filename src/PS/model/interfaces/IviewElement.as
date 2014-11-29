package PS.model.interfaces {
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 
	 */
	public interface IviewElement extends Idisplayable
	{
		function get x():Number
		function get y():Number
		function get rotation():Number
		function get width():Number
		function get height():Number
		
		
		
		function set x(value:Number):void
		function set y(value:Number):void
		function set rotation(value:Number):void
		
		function get name():String
		function set name(value:String):void
		
		
		function getBounds(targetCoordinateSpace:DisplayObject):Rectangle
	}
	
}