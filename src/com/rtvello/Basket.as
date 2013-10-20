package com.rtvello 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	/**
	 * ...
	 * @author zero, stichoza, chita
	 */
	
	public class Basket extends MovieClip
	{
		[Embed(source="../../../res/img/harvest_can.png")]
		private var imgHarvest:Class;
		[Embed(source="../../../res/img/garbage_can.png")]
		private var imgGarbage:Class;
		
		public var eBasketType:String;
		public static const BASKET_TYPE_HARVEST:String = "harvest";
		public static const BASKET_TYPE_GARBAGE:String = "garbage";
		
		private var _cCorrectFruits:int = 0;
		private var _cIncorrectFruits:int = 0;
		
		private var nPointPerFruit:int = 5;
		
		public function getScore():int {
			return (_cCorrectFruits - _cIncorrectFruits) * nPointPerFruit;
		}
		
		public function Basket(basketType:String) 
		{
			this.eBasketType = basketType;
			
			var img:Bitmap;
			switch(basketType) {
				case BASKET_TYPE_GARBAGE:
					img = new imgGarbage();
					break;
				case BASKET_TYPE_HARVEST:
				default:
					img = new imgHarvest();
					break;
			}
			addChild(img);
		}
		
		public function addFruit(f:Fruit):void {
			var fCorrectFruit:Boolean = false;
			switch (this.eBasketType) {
				case BASKET_TYPE_HARVEST:
					f.fGoodQuality ? _cCorrectFruits++ : _cIncorrectFruits++;
					fCorrectFruit = f.fGoodQuality;
					break;
				case BASKET_TYPE_GARBAGE:
					f.fGoodQuality ? _cIncorrectFruits++ : _cCorrectFruits++;
					fCorrectFruit = !f.fGoodQuality;
					break;
			}
			var updateEvent:BasketUpdatedEvent = new BasketUpdatedEvent(BasketUpdatedEvent.BASKET_UPDATED);
			updateEvent.fCorrectAnswer = fCorrectFruit;
			dispatchEvent(updateEvent);
		}
		
		
	}

}