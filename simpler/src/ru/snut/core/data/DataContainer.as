////////////////////////////////////////////////////////////////////////////////
//
//  © 2013 snut.ru
//
////////////////////////////////////////////////////////////////////////////////

package ru.snut.core.data {
	/**
	 * @author					snut
	 * @version					1.0
	 * @playerversion			Flash 10
	 * @langversion				3.0
	 * @date					Jul 28, 2013
	 */
	public class DataContainer extends Data {
		
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		
		public function DataContainer() {
			super();
		}
		
		/**
		 * @private
		 */
		private var _list:Vector.<Data> = new Vector.<Data>();
		
		/**
		 * @private
		 */
		private var _names:Object = new Object();
		
		//--------------------------------------------------------------------------
		//
		//  Public methods
		//
		//--------------------------------------------------------------------------
		
		public function addChild(child:Data):Data {
			this._list.push(child);
			this._names[child.name] = child;
			return child;
		}
		
		public function getChildAt(index:uint):Data {
			return this._list[index];
		}
		
		public function getChildByName(name:String):Data {
			return this._names[name];
		}
	}
}