#include <stdio.h>
#include <stdlib.h>
#include "printarray.h"

int get_max(int array[], int n);
void counting_sort(int array[], int n, int exp);
void radix_sort(int array[], int n);

int main()
{
    int array[] = {170, 45, 75, 90, 802, 24, 2, 66};
    int len = sizeof(array) / sizeof(array[0]);


    printf("Unsorted array: ");
    print_array(array, len);

    printf("Sorted array: ");
    radix_sort(array, len);
    print_array(array, len);

    return 0;
}

int get_max(int arr[], int n)
{
    int max = arr[0];
    for (int i = 1; i < n; i++)
    {
        if (arr[i] > max)
        {
            max = arr[i];
        }
    }
    return max;
}

void counting_sort(int arr[], int n, int exp)
{
    int count[10] = {0};
    int output[n];

    // Count the number of occurrences of each digit
    for (int i = 0; i < n; i++)
    {
        count[(arr[i] / exp) % 10]++;
    }

    // Modify count[] to show the position of each digit in the output array
    for (int i = 1; i < 10; i++)
    {
        count[i] += count[i - 1];
    }

    // Build the output array
    for (int i = n - 1; i >= 0; i--)
    {
        output[count[(arr[i] / exp) % 10] - 1] = arr[i];
        count[(arr[i] / exp) % 10]--;
    }

    // Copy the output array back to the original array
    for (int i = 0; i < n; i++)
    {
        arr[i] = output[i];
    }
}

void radix_sort(int arr[], int n)
{
    int max = get_max(arr, n);

    // Sort the array by each digit, starting with the least significant
    for (int exp = 1; max / exp > 0; exp *= 10)
    {
        counting_sort(arr, n, exp);
    }
}