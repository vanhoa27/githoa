#include <stdio.h>
#include "printarray.h"

void swap(int *a, int *b);
void selectionsort(int array[], int len);
void print_array(int array[], int len);

int main()
{
    int array[] = {18 , 2 , 3, 23, 4, 9};
    int len = sizeof(array)/sizeof(int);

    printf("Unsorted array: ");
    print_array(array, len);
    
    printf("Sorted array: ");
    selectionsort(array, len);
    print_array(array, len);

    return 0;
}

void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

void print_array(int array[], int len)
{
    for (int i = 0; i < len; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}

void selectionsort(int array[], int len)
{
    for (int j = 0; j < len - 1; j++)
    {
        int min = j;

        for (int i = j + 1; i < len; i++)
        {
            if (array[i] < array[min])
            {
                min = i;
            }
        }
        swap(&array[min], &array[j]);
    }
}

