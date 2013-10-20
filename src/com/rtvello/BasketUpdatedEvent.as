package com.rtvello 
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author zero, stichoza, chita
	 */
	public class BasketUpdatedEvent extends Event 
	{
		public var fCorrectAnswer:Boolean = false;
		
		public function BasketUpdatedEvent(argCorrectAnswer:Boolean) 
		{
			super(this.type);
			this.fCorrectAnswer = argCorrectAnswer;
		}
		
	}

}