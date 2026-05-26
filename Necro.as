import flash.display.BitmapData;

class Necro
{
	var go: GameObject;
	
	function Necro(root: MovieClip, bitmapName: String, name: String, depth: Number)
	{
		go = new GameObject(root, bitmapName, name, depth);
		
		go.mc._x = 256/2;
		go.mc._y = 192/2;
		
		go.mc._xscale = 1200;
		go.mc._yscale = 200;
	}
	
	function update(deltaTime: Number)
	{
		go.update(deltaTime);
	}
	
	function right()
	{
		go.mc._x += 2;
	}
	
	function left()
	{
		go.mc._x -= 2;
	}
}