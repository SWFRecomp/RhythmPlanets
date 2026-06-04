class Scene
{
	var root: MovieClip;
	
	var music: Sound;
	var musicStartedMS: Number;
	var conductor: Conductor;
	
	var objects: List;
	
	function Scene(root: MovieClip)
	{
		this.root = root;
		
		music = new Sound();
		musicStartedMS = Infinity;
		
		objects = new List();
	}
	
	function load(): Void
	{
		music.onLoad = function(success: Boolean)
		{
			if (success)
			{
				Game.currentScene.music.start();
				Game.currentScene.musicStartedMS = getTimer();
			}
		};
		
		music.loadSound("antinomy.mp3", false);
		
		conductor = new Conductor(135);
		
		var stm: STMaster = new STMaster(root, 60, 256/2, 192/2);
		addObject(stm);
		
		var names: Array = new Array();
		
		for (var i: Number = 0; i < 4; ++i)
		{
			names.push("sb" + i);
		}
		
		var bg: GameObject = new GameObject(root, names, "bgMC", 1);
		addObject(bg);
		bg.playAnimation = true;
		
		bg.translate(256/2, 192/2);
	}
	
	function update(deltaTime: Number)
	{
		conductor.update(deltaTime);
		
		var o: ListNode = objects.head;
		
		while (o != null)
		{
			o.value.update(deltaTime);
			o = o.next;
		}
	}
	
	function addObject(o: Object): Void
	{
		objects.append(o);
	}
	
	function clearObjects(): Void
	{
		objects.clear();
	}
}