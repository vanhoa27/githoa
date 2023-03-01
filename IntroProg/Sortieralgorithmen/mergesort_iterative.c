#include <stdio.h>
#include "printarray.h"

void mergesort_iterative(int *array, int len);
void merge(int *array, int p, int q, int r);
int min(int a, int b);

int main()
{
    int array[] = {10, 2, 3, 7, 9, 8};
    int len = sizeof(array)/sizeof(int); 
    int last = len - 1;

    printf("Unsorted array: ");
    print_array(array, len); 

    printf("Sorted array: ");
    mergesort_iterative(array, last);
    print_array(array, len);

    return 0;
}

void merge(int* array, int first, int middle, int last)
{
    int H_array[last - first + 1]; 
    int k = first;
    int m = middle + 1;
    int i = 0; 

    while (k <= middle && m <= last)
    {
        if (array[k] <= array[m])
        {
            H_array[i] = array[k];
            k++;
        }
        else
        {
            H_array[i] = array[m];
            m++;
        }
        i++;
    }
    while(k <= middle)
    {
        H_array[i] = array[k];
        k++;
        i++;
    }
    while(m <= last)
    {
        H_array[i] = array[m];
        m++;
        i++; 
    }

    int j = 0;
    while(j < i) 
    {
        array[first + j] = H_array[j];
        j++;
    }
}

int min(int a, int b)
{
    return a < b ? a : b; 
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
            right = left + 2 * step -1;

            merge(array, left, middle, min(right, last));
            left = left + 2 * step;
        }
        step = step * 2;
    }
}