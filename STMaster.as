class STMaster
{
	var sts: Array;
	
	var shapeState: Boolean;
	
	var lastRotation: Number;
	var currentRotation: Number;
	var targetRotation: Number;
	var lastRotateMS: Number;
	var lastBeatMS: Number;
	var r: Number;
	var x: Number;
	var y: Number;
	
	function STMaster(root: MovieClip, r: Number, x: Number, y: Number)
	{
		sts = new Array();
		
		shapeState = true;
		
		currentRotation = 0;
		targetRotation = 0;
		
		this.r = r;
		this.x = x;
		this.y = y;
		
		var stCount: Number = 9;
		var arc: Number = 2*Math.PI/stCount;
		
		for (var i: Number = 0; i < stCount; ++i)
		{
			var st: ST = new ST(root, i + 20);
			st.parent = this;
			st.go.animationFPS = 30;
			
			var th: Number = arc*i - Math.PI/2;
			
			st.go.mc._x = x + r*Math.cos(th);
			st.go.mc._y = y + r*Math.sin(th);
			
			sts.push(st);
			Game.currentScene.addObject(st);
		}
		
		var cl: ConductorListener = new ConductorListener();
		
		cl.onQuarterBeat = function(obj: STMaster)
		{
			
		};
		
		cl.onBeat = function(obj: STMaster)
		{
			
		};
		
		cl.target = this;
		
		Game.currentScene.conductor.addListener(cl);
	}
	
	function update(deltaTime: Number): Void
	{
		if (currentRotation != targetRotation)
		{
			var duration: Number = 0.075;
			
			var diff: Number = (Game.now - lastRotateMS)/1000;
			currentRotation = Tweener.lerp(lastRotation, targetRotation, diff/duration);
			
			if (diff >= duration)
			{
				currentRotation = 0;
				targetRotation = 0;
			}
		}
		
		var arc: Number = 2*Math.PI/sts.length;
		
		for (var i: Number = 0; i < sts.length; ++i)
		{
			var th: Number = arc*i - Math.PI/2 + currentRotation;
			
			sts[i].go.mc._x = x + r*Math.cos(th);
			sts[i].go.mc._y = y + r*Math.sin(th);
		}
	}
	
	function right(): Void
	{
		if (currentRotation != targetRotation)
		{
			return;
		}
		
		lastRotation = currentRotation;
		targetRotation = currentRotation + 2*Math.PI/sts.length;
		lastRotateMS = Game.now;
	}
	
	function left(): Void
	{
		if (currentRotation != targetRotation)
		{
			return;
		}
		
		lastRotation = currentRotation;
		targetRotation = currentRotation - 2*Math.PI/sts.length;
		lastRotateMS = Game.now;
	}
}