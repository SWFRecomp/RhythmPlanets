.PHONY: all clean

game.swf: in.swf *.as
	./bin/mtasc -version 8 -cp ../AS2Runtime/std -cp ../AS2Runtime/std8 -swf in.swf -main Main.as $(wildcard *.as) -out $@

clean:
	rm game.swf