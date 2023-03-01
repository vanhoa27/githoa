#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "printarray.c"

void swap(int *x, int *y);
void quicksort(int array[], int length);
void quicksort_recursion(int array[], int low, int high);
int partition(int array[], int low, int high);

int main(int argc, char const *argv[])
{
    int array[] = {5, 2, 4, 6, 1, 3};
    int len = 6;

    printf("Unsorted array: ");
    print_array(array, len);
    quicksort(array, len);
    printf("Sorted array: ");
    quicksort(array, len);
    print_array(array, len);

    return 0;
}

void swap(int *x, int *y)
{
    int temp = *x;
    *x = *y;
    *y = temp;
} 

void quicksort(int array[], int length)
{
    quicksort_recursion(array, 0, length - 1);
}

void quicksort_recursion(int array[], int low, int high)
{
    if (low < high)
    {
        int pivot = partition(array, low, high);
        quicksort_recursion(array, low, pivot - 1);
        quicksort_recursion(array, pivot + 1, high);
    }
}

int partition(int array[], int low, int high)
{
    int pivot = array[high];
    int i = low - 1;

    for (int j = low; j < high; j++)
    {
        if (array[j] < pivot)
        {
            i++;
            swap(&array[i], &array[j]);
        }
    }
    swap(&array[i + 1], &array[high]);
    return i + 1;
}