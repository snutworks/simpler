////////////////////////////////////////////////////////////////////////////////
//
//  © 2013 snut.ru
//
////////////////////////////////////////////////////////////////////////////////

package {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import ru.snut.core.data.graphics.AtlasItemDataCollection;
	
	/**
	 * @author					snut
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @date					Jul 28, 2013
	 */
	public class Simpler extends Sprite {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function Simpler() {
			this.loadImage();
		}
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private var _imageURL:String = 'assets/assets.png';
		
		/**
		 * @private
		 */
		private var _atlasURL:String = 'assets/assets.json';
		
		/**
		 * @private
		 */
		private const _atlasItemCollection:AtlasItemDataCollection = new AtlasItemDataCollection();
		
		//--------------------------------------------------------------------------
		//
		//  Private methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private function loadImage():void {
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, handler_atlasBitmapComplete);
			loader.load(new URLRequest(this._imageURL));
		}
		
		/**
		 * @private
		 */
		private function loadAtlas():void {
			var loader:URLLoader = new URLLoader();
			loader.addEventListener(Event.COMPLETE, this.handler_atlasJSONComplete);
			loader.load(new URLRequest(this._atlasURL));
		}
		
		/**
		 * @private
		 */
		private function loadComplete():void {
			super.addChild(this._atlasItemCollection.getBitmap('button_up_0_0'));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		private function handler_atlasBitmapComplete(event:Event):void {
			var info:LoaderInfo = event.target as LoaderInfo;
			info.removeEventListener(Event.COMPLETE, this.handler_atlasBitmapComplete);
			this._atlasItemCollection.bitmap = (info.content as Bitmap).bitmapData;
			this.loadAtlas();
		}
		
		/**
		 * @private
		 */
		private function handler_atlasJSONComplete(event:Event):void {
			var loader:URLLoader = event.target as URLLoader;
			loader.removeEventListener(Event.COMPLETE, this.handler_atlasJSONComplete);
			var json:String = loader.data;
			var raw:Object = JSON.parse(json);
			this._atlasItemCollection.readExternal(raw);
			this.loadComplete();
		}
	}
}