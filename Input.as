class Input
{
	static var leftDown: Boolean;
	static var rightDown: Boolean;
	
	static function init(): Void
	{
		leftDown = false;
		rightDown = false;
		
		var l: Object = new Object();
		
		l.onKeyDown = function()
		{
			if (Key.getCode() == Key.RIGHT)
			{
				if (!Input.rightDown)
				{
					Input.onRightPressed();
				}
				
				Input.rightDown = true;
			}
			
			else if (Key.getCode() == Key.LEFT)
			{
				if (!Input.leftDown)
				{
					Input.onLeftPressed();
				}
				
				Input.leftDown = true;
			}
		};
		
		l.onKeyUp = function()
		{
			if (Key.getCode() == Key.RIGHT)
			{
				if (Input.rightDown)
				{
					Input.onRightReleased();
				}
				
				Input.rightDown = false;
			}
			
			else if (Key.getCode() == Key.LEFT)
			{
				if (Input.leftDown)
				{
					Input.onLeftReleased();
				}
				
				Input.leftDown = false;
			}
		};
		
		Key.addListener(l);
	}
	
	static function onRightPressed()
	{
		if (Game.currentScene != undefined)
		{
			
		}
	}
	
	static function onRightReleased()
	{
		if (Game.currentScene != undefined)
		{
			
		}
	}
	
	static function onLeftPressed()
	{
		trace("down");
	}
	
	static function onLeftReleased()
	{
		trace("up");
	}
}