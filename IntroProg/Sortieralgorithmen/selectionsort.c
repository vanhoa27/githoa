#include <stdio.h>

void selectionsort(int *array, int len);
void print_array(int *array, int len);
void swap(int* a, int* b);

int main(int argc, char const *argv[])
{
    int array[] = { 123, 38, 222, 9, 4, 5};
    int len = sizeof(array)/sizeof(int);

    printf("Unsorted array: ");
    print_array(array, len);

    printf("Sorted array: ");
    selectionsort(array, len);
    print_array(array, len);

    return 0;
}

void print_array(int *array, int len)
{
    for(int i = 0; i < len; i++)
    {
        printf("%d ", array[i]);
    }
    printf("\n");
}

void swap(int* a, int* b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}

void selectionsort(int *array, int len)
{
    for(int j = 0; j < len - 1; j++)
    {
        int min = j;
        for(int i = j + 1; i < len; i++)
        {
            if(array[i] < array[min])
            {
                min = i;
            }
        }
        swap(&array[min], &array[j]);
    }
}
