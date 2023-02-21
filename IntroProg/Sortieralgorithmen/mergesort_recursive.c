#include <stdio.h>
#include "printarray.c"

void merge(int *array, int p, int q, int r);
void mergesort_recursive(int *array, int p, int r);

int main()
{
    int array[] = {5, 2, 4, 6, 1, 3};
    int len = 6;
    printf("Unsorted array: ");
    print_array(array, len);

    mergesort_recursive(array, 0, len);
    printf("Sorted array: ");
    print_array(array, len);
    return 0;
}

void merge(int *array, int p, int q, int r)
{
    int helper[r - p];
    int i = p;
    int j = q;
    int b = 0;

    while(i < q && j < r)
    {
        if(array[i] < array[j])
        {
            helper[b] = array[i];
            i++;
        }
        else
        {
            helper[b] = array[j];
            j++;
        }
        b++;
    }
    while(i < q)
    {
        helper[b] = array[i];
        i++;
        b++;
    }
    while(j < r)
    {
        helper[b] = array[j];
        j++;
        b++;
    }

    for(b = 0; b < r - p; b++)
        array[b + p] = helper[b];
}

void mergesort_recursive(int *array, int p, int r)
{
    // implement megesort_recursive
    if(p < r - 1)
    {
        int q = (p + r) / 2;
        mergesort_recursive(array, p, q);
        mergesort_recursive(array, q, r);
        merge(array, p, q, r);
    }
}
