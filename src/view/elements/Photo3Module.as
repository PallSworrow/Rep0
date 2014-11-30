package view.elements 
{
	import flash.geom.Rectangle;
	import PS.model.BaseSprite;
	import PS.view.previewer.bases.SimplePreview;
	import PS.view.previewer.FitTheSize;
	
	/**
	 * ...
	 * @author 
	 */
	public class Photo3Module extends BaseSprite 
	{
		private var prev0:SimplePreview;
		private var prev1:SimplePreview;
		private var prev2:SimplePreview;
		private var interval:int = 8;
		public function Photo3Module(rectangle:Rectangle) 
		{
			super();
			prev0 = createPreview(3 * rectangle.width / 4 - interval, rectangle.height);
			prev1 = createPreview(rectangle.width / 4, rectangle.height / 2 - interval / 2);
			prev1 = createPreview(rectangle.width / 4, rectangle.height / 2 - interval / 2);
			
			prev1.x = prev2.x = prev0.x + interval;
			prev2.y = rectangle.height / 2 + interval / 2;
		}
		private function createPreview(w:int, h:int):SimplePreview
		{
			var res:SimplePreview = new SimplePreview(w, h);
			res.ftsType = FitTheSize.FULL;
			return res;
		}
		
	}

}