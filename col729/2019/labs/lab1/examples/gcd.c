#include <stdio.h>

int gcd1(int a, int b) {
    if (!b) {
        return a;
    }
    return gcd1(b, a % b);
}

int gcd2(int a, int b) {
    while (a != b) {
        if (a > b) {
            a -= b;
        }
        else {
            b -= a;
        }
    }
    return a;
}

int gcd3(int a, int b) {
    while (b) {
        int temp = b;
        b = a % b;
        a = temp;
    }
    return a;
}

