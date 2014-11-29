package Swarrow.tools.valueManagers.funcBased {
	import view.patternMagic.valueManagers.interfaces.IintValueManager;
	/**
	 * ...
	 * @author 
	 */
	public class IntValueManager2 implements IintValueManager
	{
		private var _getValue:Function;
		private var _setValue:Function;
		
		public function IntValueManager2(getter:Function,setter:Function) 
		{
			_getValue = getter;
			_setValue = setter;
		}
		public function set flag(value:int):void
		{
			_setValue(value);
		}
		public function get flag():int
		{
			return int(_getValue());
		}
		
	}

}