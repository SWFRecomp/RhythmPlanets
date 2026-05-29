class Main
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