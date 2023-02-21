#include <stdio.h>
#include "printarray.c"

void bubblesort(int *array, int len);

int main(int argc, char *argv[])
{
    int array[] = {5, 2, 4, 6, 1, 3};
    int len = 6;

    printf("Unsorted array: ");
    print_array(array, len);
    bubblesort(array, len);
    printf("Sorted array: ");
    print_array(array, len);

    return 0;
}

void bubblesort(int *array, int len)
{
    for(int i = 0; i < len - 1; i++)
    {
        for(int j = 0; j < len - i - 1; j++)
        {
            if(array[j] > array[j + 1])
            {
                int temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}