#include <stdio.h>

int main() 
{
    int m = 0;
    int p = 1;
    int n = 10; // nur als Beispiel
    
    while (p < n) 
    {
        printf("2^%d ist %d\n", m, p);
        m = m + 1;
        p = p * 2;
    }
}

