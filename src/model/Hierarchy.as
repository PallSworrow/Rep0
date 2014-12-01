package model 
{
	import flash.utils.Dictionary;
	import Swarrow.models.screenManager.bases.SimpleHierarchy;
	import view.screens.MusicianProfileScreen;
	import view.screens.SearchScreen;
	
	/**
	 * ...
	 * @author 
	 */
	public class Hierarchy extends SimpleHierarchy 
	{
		
		public static const MAIN:String = 'main';
		public static const USER_PAGE:String = 'user_page';
		public static const MUSICIAN_PAGE:String = 'musician_page';
		public static const SEARCH_PAGE:String = 'search';
		
		public function Hierarchy() 
		{
			var hierarchy:Object = {}
			hierarchy[MAIN] = null;
			hierarchy[USER_PAGE] = null;
			hierarchy[MUSICIAN_PAGE] = new MusicianProfileScreen();
			hierarchy[SEARCH_PAGE] = new SearchScreen();
			super(hierarchy);
			
		}
		
	}

}