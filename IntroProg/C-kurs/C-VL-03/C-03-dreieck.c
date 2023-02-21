#include <stdio.h>
#include <stdlib.h>

int main() 
{
    int breite = 6, hoehe = 3;

    // oberer Rahmen
    for(int i = 0; i < breite+2; i++) 
    {
        printf("A");
    }
    printf("\n");

    // linker und rechter Rahmen sowie Rechteck
    for(int i = 0; i < hoehe; i++)
    {
        printf("%c",'A');

        for(int j = 0; j < breite; j++)
        {
            printf("%c", 'B');
        }
        printf("%c\n", 'A');
    }

    // unterer Rahmen
    for(int i = 0; i < breite+2; i++) 
    {
        printf("A");
    }
    printf("\n");

    return 0;
}
