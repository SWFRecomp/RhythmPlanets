class Game
{
	static var currentScene: Scene;
	static var music: Sound;
	static var musicStartedMS: Number;
	
	static var lastMS: Number;
	
	static function init(root: MovieClip): Void
	{
		recompSetDisplayScale(4);
		
		Input.init();
		
		music = new Sound();
		
		music.onLoad = function(success: Boolean)
		{
			if (success)
			{
				Game.music.start();
				Game.musicStartedMS = getTimer();
			}
		};
		
		music.loadSound("timing.mp3", false);
		
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