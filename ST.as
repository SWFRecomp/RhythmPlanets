import flash.geom.ColorTransform;

class ST
{
	var parent: STMaster;
	
	var go: GameObject;
	
	var shapeState: Boolean;
	
	var swinging: Number;
	var lastPointMS: Number;
	
	function ST(root: MovieClip, depth: Number)
	{
		var names: Array = new Array();
		
		for (var i: Number = 0; i < 8; ++i)
		{
			names.push("st" + i);
		}
		
		for (var i: Number = 0; i < 8; ++i)
		{
			names.push("ts" + i);
		}
		
		go = new GameObject(root, names, "bar" + depth, depth);
		go.playAnimation = true;
		
		shapeState = true;
		
		var ct: ColorTransform = new ColorTransform(1, 0, 0, 1, 0, 0, 0, 0);
		
		swinging = 0;
	}
	
	function update(deltaTime: Number): Void
	{
		go.update(deltaTime);
		
		if (go.nextSprite == 8)
		{
			go.playAnimation = shapeState;
		}
		
		else if (go.nextSprite == 0)
		{
			go.playAnimation = !shapeState;
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
		//~ if (swinging != 0)
		//~ {
			//~ return;
		//~ }
		
		//~ swinging = 1;
		//~ lastPointMS = getTimer();
	}
	
	function left(): Void
	{
		
	}
}