# Buffer Overflow Attacks

## Build and install the vulnerable targets
```
$ cd /home/userx/day1/targets
$ make
$ sudo make install
```
This creates executables `/tmp/target{1,2}` with the `setuid` bit set.

## Build the exploit code
```
$ cd /home/userx/day1/xploits
$ make
```

## Run the exploit code
```
$ cd /home/userx/day1/xploits
$ ./xploit1
$ ./xploit2
```

## Change the exploit code
Edit the xploit{1,2}.c files so that, when run again, they
a. first cause the target executable to crash, e.g., due to a segmentation fault
b. then cause the target executable to yield a root shell.
The "shellcode.h" file available in the `xploits/` directory contains the binary code that, when executed, executes the shell command.  You may want to use the contents of this code in the command-line arguments used while invoking the target executables.
