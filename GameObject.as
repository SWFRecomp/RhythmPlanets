import flash.display.BitmapData;

class GameObject
{
	var mc: MovieClip;
	
	var sprites: Array;
	var nextSprite: Number;
	var lastSpriteMS: Number;
	
	var playAnimation: Boolean;
	var animationFPS: Number;
	
	var xFrac: Number;
	var yFrac: Number;
	
	function GameObject(root: MovieClip, bitmapNames: Array, name: String, depth: Number)
	{
		mc = root.createEmptyMovieClip(name, depth);
		
		sprites = new Array();
		
		for (var i: Number = 0; i < bitmapNames.length; ++i)
		{
			sprites.push(BitmapData.loadBitmap(bitmapNames[i]));
		}
		
		nextSprite = 0;
		var firstSprite: BitmapData = sprites[nextSprite];
		
		lastSpriteMS = Game.now;
		nextSprite += 1;
		
		playAnimation = false;
		animationFPS = 20;
		
		mc.createEmptyMovieClip("inner", 1);
		
		mc.inner.attachBitmap(firstSprite, 1);
		
		mc.inner._x = -firstSprite.width/2;
		mc.inner._y = -firstSprite.height/2;
		
		xFrac = 0;
		yFrac = 0;
	}
	
	function update(deltaTime: Number): Void
	{
		if (!playAnimation)
		{
			return;
		}
		
		if (Game.now - lastSpriteMS > 1000/animationFPS)
		{
			mc.inner.attachBitmap(sprites[nextSprite], 1);
			nextSprite += 1;
			nextSprite %= sprites.length;
			lastSpriteMS = Game.now;
		}
	}
	
	function rotation(): Number
	{
		return mc._rotation;
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
	
	function rotate(angle: Number): Void
	{
		mc._rotation += angle;
	}
	
	function setRotation(angle: Number): Void
	{
		mc._rotation = angle;
	}
	
	function scale(x: Number, y: Number): Void
	{
		mc._xscale *= x;
		mc._yscale *= y;
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