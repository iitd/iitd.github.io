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
   - Learn about the `setuid` bit that allows the executable to be executed with the privileges of the owner of the executable file.

2. Why can't user X change other user passwords?
   - Because the executable carefully checks what the user is trying to do, against the user privileges.

3. What happens if the `passwd` program had a software defect?
   - It may become possible to bypass the privilege checks.

# Software Defect 1 : Buffer Overflow Bugs

Consider the following C program in the file `passwd.c`.

```c
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

4. How can `userX` invoke the `passwd` program to make it crash?
   - By passing a command-line argument (_password_) string which is longer than 99 characters.

5. How can `userX` invoke the `passwd` program to run arbitrary commands with super-user (root) privileges?
   - By carefully crafting the command-line argument (_password_) to that it contains the code that needs to be executed _and_ it overwrites the return address so it jumps to the code (within the _password_ string).

# Software Defect 2 : Integer Overflow Bugs

The software developer decides to check the length of the command-line argument as follows:
```
  ...
  char password[100];
  size_t len = strlen(argv[1]);
  if ((char*)password + len + 1 >= (char*)password + 100) {
    printf("Supplied password too long. Exiting without changing the password.\n");
    exit(1);
  }
  strcpy(password, argv[1]);
  ...
```
6. Does this check prevent the attack?
   - No, because `password + len + 1` could overflow.
   - A similar sequence of integer overflow and buffer overflow form the basis of the famous _Heartbleed_ vulnerability (as seen in the lab assignment).

# Software Defect 3 : Time-of-Check-To-Time-Of-Use (TOCTTOU) Bugs

Consider the following code:
```
  get_from_user(filename);
  if (!access(filename, R_OK) != 0) {
    printf("The file cannot be accessed by the user");
    exit(1);
  }
  //for executables with setuid bit set, the following
  //system call succeeds if the file is accessible by
  //either the user or the owner of the executable file.
  fd = open(filename, O_RDONLY);
  read(fd, ...); //user can read the contents of the file
```
Assume that the owner of the executable file is the super-user (root).

6. What happens if the attacker ensures that when the `access(..)` check
   is executed, the `filename` is readable by the user, but by the time
   the `open(..)` call is executed, the filename is replaced to point to
   a file that is readable only by the super-user?
   - This time gap between the _time-of-check_ (call to `access`) and the
     _time-of-use_ (call to `open`) can be exploited by the attacker to
     change the filesystem state in the middle of the two calls.

# References

1. [Aleph One - Smashing the Stack for Fun](http://www.phrack.com/issues.html?issue=49&id=14#article)

2. [blexim - Basic Integer Overflows](http://phrack.org/issues/60/10.html)

3. [scut/team teso - Exploiting Format String Vulnerabilities](https://cs155.stanford.edu/papers/formatstring-1.2.pdf)

4. [anonymous - Once upon a free()](http://www.phrack.com/issues.html?issue=57&id=9#article)

5. [c0ntex - How to hijack the Global Offset Table with pointers for root shellsa](http://dl.packetstormsecurity.net/papers/bypass/GOT_Hijack.txt)

6. [Intel - Intel Architecture Guide for Software Developers , Ch. 3 and 6.](https://www.intel.com/content/www/us/en/architecture-and-technology/64-ia-32-architectures-software-developer-vol-1-manual.html)

<!--
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
-->
