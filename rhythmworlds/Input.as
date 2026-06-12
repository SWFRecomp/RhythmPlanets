import rhythmworlds.*;

class rhythmworlds.Input
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
			var n: ListNode = Game.currentScene.objects.head;
			
			while (n != null)
			{
				var o: Object = n.value;
				o.right();
				
				n = n.next;
			}
		}
	}
	
	static function onRightReleased()
	{
		
	}
	
	static function onLeftPressed()
	{
		if (Game.currentScene != undefined)
		{
			var n: ListNode = Game.currentScene.objects.head;
			
			while (n != null)
			{
				var o: Object = n.value;
				o.left();
				
				n = n.next;
			}
		}
	}
	
	static function onLeftReleased()
	{
		
	}
}