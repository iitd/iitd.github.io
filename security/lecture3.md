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

## Counterexample-driven
