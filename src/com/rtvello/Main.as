package com.rtvello
{
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.StageOrientation;
	import flash.events.Event;
	import flash.events.TouchEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author zero, stichoza, chita
	 */
	public class Main extends Sprite 
	{
		[Embed(source="../../../res/img/vazi.jpg")]
		private var imgVazi:Class;
		[Embed(source="../../../res/img/vazi_flip.jpg")]
		private var imgVaziFlipped:Class;
			
		public function Main():void 
		 {
			
			//exit application if minimized
			NativeApplication.nativeApplication.autoExit = true;
						
			//zero: forgive me for the unstructured code that just works
			stage.setOrientation(StageOrientation.DEFAULT);
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			var _game:MovieClip = new MovieClip();
			//_game.width = stage.width;
			//_game.height = stage.height;
			_game.x = -500;
			_game.y = 0;
			addChild(_game);
			//_game.width = 800;
			//_game.height = 800;
			var SCENE_WIDTH:int = 1300;
			var SCENE_HEIGHT:int = 800;
			var SLIDE_RATE:int = 3;
			
			var rectangle:Shape = new Shape; // initializing the variable named rectangle
rectangle.graphics.beginFill(0xFF0000); // choosing the colour for the fill, here it is red
//rectangle.graphics.drawRect(0, 0, 900,400); // (x spacing, y spacing, width, height)
rectangle.graphics.endFill(); // not always needed but I like to put it in to end the fill
addChild(rectangle); // adds the rectangle to the stage


			
			var Vazi1:Bitmap = new imgVazi();
			var vazi1ratio:Number = Vazi1.width / Vazi1.height;
			Vazi1.height = SCENE_HEIGHT;
			Vazi1.width = Vazi1.height * vazi1ratio;
			var Vazi2:Bitmap = new imgVaziFlipped();
			var vazi2ratio:Number = Vazi2.width / Vazi2.height;
			Vazi2.height = SCENE_HEIGHT;
			Vazi2.width = Vazi2.height * vazi2ratio;
			Vazi2.x = Vazi1.x + Vazi1.width;
			/*var Vazi3:Bitmap = new imgVazi();
			var vazi3ratio:Number = Vazi3.width / Vazi3.height;
			Vazi3.height = SCENE_HEIGHT;
			Vazi3.width = Vazi3.height * vazi3ratio;
			Vazi3.x = Vazi2.x + Vazi2.width;*/
			_game.addChild(Vazi1);
			_game.addChild(Vazi2);
			//_game.addChild(Vazi3);
			
			var lastGrapeAddTime:Number = 0;
			
			/*Vazi1.*/addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				//move vineyard backgrounds
				Vazi1.x -= SLIDE_RATE;
				Vazi2.x -= SLIDE_RATE;
				//Vazi3.x -= SLIDE_RATE;
				//if the vineyard on the left goes out of screen, move it to the right
				/*if (Vazi1.x < Vazi2.x && Vazi1.x < Vazi3.x 
					&& Vazi1.x <= (-20 - Vazi1.width)) { Vazi1.x = Math.max(Vazi2.x, Vazi3.x) + Vazi1.width; }
				if (Vazi2.x < Vazi1.x && Vazi2.x < Vazi3.x 
					&& Vazi2.x <= (-20 - Vazi2.width)) { Vazi2.x = Math.max(Vazi1.x, Vazi3.x) + Vazi2.width; }
				if (Vazi3.x < Vazi1.x && Vazi3.x < Vazi2.x 
					&& Vazi3.x <= ( -20 - Vazi3.width)) { Vazi3.x = Math.max(Vazi1.x, Vazi2.x) + Vazi3.width; }*/
				if (Vazi1.x < Vazi2.x && Vazi1.x <= (-20 - Vazi1.width)) { Vazi1.x = Vazi2.x + Vazi1.width; }
				if (Vazi2.x < Vazi1.x && Vazi2.x <= (-20 - Vazi2.width)) { Vazi2.x = Vazi1.x + Vazi2.width; }
				
				//add grapes in 3-sec intervals
				if(lastGrapeAddTime/1000 < ((new Date()).time/1000 - 2)){
					var nextGrape:Fruit = new Fruit(Math.random() > 0.25);
					nextGrape.x = SCENE_WIDTH - 100;
					//the vitis(vazi) part takes roughly 1/3 v space so place grapes there
					nextGrape.y = SCENE_HEIGHT / 3 + Math.random() * SCENE_HEIGHT / 4;
					_game.addChild(nextGrape);
					nextGrape.addEventListener(Event.ENTER_FRAME, function(e:Event):void { e.currentTarget.x -= SLIDE_RATE; } );
					nextGrape.addEventListener(TouchEvent.TOUCH_BEGIN, function(e:TouchEvent):void {
						e.target.startTouchDrag(e.touchPointID);
					});
					nextGrape.addEventListener(TouchEvent.TOUCH_END, function(e:TouchEvent):void {
						e.target.stopTouchDrag(e.touchPointID);
					});
					lastGrapeAddTime = (new Date()).time;
				}
			});
			
			var harvest:Basket = new Basket(Basket.BASKET_TYPE_HARVEST);
			harvest.x = 20;
			harvest.y = SCENE_HEIGHT - 155;
			_game.addChild(harvest);
			harvest.addEventListener(BasketUpdatedEvent, function(e:BasketUpdatedEvent):void {
				harvest.visible = false;
			});
			
			var garbage:Basket = new Basket(Basket.BASKET_TYPE_GARBAGE);
			garbage.x = SCENE_WIDTH / 2;
			garbage.y = SCENE_HEIGHT - 155;
			_game.addChild(garbage);
		}
		
	}
	
}