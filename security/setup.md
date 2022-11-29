# Disable ASLR
```
$ echo 0 | sudo tee /proc/sys/kernel/randomize_va_space
```
To permanently disable, edit `/etc/sysctl.d/01-disable-aslr.conf` to add `kernel.randomize_va_space = 0`.
