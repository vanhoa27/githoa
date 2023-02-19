#include <stdio.h>

int fak(int n){
    if (n<=1) return 1;
    return n * fak(n-1);
}
