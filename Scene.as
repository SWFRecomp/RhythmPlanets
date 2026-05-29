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