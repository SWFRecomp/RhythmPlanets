class Game
{
	static var currentScene: Scene;
	
	static var now: Number;
	static var lastMS: Number;
	
	static function init(root: MovieClip): Void
	{
		recompSetDisplayScale(4);
		
		Input.init();
		
		lastMS = getTimer();
		now = lastMS;
		
		currentScene = new Scene(root);
		currentScene.load();
	}
	
	static function update(root: MovieClip): Void
	{
		now = getTimer();
		var diffSeconds: Number = (now - lastMS)/1000;
		
		if (currentScene != undefined)
		{
			currentScene.update(diffSeconds);
		}
		
		lastMS = now;
	}
}