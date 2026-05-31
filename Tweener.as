class Tweener
{
	private function Tweener()
	{
		
	}
	
	static function lerp(a: Number, b: Number, t: Number): Number
	{
		if (t < 0)
		{
			return a;
		}
		
		if (t > 1)
		{
			return b;
		}
		
		var diff: Number = b - a;
		return a + t*diff;
	}
}