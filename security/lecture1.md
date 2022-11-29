# Privilege Escalation

An OS typically supports multiple users.  Each user has certain access
privileges, e.g., user X may access file F in read-only mode, etc.
All processes run by user X are run with the privileges given to X; if any
process run by user X tries to overstep the granted privileges, that process
can be terminated.

Yet, some programs that user X may need to execute, require more privileges
than those that were granted to user X.
For example, on Linux,
X can use the `passwd` program can change his/her password: this program
eventually writes to the read/write-protected password file `/etc/passwd`
(which is only readable/writeable by the _root_ user).

1. How is the `passwd` program able to change the write to `/etc/passwd`, when it is executed by X?

2. Why can't user X cannot change other user passwords?

3. What happens if the `passwd` program had a software defect?

4. Can you generalize these observations to the SSHD programs?

# Software Defect 1 : Buffer Overflow

Consider the following C program in the file `passwd.c`
```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char** argv)
{
  char password[100];
  if (argc < 2) {
    printf("Filename not provided, exiting\n");
    exit(1);
  }
  strcpy(password, argv[1]);
  FILE *fp = fopen("/etc/passwd", "r+");
  if (!fp) {
    printf("Could not open the password file, exiting.\n");
    exit(1);
  }
  //...write the contents of password string to fp at the desired offset
  fclose(fp);
  printf("Password successfully changed to '%s'\n", password);
  return 0;
}
```
This program `passwd.c` is compiled to produce the `passwd` executable as
follows:
```
$ gcc -O3 -fno-stack-protector -z execstack passwd.c -o passwd
```
Further, this program is owned by the _root_ user and its setuid bit
is set using the following command:
```
$ whoami
root
$ setuid 4555 passwd
```
This program can now be used by the user to change his/her password:
```
$ whoami
userX
$ passwd secret
Password successfully changed to 'secret'
```

5. Does this `passwd` program have a software defect that can allow _userX_
   to obtain super-user (root) privileges?

6. How can _userX_ invoke the `passwd` program to (unintendedly) run arbitrary commands with super-user privileges?

7. What if the OS implements "Data Execution Protection"? i.e., the executable code is in a separate region from the data/stack. i.e., the bytes in the stack cannot be executed.
```
$ gcc -O3 -fno-stack-protector passwd.c -o passwd
```
Let's look at the assembly code produced in `passwd`
```
$ objdump -d passwd
```
Can we still mount an attack?

8. What if we enable stack-protection by the compiler?
```
$ gcc -O3 passwd.c -o passwd
```
What is the tradeoff here?

9. What about overflow of heap or global variables?

# Software Defect 2 : Buffer Overflow
