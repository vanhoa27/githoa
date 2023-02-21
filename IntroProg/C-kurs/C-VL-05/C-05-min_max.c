#include <stdio.h>
#include <stdlib.h>

void print_array(int array[], int len);
void sum(int array[], int len, int *summe);
int min(int array[], int len);
int max(int array[], int len);

int main() 
{
    int array[] = {9, 4, 7, 8, 10, 5, 1, 6, 3, 2};
    int len = 10;
    int summe = 0;

    printf("Array: ");
    print_array(array, len);

    sum(array, len, &summe);

    printf("Minimum: %d\n", min(array, len));
    printf("Maximum: %d\n", max(array, len));
    printf("Summe: %d\n", summe);

    // Gebe hier nacheinander das Minimum, Maximum und die Summe
    // aus. Trenne die Werte durch einen einzelnen Zeilenumbruch.
    return 0;
}


void print_array(int array[], int len) 
{
    for(int i = 0; i < len; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}

// Schreibe die Funktion "sum", "min" und "max"
void sum(int array[], int len, int *summe)
{
    for(int i = 0; i < len; i++)
    {
        *summe += array[i];
    }    
}

int min(int array[], int len)
{
    int Minimum = array[0];
   
    for(int i = 0; i < len; i++)
    {
        if(array[i] < Minimum)
        {
            Minimum = array[i];
        }
    }

    return Minimum; 
}

int max(int array[], int len)
{
    int Maximum = array[0];

    for(int i = 0; i < len; i++)
    {
        if(array[i] > Maximum)
        {
            Maximum = array[i];
        }
    }

    return Maximum;
}
