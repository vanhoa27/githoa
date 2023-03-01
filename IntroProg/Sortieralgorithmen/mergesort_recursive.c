#include <stdio.h>
#include "printarray.h"

void merge(int *array, int p, int q, int r);
void mergesort_recursive(int *array, int p, int r);

int main()
{
    int array[] = {5, 2, 4, 6, 1, 3};
    int len = sizeof(array)/sizeof(int);

    printf("Unsorted array: ");
    print_array(array, len);

    printf("Sorted array: ");
    mergesort_recursive(array, 0, len - 1);
    print_array(array, len);

    return 0;
}

void merge(int *array, int p, int q, int r)
{
    int helper[r - p + 1];
    int i = p;
    int j = q + 1;
    int b = 0;

    while (i <= q && j <= r)
    {
        if (array[i] <= array[j])
        {
            helper[b++] = array[i++];
        }
        else
        {
            helper[b++] = array[j++];
        }
    }
    while (i <= q)
    {
        helper[b++] = array[i++];
    }
    while (j <= r)
    {
        helper[b++] = array[j++];
    }
    array[p] = helper[0];
}


void mergesort_recursive(int *array, int p, int r)
{
    // implement megesort_recursive
    if(p < r)
    {
        int q = (p + r) / 2;
        mergesort_recursive(array, p, q);
        mergesort_recursive(array, q + 1, r);
        merge(array, p, q, r);
    }
}
