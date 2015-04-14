package com.luchanso.autizm;

import motion.Actuate;
import openfl.display.Sprite;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Console extends Sprite
{
	public function new() 
	{
		super();
		
		this.x = 600;
		this.y = 0;
	}
	
	public function WriteText(text:String)
	{
		var t = new TextField();
		t.defaultTextFormat = new TextFormat("Arial", 16, 0xFF0000);
		t.text = text;
		t.autoSize = TextFieldAutoSize.LEFT;
		
		t.x = 400 - t.width - 20;
		
		if (numChildren - 1 >= 0)
		{
			t.y = getChildAt(numChildren - 1).y + 25;
		}
		else
		{
			t.y = 25;
		}
		t.selectable = false;
		t.alpha = 0;
		
		Actuate.tween(t, 1.5, { alpha:0.7 } );
		
		addChild(t);
	}
	
}