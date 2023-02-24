#include <stdio.h>

void print_array(int array[], int len);
void swap(int *a, int *b);
void bubblesort(int array[], int len);

int main(int argc, char const *argv[])
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

void print_array(int array[], int len)
{
    for (int i = 0; i < len; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}

void swap(int *a, int *b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

void bubblesort(int array[], int len)
{
    for (int j = len; j > 0; j--)
    {
        for (int i = 0; i < j - 1; i++)
        {
            if (array[i] > array[i + 1])
            {
                swap(&array[i + 1], &array[i]);
            }
        }
    }
}