package view.screens 
{
	import model.profiles.MusicianProfile;
	/**
	 * ...
	 * @author 
	 */
	public class MusicianProfileScreen extends ProfileScreenBase
	{
		
		public function MusicianProfileScreen() 
		{
			
		}
		private var profile:MusicianProfile;
		override protected function read(data:Object):Array 
		{
			profile = data as MusicianProfile();
			if (!profile) throw new Error('invaslid input data: ' + data);
			
			var res:Array = 
			[
				{}
			
			
			
			
			
			
			
			
			]
		}
	}

}