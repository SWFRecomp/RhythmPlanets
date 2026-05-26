class Main
{
	static var app: Game;
	
	static function main(root: MovieClip)
	{
		app = new Game(root);
		
		root.onEnterFrame = function()
		{
			Main.app.update(this);
		};
	}
}