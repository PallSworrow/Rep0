package Swarrow.tools.valueManagers.funcBased {
	import view.patternMagic.valueManagers.interfaces.IvecStringValueManager;
	/**
	 * ...
	 * @author 
	 */
	public class VecStringValueManager2 implements IvecStringValueManager
	{
		
		private var _getValue:Function;
		private var _setValue:Function
		public function VecStringValueManager2(getter:Function,setter:Function) 
		{
			_getValue = getter;
			_setValue = setter;
		}
		public function setValue(value:Vector.<String>):void
		{
			_setValue(value);
		}
		public function getValue():Vector.<String>
		{
			return Vector.<String>(_getValue());
		}
	}

}