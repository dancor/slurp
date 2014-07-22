run: hs c
	@echo
	@echo "C Run:"
	/usr/bin/time ./c
	@echo
	@echo "HS Run:"
	/usr/bin/time ./slurp

hs: slurp.hs FluidR3_GM.sf2
	ghc -O3 --make slurp.hs

c: slurp.c FluidR3_GM.sf2
	gcc -o c slurp.c

FluidR3_GM.sf2: fake-data
	./fake-data

fake-data: fake-data.hs
	ghc -O3 --make fake-data.hs

clean:
	rm -f slurp.o slurp.hi slurp c fake-data.o fake-data.hi fake-data
	rm -f FluidR3_GM.sf2
