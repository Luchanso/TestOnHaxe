package com.luchanso.autizm;
import openfl.Assets;
import openfl.display.Bitmap;

/**
 * ...
 * @author Loutchansky Oleg
 */
class TriangleAsk extends Ask
{

	public function new(ask:String, yesEvent:Dynamic, noEvent:Dynamic) 
	{
		super(ask, yesEvent, noEvent);
		
		for (i in 0...10)
		{
			var bmp = new Bitmap(Assets.getBitmapData("img/star.png"));
			bmp.alpha = Math.random() * 0.2;
			bmp.x = Math.random() * (Settings.WIDTH - bmp.width);
			bmp.y = Math.random() * (Settings.HEIGHT - bmp.height);
			
			addChild(bmp);
		}
	}
	
}