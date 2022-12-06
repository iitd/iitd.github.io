# Symbolic Analysis : Invariant Inference

## Guess-and-Check
1. In the code below, what are some affine-equality invariants at the loop head and the loop tail that may relate the different variables `i`, `sum1`, and `sum2`?
```
int foo(int n)
{
  int sum1 = 0, sum2 = 0;
  for (int i = 0; i < n; i++) {
    sum1 += i;
    sum2 = i*(i + 1);
  }
  assert(sum1 >= n + 5);
  return sum1 + sum2;
}
```

2. Hoare triple:  {Precondition} Program {Postcondition}

Some examples
```
{x > 0} y := x + 1 { x > 0 and y > 1 }
{x > 0 and y-->heap and *g1=0} *y := x { x > 0 and y-->heap and *g1=0 and *y > 0 }
{x > 0 and y-->heap/g1 and *g1=0} *y := x { x > 0 and y-->heap/g1 and *g1>=0 and *y > 0 }
```

3. How do you identify if this is indeed a valid loop invariant?
```
{Precondition}
while (condition) {
   //Candidate Loop Invariant
   LoopBody
}
{Postcondition}
```

For a candidate loop invariant, check the following Hoare triples:
```
{ Precondition } condition is true { Candidate Loop Invariant }
{ Candidate Loop Invariant } LoopBody ; condition is true { Candidate Loop Invariant}
{ Candidate Loop Invariant } condition is false { Postcondition }
```

4. How should you set the precondition/postcondition? Depends on the application you are targetting.

If you are interested in identifying the properties that would hold after the loop (e.g., for optimization or verification purposes), then you would set the precondition to whatever is known beginning from the start of the program.

If you are interested in identifying the precondition of a given assertion-failure, then you would set the postcondition to the assert-fail condition.

For the following example:
```
int foo(int v, int w)
{
  x = v;
  a = w;
  while (c()) {
    //candidate
    x := x + 1;
    a := a - 1;
  }
  assert(x + a != 12);
}
```
The required hoare triples are
```
{Candidate} x:=x+1; a:=a-1; c() is true {Candidate}
{Candidate} x:=x+1; a:=a-1; c() is false {x + a == 12}
```

Does the candidate "x+a == v + w" work?

What about "x+a == 12"?

The final precondition is: "v+w == 12".

## Data-driven

A very relevant example relates to affine invariants:

1. The grammar of affine invariants is `c0+c1*x1+c2*x2+...+cn*xn = 0`

2. Instrument the program to collect the concrete values of variables and the corresponding behaviour, e.g., does this set of values eventually led to an assertion failure.  Each set of values can be called a _point_.

3. Identify the _smallest affine space_ that contains these points, and use that as a candidate.

4. If the candidate does not satisfy all the Hoare triples, then try the _bigger affine spaces_.  But, the number of bigger affine spaces can be too large to enumerate exhaustively.  For example, a large number of distinct planes can pass through a line.

## Counterexample-guided

Again, we will use the example of affine invariants:

1. Start with the empty space

2. Check each hoare-triple.  If all hoare triples are satisfied, we are done.

3. If some hoare triple is not satisfied, we get a counter-example

4. Use the counter-example to _enlarge the affine space_ and goto step 2.

Proof: For integer arithmetic, this process converges within N iterations where N is the number of variables (which are being attempted to be related through an affine invariant).


# Symbolic Analysis : Modeling Memory

Memory is represented as an _array_.  An array is a function that maps addresses to data, e.g., 32-bit address to 8-bit data.  It additionally supports the _select_ and _store_ operations.

```
select(store(A, a, d), a) == d
```

However, this representation is usually not sufficient to model the state of a high-level program, e.g., a C program.  In the abstract machine of a C program, the array is segmented into heap, stack, global variables, and local variables.

## Segmenting Memory

For simplicity, we will first consider only the heap, stack, and global variables.  Tackling local variables is slightly tricker because they can be dynamically allocated, and their static identification often requires reasoning about non-contiguous regions of memory.  That said, our equivalence checker efficiently models dynamically-allocated local variables while supporting discontiguity, etc.

Each global variable can be identified by a start address and a size.  Similarly, the stack can be identified by a start address and a (maximum) size.  All other memory belongs to the heap.  These constraints can be encoded by encoding the facts that the intervals defined by these `(start,size)` pairs do not intersect, while submitting them to the SAT/SMT solver.  Further, we can encode aliasing constraints (e.g., `x` can only point within the heap) using similar logical conditions.  When we get back the counter-example, it will respect the constraints we encoded using logical formulae.

Example:
```
int g[100];
int f(int* p, int k, int m, int n, int o)
{
  int l[20];
  int* h = malloc(10);
  l[m] = p[n] + h[(m+n)/2] + 2;
  p[m] = 2*p[o];
  g[m-o] = 20;
  h[k] = 10;
}
```

# Side-Channel Attacks

Examples of side-channels: time, power, radio-frequency, heat, cache misses, network messages, ...

## Timing side-channel

The time taken by a proram may leak some information about some secret that is used by the program for some processing.  A timing-difference of say 1-2 microseconds is often enough for the attacker to obtain a reliable signal to be able to deconstruct (a part of) the secret bit-by-bit.

Simple example (also a part of your lab):
```
int check_password(char const* input_password, char const* expected_password)
{
  char const* p = input_password;
  char const* q = expected_password;
  while (*p == *q) {
    //some computation that may take 1-2us
    if (*p == '\0') {
      return 1; //paswwords match
    }
    p++;
    q++;
  }
  return 0; //passwords mismatch
}
```
Invoke this function with different strings for `input_password` and time the program.

Researchers have shown that timing-based attacks can be remotely mounted over the network on the RSA implementations to identify 200 bits of a private key in Apache2/SSL.

## Cache-based side-channel

If we can identify the accessed memory addresses as a function of a secret that is used for processing by a privileged proram, a concurrently running unprivileged program can profile the cache to identify the likely address that may have been accessed, and map it back to the possible bits of the secret key. e.g., content-based caching, memoization, etc.
```
char secret[100];

foo() {
  // read/write a[secret[i]]
}
```

If the attacker is able to co-locate on the same physical machine as the target, then the attacker can do one of the following two things:

### First idea
1. It can warm up all the cache lines with its own data, e.g., by repeately accessing all the addresses until the cache is full.

2. Then invoke the target on a carefully crafted input

3. Then read its own data back and time these reads.  For reads that take longer than others, it is likely that those addresses have been accessed by the target too, which caused cache replacement of the attacker's data for those reads.

4. By carefully analyzing this cache-timing information, it can try and reconstruct the secret (on which the memory accesses may depend).

### Second idea

If the attacker and target can possibly share common pages, e.g., they are running in the same address space (e.g., sharing a common service), then:

1. Instead of warming the cache, first flush the cache

2. Get the target to run

3. Access all the memory regions that _may_ have been accessed by the target, and profile these accesses.  The data that was brought in the cache by the target will be accessed faster.

### Mitigation

Ensure in software that the accessed memory addresses and CPU usage are mostly independent of the secret key.

## Spectre V1

Let's say that that the memory of the target contains public data and secret data stored close to each other.  Also, let's say that the accessed memory addresses depend on some of the public data.
```
char public[10];
char secret[100];

foo() {
  // read/write a[public[i]] in a loop
}
```
But as a prefetching/speculative mechanism, the hardware processor may also read `a[secret[j]]` for small values of `j`.  This can allow the attacker to mount cache-line based side-channel attacks even though the software program was careful to not allow memory accesses to be a function of the secret.
