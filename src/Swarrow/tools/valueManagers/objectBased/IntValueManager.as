package Swarrow.tools.valueManagers.objectBased {
	import view.patternMagic.valueManagers.interfaces.IintValueManager;
	/**
	 * ...
	 * @author 
	 */
	public class IntValueManager implements IintValueManager
	{
		
		private var source:Object;
		private var prop:String
		public function IntValueManager(sourceObject:Object,propertyName:String) 
		{
			source = sourceObject;
			prop = propertyName;
		}
		public function setValue(value:int):void
		{
			source[prop] = value;
		}
		public function getValue():int
		{
			return int(source[prop]);
		}
		
	}

}