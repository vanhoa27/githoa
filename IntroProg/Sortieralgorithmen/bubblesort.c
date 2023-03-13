#include <stdio.h>
#include "printarray.h"

void swap(int *a, int *b);
void bubblesort(int array[], int len);

int main()
{
    int array[] = { 18, 28 , 38 ,38 ,2};
    int len = sizeof(array)/sizeof(int);

    printf("Sorted array: ");
    print_array(array, len);

    printf("Unsorted array: ");
    bubblesort(array, len);
    print_array(array, len);
    return 0;
}

void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

void bubblesort(int array[], int len)
{
    for (int i = len; i > 0; --i)
    {
        for (int j = 0; j < len - 1; j++)
        {
            if (array[j] > array[j + 1])
                swap(&array[j], &array[j + 1]);
        }
    }
}
