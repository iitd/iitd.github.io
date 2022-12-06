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

For simplicity, here we will only consider heap, stack, and global variables.  Tackling local variables is slightly tricker because they can be dynamically allocated, and their static identification often requires reasoning about non-contiguous regions of memory.  That said, our equivalence checker efficiently models dynamically-allocated local variables while supporting discontiguity, etc.

Each global variable can be identified by a start address and a size.  Similarly, the stack can be identified by a start address and a (maximum) size.  All other memory belongs to the heap.  These constraints can be encoded by encoding the facts that the intervals defined by these `(start,size)` pairs do not intersect, while submitting them to the SAT/SMT solver.  Further, we can encode aliasing constraints (e.g., `x` can only point within the heap) using similar logical conditions.  When we get back the counter-example, it will respect the constraints we encoded using logical formulae.

# Side-Channel Attacks

Examples of side-channels: time, power, radio-frequency, heat, cache misses, network messages, ...

## Timing side-channel
