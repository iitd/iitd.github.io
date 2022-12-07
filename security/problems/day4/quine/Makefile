check:: quine.c
	/usr/bin/gcc -O3 -g -std=c99 -Wall -Wextra -Wmissing-prototypes -Wstrict-prototypes -Wold-style-definition quine.c -o quine
	./quine > quine.out
	./check-quine.sh quine.c quine.out

clean::
	rm -f quine quine.out
