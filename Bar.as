class Bar
{
	var parent: BarSpawner;
	
	var go: GameObject;
	
	var swinging: Number;
	var lastPointMS: Number;
	
	function Bar(root: MovieClip, depth: Number)
	{
		var names: Array = new Array();
		
		for (var i = 7; i >= 0; --i)
		{
			names.push("st" + i);
		}
		
		go = new GameObject(root, names, "bar" + depth, depth);
		go.playAnimation = true;
		
		swinging = 0;
	}
	
	function update(deltaTime: Number): Void
	{
		go.update(deltaTime);
		
		deltaTime = Math.min(0.015, deltaTime);
		
		if (go.nextSprite == 0)
		{
			go.playAnimation = false;
		}
		
		go.translate(100*deltaTime, 0);
		
		if (go.mc._x > 350)
		{
			go.destroy(this);
		}
		
		if (swinging == 1)
		{
			var now: Number = getTimer();
			var duration: Number = (now - lastPointMS)/1000;
			
			var rotation: Number = Tweener.lerp(0, 45, duration/0.035);
			
			go.setRotation(rotation);
			
			if (duration > 0.035)
			{
				swinging = 2;
				go.setRotation(45);
				lastPointMS = getTimer();
			}
		}
		
		if (swinging == 2)
		{
			var now: Number = getTimer();
			var duration: Number = (now - lastPointMS)/1000;
			
			var rotation: Number = Tweener.lerp(45, 0, duration/0.05);
			
			go.setRotation(rotation);
			
			if (duration > 0.05)
			{
				swinging = 0;
				go.setRotation(0);
			}
		}
	}
	
	function right(): Void
	{
		if (swinging != 0)
		{
			return;
		}
		
		swinging = 1;
		lastPointMS = getTimer();
	}
	
	function left(): Void
	{
		
	}
}