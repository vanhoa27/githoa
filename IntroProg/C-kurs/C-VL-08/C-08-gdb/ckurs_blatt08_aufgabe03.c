#include<stdio.h>
#include<stdlib.h>

int main()
{
    int n = 100;
    // Es ist hier wichtig genau n+1 viele chars zu reservieren, da strings mit
    // einer '\0' abgeschlossen werden müssen
    char* string = malloc(sizeof(char)*(n+1));

    int i;
    for(i = 0; i < n; ++i)
    {
        if(i%2 == 0)
        {
            string[i] = 'z';
        }
        else
        {
            string[i] = 'Z';
        }
        if(n-1 == i)
        {
            string[i+1] = '\0';
        }
    }
    printf("Das passiert, wenn ich schlafe:\n%s", string);

    free(string);
}

