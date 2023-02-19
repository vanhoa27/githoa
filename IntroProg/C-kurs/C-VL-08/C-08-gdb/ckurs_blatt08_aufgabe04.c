#include<stdio.h>

// Gibt die Zahl x^x für alle Zahlen zwischen 1 und n aus
//
// 1^1 = 1 = 1
// 2^2 = 2*2 = 4
// 3^3 = 3*3*3 = 27
// 4^4 = 4*4*4*4 = 256
// ...
// n^n

int main()
{
    int n = 5;

    for(int x = 1; x <= n; x++)
    {
        int f_x = x;
        int benoetigte_multiplikationen = x;

        for(int j = 1; j < benoetigte_multiplikationen; j++)
        {
            f_x *= x;
        }

        printf("%d^%d = %d\n", x, x, f_x);
    }

}

