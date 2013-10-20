package com.rtvello 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author zero, stichoza, chita
	 */
	public class Fruit extends Sprite
	{
		
		[Embed(source="../../../res/img/grape.png")]
		private var imgGoodGrape:Class;
		[Embed(source="../../../res/img/grape_bad.png")]
		private var imgBadGrape:Class;
		
		public var fGoodQuality:Boolean;
		
		/**
		 * Create a new fruit.
		 * @param	q	Quality - true = good, false = bad.
		 */
		public function Fruit(q:Boolean) 
		{
			this.fGoodQuality = q;
			
			var img:Bitmap = q? new imgGoodGrape() : new imgBadGrape();
			addChild(img);
		}
		
	}

}