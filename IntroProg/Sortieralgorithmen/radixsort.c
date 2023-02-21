#include <stdio.h>
#include <stdlib.h>

int getMax(int arr[], int n);
void countSort(int arr[], int n, int exp);
void radixSort(int arr[], int n);
void print_array(int arr[], int n);


int main()
{
    int arr[] = {170, 45, 75, 90, 802, 24, 2, 66};
    int n = sizeof(arr) / sizeof(arr[0]);

    printf("Unsorted array: ");
    radixSort(arr, n);
    print_array(arr, n);

    printf("Sorted array: ");
    print_array(arr, n);
}


// A utility function to get the maximum value in arr[]
int getMax(int arr[], int n)
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

void print_array(int arr[], int n)
{
    for(int i = 0; i < n; i++)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

// A function to do counting sort of arr[] according to
// the digit represented by exp.
void countSort(int arr[], int n, int exp)
{
    int output[n];
    int i, count[10] = {0};

    // Store count of occurrences in count[]
    for(i = 0; i < n; i++) 
    {
        count[(arr[i] / exp) % 10]++;
    }

    // Change count[i] so that count[i] now contains
    // actual position of this digit in output[]
    for(i = 1; i < 10; i++) 
    {
        count[i] += count[i - 1];
    }

    // Build the output array
    for(i = n - 1; i >= 0; i--)
     {
        output[count[(arr[i] / exp) % 10] - 1] = arr[i];
        count[(arr[i] / exp) % 10]--;
    }

    // Copy the output array to arr[], so that arr[] now
    // contains sorted numbers according to current digit
    for(i = 0; i < n; i++)
    {
        arr[i] = output[i];
    }
}

// Radix Sort function
void radixSort(int arr[], int n)
{
    // Find the maximum number to know number of digits
    int m = getMax(arr, n);

    // Do counting sort for every digit. Note that instead
    // of passing digit number, exp is passed. exp is 10^i
    // where i is current digit number
    for(int exp = 1; m / exp > 0; exp *= 10) 
    {
        countSort(arr, n, exp);
    }
}