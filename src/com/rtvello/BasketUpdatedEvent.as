package com.rtvello 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author zero, stichoza, chita
	 */
	
	/// @eventType	com.rtvello.BasketUpdatedEvent.BASKET_UPDATED
	//[Event(name = "basketUpdatedEvent", type = "BasketUpdatedEvent")]
	
	public class BasketUpdatedEvent extends Event 
	{
	
		public static const BASKET_UPDATED:String = "basketUpdatedEvent";
	
		public var fCorrectAnswer:Boolean = false;
		
		public function BasketUpdatedEvent(type:String = BASKET_UPDATED, bubbles:Boolean = false, cancelable:Boolean = false)
		{
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event {
			// Return a new instance of this event with the same parameters.
			return new BasketUpdatedEvent(type, bubbles, cancelable);
		}
	}

}