#include <stdio.h>
#include <stdlib.h>


int main()
{
    int number;
    int i;

    printf("Gebe eine Zahl an! ");
    scanf("%d", &number);

    for(i = 2; i < number; i++)
    {
        if(number%i == 0)
        {
            printf("Die Zahl is keine Primzahl\n");
            return 0;
        }
    }

    if(number < 2){
        printf("Die Zahl ist keine Primzahl\n");
        return 0;
    }

    printf("Die Zahl ist eine Primzahl\n");
    return 0;
}