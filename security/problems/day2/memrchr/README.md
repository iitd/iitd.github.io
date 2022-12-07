1. Build the benchmarks
2. Three (real) different implementations of the memrchr() function are available in dietlibc.c, openbsd.c, and glibc.c
   - The openbsd.c implementation is the correct implementation
   - The dietlibc.c and glibc.c implementations are incorrect
   - Spend 10-15 minutes trying to identify the bugs in dietlibc.c
3. We have written three fuzz harnesses
   - fuzz\_dietlibc\_glibc.c (that tries to identify an input that shows the difference between dietlibc and glibc)
   - fuzz\_openbsd\_glibc.c (that tries to identify an input that shows the difference between openbsd and glibc)
   - fuzz\_dietlibc\_openbsd.c (that tries to identify an input that shows the difference between dietlibc and openbsd)
4. Try fuzzing these fuzz harnesses using `make fuzz`.  Tabulate the results.  Which implementations can the fuzzer distinguish and which ones it cannot distinguish?
5. Now run an equivalence checker using two different commands:
   - make test1
   - make test2
   Tabulate your results.
6. Why does fuzzing fail in some cases, while a symbolic-analysis based equivalence checker succeed?
