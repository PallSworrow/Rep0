package Swarrow.tools.valueManagers.objectBased {
	import Swarrow.tools.valueManagers.interfaces.IvecStringValueManager;
	/**
	 * ...
	 * @author 
	 */
	public class VecStringValueManager implements IvecStringValueManager
	{
		
		private var source:Object;
		private var prop:String
		public function VecStringValueManager(sourceObject:Object,propertyName:String) 
		{
			source = sourceObject;
			prop = propertyName;
		}
		public function setValue(value:Vector.<String>):void
		{
			source[prop] = value;
		}
		public function getValue():Vector.<String>
		{
			return Vector.<String>(source[prop]);
		}
	
	}

}