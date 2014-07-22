ghc -O3 --make fake-data.hs
[1 of 1] Compiling Main             ( fake-data.hs, fake-data.o )
Linking fake-data ...
./fake-data
ghc -O3 --make slurp.hs
[1 of 1] Compiling Main             ( slurp.hs, slurp.o )
Linking slurp ...
gcc -o c slurp.c

C Run:
/usr/bin/time ./c
Open.
74199153
513
-20305
0.00user 0.03system 0:00.03elapsed 97%CPU (0avgtext+0avgdata 145272maxresident)k
0inputs+0outputs (0major+637minor)pagefaults 0swaps

HS Run:
/usr/bin/time ./slurp
74199153
513
-20305
3.65user 0.07system 0:03.73elapsed 99%CPU (0avgtext+0avgdata 279860maxresident)k
0inputs+8outputs (0major+33773minor)pagefaults 0swaps
