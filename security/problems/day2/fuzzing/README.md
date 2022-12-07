# Program Testing / Fuzzing / Analysis

## Build American Fuzzy Lop
```
$ cd /home/userx/day2/afl-2.52b
$ make
$ sudo make install
```

## Build fuzzgoat
```
$ cd /home/userx/day2/fuzzgoat
$ make
```

## Configure the core-pattern and cpu-frequency governor
```
$ echo core | sudo tee /proc/sys/kernel/core_pattern
$ cd /sys/devices/system/cpu
$ echo performance | sudo tee cpu*/cpufreq/scaling_governor
```

## Run the fuzzer
```
afl-fuzz -i in -o out ./fuzzgoat @@
```
Make a report on five distinct bugs identified in out/crashes
