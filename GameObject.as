import flash.display.BitmapData;

class GameObject
{
	var mc: MovieClip;
	
	function GameObject(root: MovieClip, bitmapName: String, name: String, depth: Number)
	{
		mc = root.createEmptyMovieClip(name, depth);
		
		var bm: BitmapData = BitmapData.loadBitmap(bitmapName);
		
		mc.createEmptyMovieClip("inner", 1);
		
		mc.inner.attachBitmap(bm, 1);
		
		mc.inner._x = -bm.width/2;
		mc.inner._y = -bm.height/2;
	}
	
	function update(deltaTime: Number)
	{
		this.mc._rotation += 10*deltaTime*6;
		mc._rotation %= 360;
	}
}