package com.rtvello 
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author zero, stichoza, chita
	 */
	public class Basket extends MovieClip
	{
		[Embed(source="../../../res/img/basket.png")]
		private var imgBasket:Class;
		
		public function Basket() 
		{
			var img:Bitmap = new imgBasket();
			addChild(img);
		}
		
	}

}