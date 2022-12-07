1. Build the benchmarks
2. Three (real) different implementations of the memrchr() function are available in dietlibc.c, openbsd.c, and glibc.c
   - The openbsd.c implementation is the correct implementation
   - The dietlibc.c and glibc.c implementations are incorrect
   - Spend 10-15 minutes trying to identify the bugs in dietlibc.c
3. We have written three fuzz harnesses
   - fuzz_dietlibc_glibc.c (that tries to identify an input that shows the difference between dietlibc and glibc)
   - fuzz_openbsd_glibc.c (that tries to identify an input that shows the difference between openbsd and glibc)
   - fuzz_dietlibc_openbsd.c (that tries to identify an input that shows the difference between dietlibc and openbsd)
4. Run `make` to build all these programs
5. Try fuzzing these fuzz harnesses using `make run_fuzz_dietlibc_glibc`, `make run_fuzz_openbsd_glibc`, and `make run_fuzz_dietlibc_openbsd`.  Tabulate the results.  Which implementations can the fuzzer distinguish and which ones it cannot distinguish?
6. Now run an equivalence checker using two different commands:
   - make test1
   - make test2
   Tabulate your results.
7. Why does fuzzing fail in some cases, while a symbolic-analysis based equivalence checker succeed?
