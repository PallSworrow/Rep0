package Swarrow.models.screenManager.bases 
{
	import flash.utils.Dictionary;
	import PS.models.screenManager.interfaces.Iscreen;
	import PS.models.screenManager.interfaces.IscreenHierarchy;
	
	/**
	 * ...
	 * @author pall
	 */
	public class SimpleHierarchy implements IscreenHierarchy 
	{
		private var hr:Dictionary;
		public function SimpleHierarchy(hierarchy:Dictionary) 
		{
			hr = hierarchy;
		}
		
		/* INTERFACE PS.models.screenManager.interfaces.IscreenHierarchy */
		
		public function getScreen(location:Object):Iscreen 
		{
			var res:Object;
			if (location is String)
			{
				res = hr[location];
			}
			else if (location is Number)
			{
				var i:int = 0;
				for each(var scr:Object in hr)
				{
					if (i == location)
					{
						res = scr;
						break;
					}
					i++;
				}
			}
			if (res is Function) res = res();
			
			return res as Iscreen;
		}
		
	}

}