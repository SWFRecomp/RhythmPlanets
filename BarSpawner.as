class BarSpawner
{
	var nextDepth: Number;
	var x: Number;
	var y: Number;
	
	function BarSpawner(root: MovieClip)
	{
		nextDepth = 1;
		x = 256/2;
		y = 192/2;
		
		var cl: ConductorListener = new ConductorListener();
		
		cl.onBeat = function(deltaTime: Number, target: Object)
		{
			var bar: Bar = new Bar(_root, target.nextDepth);
			target.nextDepth += 1;
			
			if (target.nextDepth == 10)
			{
				target.nextDepth = 1;
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