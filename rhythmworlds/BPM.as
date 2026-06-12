class rhythmworlds.BPM
{
	var bpm: Number;
	
	var secondsPerBeat: Number;
	
	function BPM(bpm: Number)
	{
		setBPM(bpm);
	}
	
	function setBPM(bpm: Number): Void
	{
		this.bpm = bpm;
		
		var mpb: Number = 1/bpm;
		secondsPerBeat = 60*mpb;
	}
}