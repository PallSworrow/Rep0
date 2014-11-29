package Swarrow.tools.valueManagers.funcBased {
	import view.patternMagic.valueManagers.interfaces.IboolValueManager;
	/**
	 * ...
	 * @author 
	 */
	public class BooleanValueManager2 implements IboolValueManager
	{
		private var _getValue:Function;
		private var _setValue:Function;
		public function BooleanValueManager2(getter:Function,setter:Function) 
		{
			_getValue = getter;
			_setValue = setter;
		}
		public function set flag(value:Boolean):void
		{
			_setValue(value);
		}
		public function get flag():Boolean
		{
			return Boolean(_getValue());
		}
	}

}