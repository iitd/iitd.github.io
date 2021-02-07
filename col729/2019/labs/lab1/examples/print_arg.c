#include <stdio.h>

int print_arg(int argc, char * argv[]) {
    if (argc != 2) {
        return -1;
    }
    printf("%s", argv[1]);
    return 0;
}
