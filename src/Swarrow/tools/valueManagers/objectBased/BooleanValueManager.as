package Swarrow.tools.valueManagers.objectBased {
	import view.patternMagic.valueManagers.interfaces.IboolValueManager;
	/**
	 * ...
	 * @author 
	 */
	public class BooleanValueManager implements IboolValueManager
	{
		private var source:Object;
		private var prop:String
		public function BooleanValueManager(sourceObject:Object,propertyName:String) 
		{
			source = sourceObject;
			prop = propertyName;
		}
		public function setValue(value:Boolean):void
		{
			source[prop] = value;
		}
		public function getValue():Boolean
		{
			return Boolean(source[prop]);
		}
	}

}