class Conductor
{
	var bpm: BPM;
	var lastBeatMS: Number;
	
	private var _listeners: List;
	
	function Conductor(newBPM: Number)
	{
		bpm = new BPM(newBPM);
		
		var spb: Number = bpm.secondsPerBeat;
		lastBeatMS = Game.currentScene.musicStartedMS - bpm.secondsPerBeat*1000;
		
		_listeners = new List();
	}
	
	function update(deltaTime: Number): Void
	{
		var now: Number = getTimer();
		var diff: Number = (now - lastBeatMS)/1000;
		
		if (diff >= bpm.secondsPerBeat)
		{
			var n: ListNode = _listeners.head;
			
			while (n != null)
			{
				var l: ConductorListener = ConductorListener(n.value);
				l.onBeat(l.target);
				
				n = n.next;
			}
			
			lastBeatMS += bpm.secondsPerBeat*1000;
		}
	}
	
	function addListener(l: ConductorListener): Void
	{
		_listeners.append(l);
	}
	
	function removeListener(l: ConductorListener): Void
	{
		_listeners.remove(l);
	}
}