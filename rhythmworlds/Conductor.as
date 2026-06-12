import rhythmworlds.*;

class rhythmworlds.Conductor
{
	var bpm: BPM;
	
	var lastQuarterBeatMS: Number;
	var lastBeatMS: Number;
	
	private var _listeners: List;
	
	private var _beats: Number;
	private var _commands: Array;
	
	function Conductor(newBPM: Number)
	{
		bpm = new BPM(newBPM);
		
		var spb: Number = bpm.secondsPerBeat;
		lastQuarterBeatMS = Game.currentScene.musicStartedMS - bpm.secondsPerBeat*1000;
		lastBeatMS = lastQuarterBeatMS;
		
		_listeners = new List();
		
		_beats = 0;
		_commands = new Array();
		
		_commands.push(0);
		_commands.push(0);
		_commands.push(0);
		_commands.push(1);
		_commands.push(0);
		_commands.push(0);
		_commands.push(0);
		_commands.push(0);
	}
	
	function update(deltaTime: Number): Void
	{
		var diffQuarter: Number = (Game.now - lastQuarterBeatMS)/1000;
		var diff: Number = (Game.now - lastBeatMS)/1000;
		
		trace("dq: " + diffQuarter + ", bpm.spb/4: " + (bpm.secondsPerBeat/4));
		
		if (diffQuarter >= bpm.secondsPerBeat/4)
		{
			var n: ListNode = _listeners.head;
			
			while (n != null)
			{
				var l: ConductorListener = ConductorListener(n.value);
				
				if (l.onQuarterBeat)
				{
					l.onQuarterBeat(l.target, _beats, _commands[_beats % _commands.length]);
				}
				
				n = n.next;
			}
			
			lastQuarterBeatMS += bpm.secondsPerBeat*1000/4;
			_beats += 1;
		}
		
		if (diff >= bpm.secondsPerBeat)
		{
			var n: ListNode = _listeners.head;
			
			while (n != null)
			{
				var l: ConductorListener = ConductorListener(n.value);
				
				if (l.onBeat)
				{
					l.onBeat(l.target, _beats, _commands[_beats % _commands.length]);
				}
				
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