#include <stdio.h>
#include <stdlib.h>
#include "input2.h"

int main() 
{
    int n = lese_int();
    int laenge = n-1;
    int *array = malloc(sizeof(int)*laenge);

    // Array initialized with 1s
    for(int i = 0; i < laenge; i++)
    {
        array[i] = 1;
    }

    // Sieves out every multiples of a number
    for(int v = 2; v <= n; v++)
    {
        if(array[v-2] == 1)
        {
            for(int j = 2*v; j <= n; j = j+v)
            {
                array[j-2] = 0;
            }
        }
    }

    print_prim(array, laenge);
    free(array);

    return 0;
}

