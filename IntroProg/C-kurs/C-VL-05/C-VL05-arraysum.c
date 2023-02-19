#include <stdio.h>

void sum(int a[], int n, int *s)
{
    *s = 0;
    for (int i = 0; i < n; i++) 
    {
        /* s is the pointer to the address where
           we store the sum of the array elements */
        *s += a[i]; // *s = *s + a[i] or *s += *(a+i);
    }
}

int main() 
{
    int s = 0, a[] = {2, 3, 5, 7, 11};
    sum(a, 5, &s);
    printf("Die Summe der Arrayalemente ist: %d", s);
}
