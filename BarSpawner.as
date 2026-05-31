class BarSpawner
{
	var nextDepth: Number;
	var x: Number;
	var y: Number;
	
	function BarSpawner(root: MovieClip)
	{
		nextDepth = 2;
		x = 256/2;
		y = 192/2;
		
		var cl: ConductorListener = new ConductorListener();
		
		cl.onBeat = function(target: BarSpawner)
		{
			var bar: Bar = new Bar(_root, target.nextDepth);
			bar.parent = target;
			target.nextDepth += 1;
			
			if (target.nextDepth == 11)
			{
				target.nextDepth = 2;
			}
			
			bar.go.mc._x = target.x;
			bar.go.mc._y = target.y;
			
			Game.currentScene.addObject(bar);
		};
		
		cl.target = this;
		
		Game.currentScene.conductor.addListener(cl);
	}
	
	function update(deltaTime: Number): Void
	{
		
	}
	
	function right(): Void
	{
		
	}
	
	function left(): Void
	{
		
	}
}