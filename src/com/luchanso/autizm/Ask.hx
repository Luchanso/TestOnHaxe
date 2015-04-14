package com.luchanso.autizm;

import motion.Actuate;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */
class Ask extends Sprite
{	
	var label:TextField;

	public function new(ask:String, yesEvent:Dynamic, noEvent:Dynamic) 
	{
		super();
		
		this.alpha = 0;
		this.visible = false;
		
		label = new TextField();
		label.defaultTextFormat = new TextFormat("Arial", 21, 0x333333);
		label.text = ask;
		label.autoSize = TextFieldAutoSize.LEFT;
		label.x = Settings.WIDTH / 2 - label.width / 2;
		label.y = Settings.HEIGHT / 2 - label.height / 2;
		label.selectable = false;
		
		addChild(label);
		
		var yes = new Button(true, yesEvent);
		var no = new Button(false, noEvent);
		
		yes.x = Settings.WIDTH / 2 + Settings.BUTTON_SIZE_YES;
		yes.y = Settings.HEIGHT / 2 + label.height - 5;		
		
		no.x = Settings.WIDTH / 2 - Settings.BUTTON_SIZE_NO * 2 - 5;
		no.y = Settings.HEIGHT / 2 + label.height;
		
		addChild(yes);
		addChild(no);
	}
	
	public function hide(callbackFinish:Dynamic = null)
	{		
		var o = Actuate.tween(this, Settings.ANIMATION_TIME, { alpha: 0 } ).onComplete(function ()
		{
			this.visible = false;
		});
		
		if (callbackFinish != null)
			o.onComplete(callbackFinish);
	}
	
	public function show(callbackFinish:Dynamic = null)
	{
		var o = Actuate.tween(this, Settings.ANIMATION_TIME, { alpha: 1 } ).autoVisible(true);
		
		if (callbackFinish != null)
			o.onComplete(callbackFinish);
	}
}