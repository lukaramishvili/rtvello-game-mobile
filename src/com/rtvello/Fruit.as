package com.rtvello 
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author zero, stichoza, chita
	 */
	public class Fruit extends MovieClip
	{
		
		[Embed(source="../../../res/img/grape.png")]
		private var imgGrape:Class;
		
		public function Fruit() 
		{
			var img:Bitmap = new imgGrape();
			addChild(img);
		}
		
	}

}