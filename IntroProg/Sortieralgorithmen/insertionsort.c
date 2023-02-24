#include <stdio.h>
#include <stdlib.h>

void print_array(int array[], int len);
void insertionsort(int array[], int len);


int main()
{
    int array[] = {18 , 2, 9 ,3, 5};
    int len = sizeof(array)/sizeof(int);

    printf("Unsorted array: ");
    print_array(array, len);

    printf("Sorted array: ");
    insertionsort(array, len);
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

void insertionsort(int array[], int len)
{
    for (int j = 1; j < len; j++)
    {
        int key = array[j];
        int i = j - 1;

        while (i >= 0 && array[i] > key)
        {
            array[i + 1] = array[i];
            i--;
        }
        array[i + 1] = key;
    }
}