package model 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import model.profiles.MusicianProfile;
	import Swarrow.models.Globals;
	import Swarrow.models.Initialiser;
	import vk.APIConnection;
	
	/**
	 * ...
	 * @author 
	 */
	public class AMini extends Initialiser 
	{
		private var onComplete:Function;
		public function AMini(width:int, height:int, stage:Stage) 
		{
			super(width, height, stage);
			
		}
		override public function init( completeHandler:Function,config:String = null):void 
		{
			onComplete = completeHandler;
			super.init(onSuperInited,config);
		}
		private function onSuperInited():void
		{
			//load environment:
			var flashVars: Object = Globals.stage.loaderInfo.parameters as Object; 
			if (!flashVars.api_id) 
			{ 
			  // -- For local testing enter you test-code here: 
			  flashVars['api_id'] = 1888171; 
			  flashVars['viewer_id'] = 66748; 
			  flashVars['sid'] = "7e22c25d7fece88f2316553937ff24f43e1073ca28e8b4302e65db35fa"; 
			  flashVars['secret'] = "6113n3e4g3"; 
			  // -- // 
			}
			Data._viewerId = flashVars.viewer_id;
			var VK:APIConnection = new APIConnection(flashVars);
			
			onEnviromentLoaded();
			
		}
		private function onEnviromentLoaded():void
		{
			//log in:
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener(Event.COMPLETE, onLogged);
			var req:URLRequest = new URLRequest('http://allmusiciants.freevar.com/login.php');
			var vars:URLVariables = new URLVariables();
			vars['user_id'] = Data.viewerId;
			req.data = vars;
			req.method = URLRequestMethod.POST;
			loader.load(req);
		}
		private function onLogged(e:Event):void
		{
			var ld_res:Array = String(e.target.data).split('&');
			var isNew:Boolean = !Boolean(ld_res[0]);
			if (isNew)
			{
				Data._viewerProfile = new MusicianProfile();
				Data.viewerProfile.id = Data.viewerId;
			}
			else 
			{
				Data._viewerProfile = MusicianProfile.parse(String(ld_res[1]));
			}
			onComplete();
		}
	}

}