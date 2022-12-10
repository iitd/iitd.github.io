# Miscellaneous Topics in Security

## Data lifetime
- Device buffers
- Application buffers and swap space
- Compiler removing dead code

[Reference : Understanding Data Lifetime via Whole System Simulation](https://www.usenix.org/conference/13th-usenix-security-symposium/understanding-data-lifetime-whole-system-simulation)

## Architectural Extensions for Security (e.g., Intel SGX)
[Reference : Intel SGX Explained](https://eprint.iacr.org/2016/086.pdf)

## Capabilities and ACLs
- capabilities
  - file descriptors, secret keys/passwords, document URL, fingerprints
    - easy to share
    - opaque
    - hard to review and revoke
- access-control lists
  - user-group-other r/w/x for files/devices, admission/membership list, friend list on social media, etc.
  - easier to review and revoke

[Reference : OS Lecture 36 : Protection and Security](https://youtu.be/-vkEEQxp8NY)

## Failure Atomicity and Data-leak Bugs
[Reference : OS Lecture 34 : Crash Recovery and Logging](https://youtu.be/YdxtClOpQ-4)

## Equivalence Checking and Superoptimization

References:

1. [Translation Validator Demo](https://youtu.be/n9AYWm8sxKI)

2. [Research Talk](https://youtu.be/og_0Zsxt4y8)

3. [Research paper](https://sorav.compiler.ai/pubs/counter.pdf)
