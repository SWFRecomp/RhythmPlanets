class Necro
{
	var go: GameObject;
	
	function Necro(root: MovieClip, bitmapName: String, name: String, depth: Number)
	{
		var names: Array = new Array();
		names.push(bitmapName);
		
		go = new GameObject(root, names, name, depth);
		
		go.mc._x = 256/2;
		go.mc._y = 192/2;
		
		go.mc._xscale = 1200;
		go.mc._yscale = 200;
	}
	
	function update(deltaTime: Number): Void
	{
		go.update(deltaTime);
		
		go.mc._rotation += 10*deltaTime*6;
		go.mc._rotation %= 360;
	}
	
	function right(): Void
	{
		go.mc._x += 10;
	}
	
	function left(): Void
	{
		go.mc._x -= 10;
	}
}