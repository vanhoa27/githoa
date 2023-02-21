#include <stdio.h>
#include <stdlib.h>

void add2 (int* s, int a, int b)
{
    *s = a + b;
}

int main()
{
    int x = 5, y = 3, sum = 0;
    add2(&sum, x, y);
    printf("The value of sum is %d\n", sum);
}
