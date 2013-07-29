////////////////////////////////////////////////////////////////////////////////
//
//  © 2013 snut.ru
//
////////////////////////////////////////////////////////////////////////////////

package ru.snut.core.data.graphics {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import ru.snut.core.data.DataContainer;
	
	/**
	 * @author					snut
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @date					Jul 28, 2013
	 */
	public class AtlasItemDataCollection extends DataContainer {
		
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private static const _mock:Object = {
			"frames": [
				{
					"filename": "button_up_0_0",
					"frame": {"x":0,"y":26,"w":15,"h":26},
					"rotated": false,
					"trimmed": false,
					"spriteSourceSize": {"x":0,"y":0,"w":15,"h":26},
					"sourceSize": {"w":15,"h":26}
				}
				,{
					"filename": "button_up_1_0",
					"frame": {"x":15,"y":26,"w":1,"h":26},
					"rotated": false,
					"trimmed": false,
					"spriteSourceSize": {"x":0,"y":0,"w":1,"h":26},
					"sourceSize": {"w":1,"h":26}
				}
				,{
					"filename": "button_up_2_0",
					"frame": {"x":16,"y":26,"w":15,"h":26},
					"rotated": false,
					"trimmed": false,
					"spriteSourceSize": {"x":0,"y":0,"w":15,"h":26},
					"sourceSize": {"w":15,"h":26}
				}],
			"meta": {
				"app": "Adobe Flash Professional",
				"version": "13.0.0.759",
				"image": "assets.png",
				"format": "RGBA8888",
				"size": {"w":64,"h":64},
				"scale": "1"
			}
		}
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function AtlasItemDataCollection() {
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
		private var _bitmap:BitmapData;
		
		public function get bitmap():BitmapData {
			return this._bitmap;
		}
		
		public function set bitmap(value:BitmapData):void {
			if (this._bitmap == value) return;
			this._bitmap = value;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		public function getBitmap(name:String):Bitmap {
			var result:Bitmap = new Bitmap();
			
			var itemData:AtlasItemData = super.getChildByName(name) as AtlasItemData;
			var rect:Rectangle = itemData.rect;
			var bmp:BitmapData = new BitmapData(rect.width, rect.height);
			var m:Matrix = new Matrix();
			m.translate(-rect.x, -rect.y);
			bmp.draw(this._bitmap, m);
			result.bitmapData = bmp;
			return result;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected override function deserialize(input:Object):void {
			if ('frames' in input && input.frames is Array) {
				var rawframes:Array  = input.frames as Array;
				var i:uint, length:uint = rawframes.length;
				var item:AtlasItemData;
				for (i = 0; i < length; i++) {
					item = new AtlasItemData();
					item.readExternal(rawframes[i]);
					super.addChild(item);
				}
			}
		}
	}
}