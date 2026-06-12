.PHONY: all clean

game.swf: in.swf rhythmworlds/*.as
	./bin/mtasc -strict -version 8 -cp ../AS2Runtime/std -cp ../AS2Runtime/std8 -swf in.swf -main rhythmworlds/Main.as $(wildcard rhythmworlds/*.as) -out $@

clean:
	rm game.swf