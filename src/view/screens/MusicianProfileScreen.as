package view.screens 
{
	import flash.geom.Rectangle;
	import model.Embeds;
	import model.profiles.interfaces.IskillProfile;
	import model.profiles.MusicianProfile;
	import PS.model.interfaces.IviewElement;
	import PS.view.button.ButtonPhaze;
	import PS.view.button.interfaces.Ibtn;
	import PS.view.factories.defaults.DefaultButtonFactory;
	import PS.view.layouts.implementations.listTyped.StringListLayout_light;
	import PS.view.layouts.implementations.tagTyped.SimpleTagLayout;
	import Swarrow.tools.valueManagers.funcBased.VecStringValueManager2;
	import Swarrow.tools.valueManagers.objectBased.StringValueManager;
	import Swarrow.tools.valueManagers.objectBased.VecStringValueManager;
	import view.constants.Fonts;
	import view.factories.btns.HardCodeBtnFactory;
	import view.factories.btns.TagFactory;
	import view.factories.InstrumentIconFactory;
	/**
	 * ...
	 * @author 
	 */
	public class MusicianProfileScreen extends ProfileScreenBase
	{
		
		public function MusicianProfileScreen(allowBack:Boolean = false) 
		{
			super(allowBack);
		}
		private var profile:MusicianProfile;
		override protected function read(data:Object):Array 
		{
			profile = data as MusicianProfile;
			if (!profile) throw new Error('invaslid input data: ' + data);
			var centerLine:int = rect.width * 0.6;
			var res:Array = 
			[
				{type:LAYOUT_TAGS, 
					rectangle:new Rectangle(0,0,rect.width,0),
					placeMethod:function(root:SimpleTagLayout, objs:Object):void
					{
						if(objs.right && objs.left)
						objs.right.x = root.borderRight - objs.right.width;
					},
					list:
					[
						{type:LAYOUT_LIST, tagName:'left',
							list:
							[
								{type:TEXT, font:Fonts.TITLE,
								manager:new StringValueManager(profile, 'name') },
								{type:TEXT, font:Fonts.SIMPLE,
								manager:new StringValueManager(profile, 'city') }
								
							]
						},
						{type:LAYOUT_STRING, tagName:'right', 
							rectangle:new Rectangle(0,0,rect.width/2,0),
							list:
							[
								{type:GRAPHICS,
								content:createSearchFlag(profile.searchForMusician,HardCodeBtnFactory.S4MUS)}
							]
						}
					]
				},
				{type:LAYOUT_TAGS,
					rectangle:new Rectangle(0,0,rect.width,0),
					placeMethod:function(root:SimpleTagLayout, objs:Object):void
					{
						if (objs.right && objs.left)
						{
							objs.right.x = centerLine;
						}
					},
					list:
					[
						{type:LAYOUT_LIST,
							interval:10,
							tagName:'left',
							list:
							[
								{type:PHOTOS3,
								rectangle:new Rectangle(0,0,500,300),
								manager:new VecStringValueManager(profile, 'photos'), editable:false },
								
								{type:LIST_MODULE, factory:new TagFactory(0x0044ff),editable:false,
								layout:new StringListLayout_light(new Rectangle(0, 0, centerLine, 0)),
								manager:new VecStringValueManager(profile, 'styles') },
								
								{type:LAYOUT_STRING, 
									rectangle:new Rectangle(0,0,centerLine,0),
									list:
									[
										{type:BUTTON,
										content: HardCodeBtnFactory.inst.createButton(HardCodeBtnFactory.MAIL)}
										]
								},
								{type:GRAPHICS, font:Fonts.TITLE, content: 'Статус' },
								{type:TEXT, manager:new StringValueManager(profile, 'info'), 
								fonts:Fonts.SIMPLE},
								{type:GRAPHICS, font:Fonts.TITLE, content: 'Портфолио' },
								{type:LAYOUT_LIST, interval:10, list:getPortfolio(profile,centerLine)}
								
							]
						},
						{type:LAYOUT_LIST,
							tagName:'right',
							list:
							[
								{type:LIST_MODULE, factory:new InstrumentIconFactory(),editable:false,
								layout:new StringListLayout_light(new Rectangle(0, 0, rect.width - centerLine, 0)),
								manager:new VecStringValueManager2(profile.getInstrumentTypes, null) }
								//{}
								
							
							
							]
						}
					]	
				},
				{type:GRAPHICS, content:new Embeds.keys()},
				{type:GRAPHICS, content:new Embeds.keys()}
			];
			return res;
		}
		private function getPortfolio(prof:MusicianProfile, width:int):Array
		{
			var res:Array = [];
			var item:Object;
			for each (var instrument:IskillProfile in prof.instruments) 
			{
				item =
				{
					type:LAYOUT_TAGS,
					placeMethod:portFolioPlaceMethod,
					rectangle:new Rectangle(0, 0, width, 0),
					list:
					[
						{type:GRAPHICS, tagName:'icon',
						content:InstrumentIconFactory.createIcon(instrument.type)},
						
						{type:LIST_MODULE, factory:new TagFactory(0x0044ff),editable:false,
						layout:new StringListLayout_light(new Rectangle(0, 0, width-20, 0)),
						tagName:'tags',
						manager:new VecStringValueManager(instrument, 'tags') },
						
						{type:LIST_MODULE, factory:DefaultButtonFactory.inst,editable:false,
						layout:new StringListLayout_light(new Rectangle(0, 0, width-20, 0)),
						tagName:'audio',
						manager:new VecStringValueManager(instrument, 'audio') },
						
						{type:LIST_MODULE, factory:DefaultButtonFactory.inst,editable:false,
						layout:new StringListLayout_light(new Rectangle(0, 0, width-20, 0)),
						tagName:'video',
						manager:new VecStringValueManager(instrument,'video') }
						
					]
				}
				res.push(item);
			}
			return res;
			function portFolioPlaceMethod(root:SimpleTagLayout, obj:Object):void
			{
				obj.tags.x = obj.audio.x = obj.video.x = obj.icon.width;
			
			}
		}
		private function createSearchFlag(phaze:Boolean, type:String):IviewElement
		{
			var res:Ibtn = HardCodeBtnFactory.inst.createButton(type);
			if (phaze) res.setPhaze(ButtonPhaze.ACTIVE);
			return res;
		}
	}

}