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
			_game.y = 0;
			addChild(_game);
			//_game.width = 800;
			//_game.height = 800;
			var SCENE_WIDTH:int = 800;
			var SCENE_HEIGHT:int = 800;
			
			var rectangle:Shape = new Shape; // initializing the variable named rectangle
rectangle.graphics.beginFill(0xFF0000); // choosing the colour for the fill, here it is red
//rectangle.graphics.drawRect(0, 0, 900,400); // (x spacing, y spacing, width, height)
rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill
addChild(rectangle); // adds the rectangle to the stage


			
			var Vazi1:Bitmap = new imgVazi();
			var vazi1ratio:int = Vazi1.width / Vazi1.height;
			Vazi1.height = SCENE_HEIGHT;
			Vazi1.width = SCENE_HEIGHT / vazi1ratio;
			var Vazi2:Bitmap = new imgVazi();
			var vazi2ratio:int = Vazi2.width / Vazi2.height;
			Vazi2.height = SCENE_HEIGHT;
			Vazi2.width = SCENE_HEIGHT / vazi2ratio;
			Vazi2.x = Vazi1.x + Vazi1.width;
			var Vazi3:Bitmap = new imgVazi();
			var vazi3ratio:int = Vazi3.width / Vazi3.height;
			Vazi3.height = SCENE_HEIGHT;
			Vazi3.width = SCENE_HEIGHT / vazi3ratio;
			Vazi3.x = Vazi2.x + Vazi2.width;
			_game.addChild(Vazi1);
			_game.addChild(Vazi2);
			_game.addChild(Vazi3);
			/*Vazi1.*/addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				Vazi1.x -= 10;
				Vazi2.x -= 10;
				Vazi3.x -= 10;
				//if the vineyard on the left goes out of screen, move it to the right
				if (Vazi1.x < Vazi2.x && Vazi1.x < Vazi3.x 
					&& Vazi1.x <= (-20 - Vazi1.width)) { Vazi1.x = Math.max(Vazi2.x, Vazi3.x) + Vazi1.width; }
				if (Vazi2.x < Vazi1.x && Vazi2.x < Vazi3.x 
					&& Vazi2.x <= (-20 - Vazi2.width)) { Vazi2.x = Math.max(Vazi1.x, Vazi3.x) + Vazi2.width; }
				if (Vazi3.x < Vazi1.x && Vazi3.x < Vazi2.x 
					&& Vazi3.x <= (-20 - Vazi3.width)) { Vazi3.x = Math.max(Vazi1.x, Vazi2.x) + Vazi3.width; }
			});
			
		}
		
	}
	
}