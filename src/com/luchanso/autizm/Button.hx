package com.luchanso.autizm;

import format.SVG;
import openfl.Assets;
import openfl.display.Sprite;
import openfl.events.MouseEvent;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Button extends Sprite
{
	var callback:Dynamic;
	
	public function new(isYes:Bool, callback:Dynamic) 
	{
		super();
		
		this.callback = callback;
		
		this.mouseEnabled = true;
		this.useHandCursor = true;
		this.buttonMode = true;
		
		if (isYes)
		{
			var yes = new SVG(Assets.getText("vector/yes.svg"));			
			yes.render(this.graphics, 0, 0, Settings.BUTTON_SIZE_YES, Settings.BUTTON_SIZE_YES);
		}
		else
		{
			var no = new SVG(Assets.getText("vector/no.svg"));			
			no.render(this.graphics, 0, 0, Settings.BUTTON_SIZE_NO, Settings.BUTTON_SIZE_NO);
		}
		
		addEventListener(MouseEvent.CLICK, click);
	}
	
	private function click(e:MouseEvent):Void 
	{
		callback();
	}
	
}