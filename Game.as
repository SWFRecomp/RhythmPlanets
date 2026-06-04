class Game
{
	static var currentScene: Scene;
	
	static var lastMS: Number;
	
	static function init(root: MovieClip): Void
	{
		recompSetDisplayScale(4);
		
		Input.init();
		
		lastMS = getTimer();
		
		currentScene = new Scene(root);
		currentScene.load();
	}
	
	static function update(root: MovieClip): Void
	{
		var now: Number = getTimer();
		var diffSeconds: Number = (now - lastMS)/1000;
		
		if (currentScene != undefined)
		{
			currentScene.update(diffSeconds);
		}
		
		lastMS = now;
	}
}