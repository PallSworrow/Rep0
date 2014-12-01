package view.elements 
{
	import flash.text.TextFormat;
	import PS.view.layouts.implementations.tagTyped.SimpleTagLayout;
	import Swarrow.tools.valueManagers.interfaces.IstringValueManager;
	import flash.events.Event;
	import flash.text.TextFieldType;
	import PS.model.BaseSprite;
	import PS.model.interfaces.IviewElement;
	import PS.view.button.interfaces.Ibtn;
	import PS.view.factories.defaults.DefaultButtonFactory;
	import PS.view.scroller.pages.EmptyPage;
	import PS.view.textView.SimpleText;
	/**
	 * ...
	 * @author 
	 */
	public class TextModule extends SimpleTagLayout  
	{
		private var tf:SimpleText;
		private var tfInput:SimpleText;
		private var vm:IstringValueManager;
		private var editBtn:Ibtn;
		private var confirmBtn:Ibtn;
		private var cancelBtn:Ibtn;
		private var oldValue:String;
		
		public function TextModule(valueManager:IstringValueManager,font:TextFormat ) 
		{
			super();
			disposeChildrenOnRemove = false;
			disposeRemovedItems = false;
			tf = new SimpleText(font);
			tf.border = true;
			tfInput = new SimpleText(font);
			tfInput.type = TextFieldType.INPUT;
			vm = valueManager;
			addChild(tf);
			editBtn = DefaultButtonFactory.createBtn('Редактировать');
			editBtn.setHandler(onEditBtn);
			confirmBtn = DefaultButtonFactory.createBtn('ок');
			confirmBtn.setHandler(onEditComplete,true);
			cancelBtn = DefaultButtonFactory.createBtn('отмена');
			cancelBtn.setHandler(onEditComplete,false);
			
		}
		override protected function nativePlaceMethod(item:IviewElement, tag:String):void 
		{
			if (tag == 'edit') item.x = tf.width;
			if (tag == 'cancel') item.x = tfInput.width;
			if (tag == 'ok') item.x = cancelBtn.x + cancelBtn.width;
		}
		protected function onEditBtn():void 
		{
			tf.visible = false;
			editBtn.remove();
			tfInput.text = tf.text;
			addItem(tfInput, 'input');
			addItem(cancelBtn, 'cancel');
			addItem(confirmBtn, 'ok');
			tfInput.addEventListener(Event.CHANGE, tfInput_change);
		}
		
		private function tfInput_change(e:Event):void 
		{
			update();
		}
		private function onEditComplete(saveNewVal:Boolean):void
		{
			if (saveNewVal)
			{
				tf.text = tfInput.text;
			}
			removeByTag('cancel');
			removeByTag('ok');
			removeByTag('input');
			
			tf.visible = true;
			/*if (editable)
			{
				addItem(editBtn,'edit');
			}*/
			tfInput.removeEventListener(Event.CHANGE, tfInput_change);
			update();
		}
		
		/* INTERFACE view.elements.profilePageModules.interfaces.IprofilePageModule */
		
		
		public function show():void 
		{
			clear();
			tf.text = vm.getValue();
			tf.addEventListener(Event.CHANGE, tf_change);
		}
		override public function clear():void
		{
			tf.text = '';
			update();
			tf.removeEventListener(Event.CHANGE, tf_change);
			
		}
		private function tf_change(e:Event):void 
		{
		}
		
		public function save():void 
		{
			vm.setValue(tf.text);
		}
		
	}

}