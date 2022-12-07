# Install Virtualbox
```
sudo apt install virtualbox
```

# Download and untar the VM image
```
$ wget [http://vayu.cse.iitd.ac.in/ubuntu20.tar](http://vayu.cse.iitd.ac.in/ubuntu20.tar)
$ tar xf ubuntu20.tbz2
```

# Register the VM
```
$ VBoxManage registervm ubuntu20/ubuntu20.vbox
```

# See the VM in the list of registered VMs
```
$ VBoxManage list vms
```

# Start the VM
You could use the GUI by typing
```
$ virtualbox
```
Or you could start the VM using the command-line as follows
```
$ VBoxManage startvm "ubuntu20"
```
If you want to start the VM in headless mode:
```
$ VBoxManage startvm "ubuntu20" --type headless
```

# Other useful commands
Pause the VM:
```
VBoxManage controlvm "ubuntu20" pause --type headless
```
Restart the paused VM:
```
VBoxManage controlvm "ubuntu20" resume --type headless
```
Power-off the VM:
```
VBoxManage controlvm "ubuntu20" poweroff --type headless
```
# Disabling ASLR (Address Space Layout Randomization) inside the VM
```
$ echo 0 | sudo tee /proc/sys/kernel/randomize_va_space
```
To permanently disable ASLR, edit `/etc/sysctl.d/01-disable-aslr.conf` to add `kernel.randomize_va_space = 0`.

# Equivalence Checking Example: Source-to-Source

Consider the following simple implementation of the `strlen` function:
```
#include <stddef.h>

size_t strlen(char *s)
{
  char *p ;
  for (p = s; *p; ++p);
  return p-s ;
}
```

Now, consider the following optimized implementation of `strlen` (taken from glibc):
```
#include <stddef.h>
#include <limits.h>

size_t strlen(char * str)
{
  char *ptr ;
  unsigned long *longword_ptr;
  unsigned long longword, himagic, lomagic;
  for (ptr = str; ((unsigned long)ptr & sizeof(unsigned long)) != 0; ++ptr)
    if (*ptr == '\0')
      return ptr-str ;
  longword_ptr = (unsigned long*)ptr ;
#if ULONG_MAX == 0xFFFFFFFFFFFFFFFF
  himagic = 0x8080808080808080L;
  lomagic = 0x0101010101010101L;
#else
  himagic = 0x80808080L;
  lomagic = 0x01010101L;
#endif
  for (;;)
  {
    longword = *longword_ptr++;
    if ((longword - lomagic) & ~longword & himagic) {
      char *cp = (char *)(longword_ptr - 1);
      if (cp[0] == 0) return cp - str ;
      if (cp[1] == 0) return cp - str + 1;
      if (cp[2] == 0) return cp - str + 2;
      if (cp[3] == 0) return cp - str + 3;
      if (cp[4] == 0) return cp - str + 4;
      if (cp[5] == 0) return cp - str + 5;
      if (cp[6] == 0) return cp - str + 6;
      if (cp[7] == 0) return cp - str + 7;
    }
  }
}
```

Copy these two `strlen` programs (simple and optimized) into separate files, say `strlen_unopt.c` and `strlen_opt.c`, and check them for equivalence using the following command:
```
eq32 --unroll-factor 8 strlen_unopt.c strlen_opt.c
```
The equivalence check should succeed.  Now trying modifying the optimized program in various ways, and see if the equivalence check still succeeds.

Fun fact: these two implementations are only equivalent if the page-size of the underlying machine architecture is a multiple of eight --- on the x86 architecture, the page size is 4096 (which is a multiple of eight).  What can go wrong if the page size was not a multiple of eight, i.e., what is an input for which the two programs would have different behaviour if the page size was not a multiple of eight?

# Equivalence Checking Example: Source-to-Assembly

Now run the equivalence checks with `unroll-factor=16` for the following pairs of C and assembly programs:

1. [s443.c](s443.c) vs. [s443.gcc.O3.i386.s](s443.gcc.eqchecker.O3.i386.s)

2. [s441.c](s441.c) vs. [s441.gcc.O3.i386.s](s441.gcc.eqchecker.O3.i386.s)

