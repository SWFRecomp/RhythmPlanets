import flash.display.BitmapData;

class GameObject
{
	var mc: MovieClip;
	
	var xFrac: Number;
	var yFrac: Number;
	
	function GameObject(root: MovieClip, bitmapName: String, name: String, depth: Number)
	{
		mc = root.createEmptyMovieClip(name, depth);
		
		var bm: BitmapData = BitmapData.loadBitmap(bitmapName);
		
		mc.createEmptyMovieClip("inner", 1);
		
		mc.inner.attachBitmap(bm, 1);
		
		mc.inner._x = -bm.width/2;
		mc.inner._y = -bm.height/2;
		
		xFrac = 0;
		yFrac = 0;
	}
	
	function translate(x: Number, y: Number): Void
	{
		var xInt: Number = int(x);
		var yInt: Number = int(y);
		
		xFrac += x - xInt;
		yFrac += y - yInt;
		
		if (xFrac >= 1)
		{
			xInt += 1;
			xFrac -= 1;
		}
		
		if (yFrac >= 1)
		{
			yInt += 1;
			yFrac -= 1;
		}
		
		mc._x += xInt;
		mc._y += yInt;
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
	
	function destroy(o: Object): Void
	{
		Game.currentScene.objects.remove(o);
		mc.removeMovieClip();
	}
}