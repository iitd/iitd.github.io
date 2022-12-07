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

# Quine

# Reflections on Trusting Trust
