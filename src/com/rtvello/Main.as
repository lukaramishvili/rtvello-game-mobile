package com.rtvello
{
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageOrientation;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author zero, stichoza, chita
	 */
	public class Main extends Sprite 
	{
		[Embed(source="../../../res/img/vazi.jpg")]
		private var imgVazi:Class;
			
		public function Main():void 
		 {
			
			//exit application if minimized
			NativeApplication.nativeApplication.autoExit = true;
						
			//zero: forgive me for the unstructured code that just works
			stage.setOrientation(StageOrientation.DEFAULT);
			
			var _game:MovieClip = new MovieClip();
			//_game.width = stage.width;
			//_game.height = stage.height;
			_game.x = -500;
			_game.y = 5;
			addChild(_game);
			
			var rectangle:Shape = new Shape; // initializing the variable named rectangle
rectangle.graphics.beginFill(0xFF0000); // choosing the colour for the fill, here it is red
//rectangle.graphics.drawRect(0, 0, 900,400); // (x spacing, y spacing, width, height)
rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill
addChild(rectangle); // adds the rectangle to the stage


			
			var Vazi1:Bitmap = new imgVazi();
			var Vazi2:Bitmap = new imgVazi();
			Vazi2.x = Vazi1.width;
			_game.addChild(Vazi1);
			_game.addChild(Vazi2);
			/*Vazi1.*/addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				Vazi1.x -= 1;
				Vazi2.x -= 1;
				//if the vineyard on the left goes out of screen, move it to the right
				if (Vazi1.x < Vazi2.x && Vazi1.x <= -Vazi1.width) { Vazi1.x = Vazi2.x + Vazi2.width; }
				if (Vazi2.x < Vazi1.x && Vazi2.x <= -Vazi2.width) { Vazi2.x = Vazi1.x + Vazi1.width; }
			});
			
		}
		
	}
	
}