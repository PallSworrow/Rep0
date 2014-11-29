package PS.model.requestSystem 
{
	/**
	 * Основа для выполнения запросов. 
	 * 
	 * DEFAULTS:
	 * Если не разширить методы - спустя 1 сек. возвращается случайным образом либо положительый, либо отрицательный ответ. 
	 * В параметрах ответа дублируется его тип: answerParams:{positive:boolean}
	 * @author 
	 */
	public final class RequestBase implements IrequestInstance
	{
		/*public static const REQUEST_PHAZE_WAIT:String = 'wait';
		public static const REQUEST_PHAZE_INPROGRESS:String = 'inProgress';
		public static const REQUEST_PHAZE_SOLVED:String = 'solved';
		public static const REQUEST_PHAZE_DISPOSED:String = 'disposed';
		
		
		
		private var _id:String;
		private var _params:Object
		private var handler0:Function
		private var handler1:Function
		private var _onComplete:Function;
		private var phaze:String;
		public function RequestBase(positive:Function,negatove:Function,params:Object, id:String) 
		{
			_id = id;
			_params = params;
			handler0 = positive;
			handler1 = negatove;
			phaze = REQUEST_PHAZE_WAIT;
			
		}
		protected function complete():void
		{
			if (_onComplete is Function) _onComplete(this);
			else throw Error(this + 'method complete called before init()');
		}
		
		/* INTERFACE PS.model.requestSystem.IrequestInstance */
		
		/*public function set onCompleteHandler(value:Function):void 
		{
			_onComplete = value;
		}
		
		public function get currentPhaze():String 
		{
			return phaze;
		}
		
		
		
		public function init():void 
		{
			phaze = REQUEST_PHAZE_INPROGRESS;
		}
		
		public function forceAnswer(positive:Boolean, params:Object):void 
		{
			phaze = REQUEST_PHAZE_SOLVED;
		}
		
		public function abort():void 
		{
			phaze = REQUEST_PHAZE_SOLVED;
		}
		
		public function dispose():void 
		{
			phaze = REQUEST_PHAZE_DISPOSED;
		}
		
		public function pause():void 
		{
			
		}*/
		
	}

}