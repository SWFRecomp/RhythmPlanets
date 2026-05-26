class Game
{
	static var n: Necro;
	
	var lastMS: Number;
	
	function Game(root: MovieClip)
	{
		recompSetDisplayScale(4);
		
		n = new Necro(root, "guy", "necro", 1);
		
		var s: Sound = new Sound();
		
		var l: Object = new Object();
		
		l.onKeyDown = function()
		{
			if (Key.getCode() == Key.RIGHT)
			{
				Game.n.right();
			}
		};
		
		l.onKeyUp = function()
		{
			if (Key.getCode() == Key.RIGHT)
			{
				Game.n.left();
			}
		};
		
		Key.addListener(l);
		
		s.onLoad = function(success: Boolean)
		{
			if (success)
			{
				s.start(0, 2);
			}
		};
		
		s.loadSound("sorc.mp3", false);
		
		lastMS = getTimer();
	}
	
	function update(root: MovieClip)
	{
		var now: Number = getTimer();
		var diffSeconds: Number = (now - lastMS)/1000;
		
		n.update(diffSeconds);
		
		lastMS = now;
	}
}