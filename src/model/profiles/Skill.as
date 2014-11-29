package model.profiles 
{
	import model.constants.SkillLevel;
	import model.profiles.interfaces.IskillProfile;
	/**
	 * ...
	 * @author 
	 */
	public class Skill implements IskillProfile
	{
		public static function parse(item:Object):Skill
		{
			var res:Skill = new Skill(item.type);
			for each(var prop:Object in item.tags)
			{
				res.tags.push(String(prop));
			}
			res.level = item.level;
			return res;
			
		}
		
		private var _type:String;
		private var _tags:Vector.<String> = new Vector.<String>;
		private var _level:int=0;
		private var _audio:Vector.<String> = new Vector.<String>;
		private var _video:Vector.<String> = new Vector.<String>;
		
		public function Skill(type:String) 
		{
			_type = type;
		}
		
		/* INTERFACE model.profiles.interfaces.IskillProfile */
		
		public function set audio(value:Vector.<String>):void 
		{
			_audio = value;
		}
		
		public function get audio():Vector.<String> 
		{
			return _audio;
		}
		
		public function set video(value:Vector.<String>):void 
		{
			_video = value;
		}
		
		public function get video():Vector.<String> 
		{
			return _video;
		}
		
		/* INTERFACE model.profiles.interfaces.IskillProfile */
		
		public function get type():String 
		{
			return _type;
		}
		
		public function get tags():Vector.<String> 
		{
			return _tags;
		}
		
		public function get level():int 
		{
			return _level;
		}
		
		public function set level(value:int):void 
		{
			_level = value;
		}
		
	}

}