////////////////////////////////////////////////////////////////////////////////
//
//  © 2013 snut.ru
//
////////////////////////////////////////////////////////////////////////////////

package ru.snut.core.data {
	import flash.events.EventDispatcher;
	
	/**
	 * @author					snut
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @date					Jul 28, 2013
	 */
	public class Data extends EventDispatcher {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function Data() {
			super();
		}
		
		/**
		 * @private
		 */
		private var _name:String;
		
		public function get name():String {
			return this._name;
		}
		
		public function set name(value:String):void {
			if (this._name == value) return;
			this._name = value;
		}
		
		public function readExternal(input:Object):void {
			this.deserialize(input);
		}
		
		//--------------------------------------------------------------------------
		//
		//  Protected methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * @private
		 */
		protected function deserialize(input:Object):void {
			
		}
	}
}