#include <stdio.h>
#include "printarray.h"

void mergesort_iterative(int *array, int len);
void merge(int *array, int p, int q, int r);
void print_array(int *array, int len);
int min(int a, int b);

int main(int argc, char *argv[])
{
    int array[] = {10, 2, 3, 7, 9, 8};
    int len = sizeof(array)/sizeof(int); 

    printf("Unsorted array: ");
    print_array(array, len); 

    printf("Sorted array: ");
    mergesort_iterative(array, len);
    print_array(array, len);

    return 0;
}

void print_array(int *array, int len)
{
    for (int i = 0; i < len; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
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
    for (int k = p; k <= r; k++)
    {
        array[k] = helper[k - p];
    }
}

int min(int a, int b){
    return b < a ? b : a;
}

void mergesort_iterative(int* array, int last)
{
    // HIER Funktion merge_sort() implementieren
    int middle;
    int right;
    int step = 1;

    while (step <= last)
    {
        int left = 0;
        while (left <= last - step)
        {
            middle = left + step - 1;
            middle = min(middle, last);

            right = left + 2*step -1;
            right = min(right, last);

            merge(array, left, middle, right);
            left = left + step;
        }
        step = step*2;
    }
}