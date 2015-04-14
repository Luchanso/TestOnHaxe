package com.luchanso.autizm;

import motion.Actuate;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFormat;

/**
 * ...
 * @author Loutchansky Oleg
 */

class Main extends Sprite 
{
	var prelog	:TextField;
	var console	:Console;
	
	var asks	:Array<Ask>;
	var nowAsk	:Int = 0;
	var result	:TextField;
	var autizmStady = 0;

	public function new()
	{
		super();
		
		asks = new Array<Ask>();		
		asks.push(new Ask("Вы играете в Dota 2?", d2Yes, nextAsk));
		asks.push(new TriangleAsk("Вы видете на экране звёздочки?", triangleYes, triangleNo));
		asks.push(new Ask("Вы пьёте Ягуар?", nextAsk, yaga));
		asks.push(new Ask("Вы любите Maincraft?", mc, nextAsk));
		asks.push(new Ask("Какого цвета небо?", lol, lol));
		asks.push(new Ask("Я значит такой пишу девушке:\n-Ты в бога веришь?\nА она отвечает - нет, я Аутист\r\nxDD", jokeYes, jokeNo));
		asks.push(new Ask("Это приложение без рекламы, я надеюсь оно Вам нравится?", voteYes, voteNo));
		asks.push(new Ask("Интересно, ты уже догодался, что в итоге ты всё ровно будешь аутистом?", oracleYes, oracleNo));
		asks.push(new Ask("Ты любишь фрукты?", nextAsk, nextAsk));
		asks.push(new Ask("На самом деле предыдущий вопрос ни на что не повлиял", nextAsk, nextAsk));
		asks.push(new Ask("Окей, окей, нажми на галочку, чтобы узнать результат", nextAsk, nextAsk));
		
		for (ask in asks)
		{
			addChild(ask);
		}
		
		prelog = new TextField();
		prelog.defaultTextFormat = new TextFormat("Arial", 21, 0x333333);
		prelog.text = "Приложение носит шуточный характер";
		prelog.autoSize = TextFieldAutoSize.CENTER;
		prelog.x = Settings.WIDTH / 2 - prelog.width / 2;
		prelog.y = Settings.HEIGHT / 2 - prelog.height / 2;
		prelog.autoSize = TextFieldAutoSize.LEFT;
		prelog.selectable = false;
		prelog.alpha = 0;
		
		addChild(prelog);
		
		Actuate.tween(prelog, Settings.ANIMATION_TIME, { alpha: 1 } ).delay(0.5).onComplete(finishAnimationPrelog);
		
		console = new Console();
		
		addChild(console);
	}
	
	function finishAnimationPrelog()
	{
		Actuate.tween(prelog, Settings.ANIMATION_TIME, { alpha : 0 } ).delay(2.2).onComplete(startGame);
	}
	
	function startGame()
	{
		asks[nowAsk].show();
	}
	
	function nextAsk()
	{
		if (nowAsk < asks.length - 1)
		{
			asks[nowAsk].hide(showNext);
		}
		else
		{
			asks[nowAsk].hide();
			finish();
		}
		nowAsk++;
	}
	
	function showNext()
	{
		asks[nowAsk].show();
	}
	
	function finish()
	{
		Actuate.tween(console, 100, { alpha:0 } ).delay(5);
		
		for (i in 1...4)
		{
			var t = new Bitmap(Assets.getBitmapData('img/print ($i).png'));
			t.x = Math.random() * (Settings.WIDTH / 4 - t.width);
			t.x = Math.random() * (Settings.HEIGHT / 4 - t.height);
			
			addChildAt(t, 0);
		}
		
		var doc = new Bitmap(Assets.getBitmapData("img/doc.png"));
		doc.x = 0;
		doc.y = 0;
		doc.width = Settings.WIDTH / 4;
		doc.height = Settings.HEIGHT / 4;
		
		addChildAt(doc, 0);		
		
		var resultText = "У Вас " + autizmStady + " cтадия Аутизма";
		
		result = new TextField();
		result.defaultTextFormat = new TextFormat("Arial", 26, 0x333333);
		result.text = resultText;
		result.autoSize = TextFieldAutoSize.LEFT;
		result.x = Settings.WIDTH / 2 - result.width / 2;
		result.y = Settings.HEIGHT / 2 - result.height / 2;
		result.alpha = 0;
		result.selectable = false;
		
		Actuate.tween(result, 5, { alpha:1 } );
		
		addChild(result);
		
	}
	
	// Ask functions
	
	function d2Yes()
	{		
		autizmStady++;
		console.WriteText("Обнаружена " + autizmStady + " стадия Аутизма - не страшно");		
		nextAsk();
	}
	
	function yaga()
	{
		autizmStady++;
		console.WriteText("Найдена " + autizmStady + " стадия Аутизма - обратитесь к врачу");
		nextAsk();
	}
	
	function mc()
	{
		autizmStady++;
		console.WriteText("Найдены дополнительные психологические растройства");
		nextAsk();
	}
	
	function triangleYes()
	{
		autizmStady++;
		console.WriteText("Выявлено черезмерное употребление наркотиков");
		console.WriteText("Звёздочек не было");
		nextAsk();
	}
	
	function triangleNo()
	{
		autizmStady++;
		console.WriteText("Выявлено черезмерное употребление наркотиков");
		console.WriteText("Звёздочки были");
		nextAsk();
	}
	
	function lol()
	{
		autizmStady++;
		console.WriteText("Аутизм уже на " + autizmStady + " стадии");
		nextAsk();
	}
	
	function jokeYes()
	{
		autizmStady++;
		console.WriteText("Эта шутка для Аутистов...");
		nextAsk();
	}
	
	function jokeNo()
	{
		autizmStady++;
		console.WriteText("Только Аутисты не понимают эту шутку");
		nextAsk();
	}
	
	function voteYes()
	{
		autizmStady++;
		console.WriteText("^____^");
		nextAsk();
	}
	
	function voteNo()
	{
		autizmStady+=2;
		console.WriteText("Аутист");
		nextAsk();
	}
	
	function oracleYes()
	{
		autizmStady+=2;
		console.WriteText("Вот и славненько");
		console.WriteText("Кстати, у тебя уже " + autizmStady + " стадия");
		nextAsk();
	}
	
	function oracleNo()
	{
		autizmStady+=2;
		console.WriteText("Ну теперь хотябы в курсе");
		console.WriteText("Кстати, у тебя уже " + autizmStady + " стадия");
		nextAsk();
	}
}
