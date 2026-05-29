class Bar
{
	var go: GameObject;
	
	function Bar(root: MovieClip, depth: Number)
	{
		go = new GameObject(root, "guy", "bar" + depth, depth);
		go.mc._yscale = 600;
	}
	
	function update(deltaTime: Number): Void
	{
		go.translate(10*deltaTime*10, 0);
		
		if (go.mc._x > 350)
		{
			go.destroy(this);
		}
	}
	
	function right(): Void
	{
		
	}
	
	function left(): Void
	{
		
	}
}