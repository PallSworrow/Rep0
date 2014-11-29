package Swarrow.tools.valueManagers.objectBased {
	import view.patternMagic.valueManagers.interfaces.IstringValueManager;
	/**
	 * ...
	 * @author 
	 */
	public class StringValueManager implements IstringValueManager
	{
		private var source:Object;
		private var prop:String;
		public function StringValueManager(sourceObject:Object,propertyName:String) 
		{
			source = sourceObject;
			prop = propertyName;
		}
		public function setValue(value:String):void
		{
			source[prop] = value;
		}
		public function getValue():String
		{
			return String(source[prop]);
		}
	}

}