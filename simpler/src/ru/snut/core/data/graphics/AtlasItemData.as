////////////////////////////////////////////////////////////////////////////////
//
//  © 2013 snut.ru
//
////////////////////////////////////////////////////////////////////////////////

package ru.snut.core.data.graphics {
	import flash.geom.Rectangle;
	
	import ru.snut.core.data.Data;
	
	/**
	 * @author					snut
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @date					Jul 28, 2013
	 */
	public class AtlasItemData extends Data {
		
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private static const _mock:Object = {
			"filename": "button_down_0_0",
			"frame": {"x":0,"y":0,"w":15,"h":26},
			"rotated": false,
			"trimmed": false,
			"spriteSourceSize": {"x":0,"y":0,"w":15,"h":26},
			"sourceSize": {"w":15,"h":26}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function AtlasItemData() {
			super();
		}

		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private var _name:String;
		
		public override function get name():String {
			return this._name;
		}
		
		public override function set name(value:String):void {
			if (this._name == value) return;
			this._name = value;
		}
		
		
		/**
		 * @private
		 */
		private var _rect:Rectangle;
		
		public function get rect():Rectangle {
			return this._rect;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected override function deserialize(input:Object):void {
			if (!input.hasOwnProperty('filename') || !input.hasOwnProperty('frame')) throw new Error('unknown raw data format');
			if ('filename' in input) {
				this._name = input.filename;
			}
			if ('frame' in input) {
				var rawframe:Object = input.frame;
				this._rect = new Rectangle(rawframe.x, rawframe.y, rawframe.w, rawframe.h);
			}
		}
	}
}