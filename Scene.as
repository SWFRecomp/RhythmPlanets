class Scene
{
	var root: MovieClip;
	
	var conductor: Conductor;
	
	var objects: List;
	
	function Scene(root: MovieClip)
	{
		this.root = root;
		
		conductor = new Conductor(134);
		
		objects = new List();
	}
	
	function load(): Void
	{
		var n: BarSpawner = new BarSpawner(root);
		addObject(n);
		
		var names: Array = new Array();
		
		for (var i = 0; i < 4; ++i)
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