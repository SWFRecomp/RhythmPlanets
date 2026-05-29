class Tweener
{
	private function Tweener()
	{
		
	}
	
	function lerp(a: Number, b: Number, t: Number): Number
	{
		var diff: Number = b - a;
		return a + t*diff;
	}
}