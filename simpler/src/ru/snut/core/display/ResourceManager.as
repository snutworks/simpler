////////////////////////////////////////////////////////////////////////////////
//
//  © 2013 snut.ru
//
////////////////////////////////////////////////////////////////////////////////

package ru.snut.core.display {
	import flash.events.EventDispatcher;
	
	/**
	 * @author					snut
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @date					Jul 28, 2013
	 */
	public class ResourceManager extends EventDispatcher {
		
		//--------------------------------------------------------------------------
		//
		//  Class constants
		//
		//--------------------------------------------------------------------------
		
		public static var _instance:ResourceManager;
		
		//--------------------------------------------------------------------------
		//
		//  Class methods
		//
		//--------------------------------------------------------------------------
		
		public static function getInstance():ResourceManager {
			if (!_instance) {
				_instance = new ResourceManager();
			} else {
				throw new Error('ResourceManager already has instance');
			}
			
			return _instance;
		}
		
		public static function addSpriteSheet(spriteURL:String, atlasURL:String, id:String=''):void {
			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function ResourceManager() {
			throw new Error('use getInstance()');
		}
	}
}