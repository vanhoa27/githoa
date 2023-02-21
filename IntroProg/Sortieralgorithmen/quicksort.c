#include <stdio.h>
#include "printarray.c"

void quicksort(int *array, int len);

int main(int argc, char const *argv[])
{
    int array[] = {5, 2, 4, 6, 1, 3};
    int len = 6;

    printf("Unsorted array: ");
    print_array(array, len);
    quicksort(array, len);
    printf("Sorted array: ");
    print_array(array, len);

    return 0;
}

void quicksort(int *array, int len)
{
    // implement quicksort
    int i, j, p, t;
    if(len < 2)
    {
        return;
    }
    p = array[len / 2];

    for(i = 0, j = len - 1;; i++, j--)
    {
        while(array[i] < p)
        {
            i++;
        }
        while(p < array[j])
        {
            j--;
        }
        if(i >= j)
        {
            break;
        }
        t = array[i];
        array[i] = array[j];
        array[j] = t;
    }
    quicksort(array, i);
    quicksort(array + i, len - i);
}