import rhythmworlds.*;

class rhythmworlds.Main
{
	static function main(root: MovieClip): Void
	{
		Game.init(root);
		
		root.onEnterFrame = function()
		{
			Game.update(this);
		};
	}
}