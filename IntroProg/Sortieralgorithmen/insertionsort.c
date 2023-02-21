#include <stdio.h>
#include "printarray.c"

void insertionsort(int *array, int len);

int main(int argc, char *argv[])
{
    int array[] = {5, 2, 4, 6, 1, 3};
    insertionsort(array, 6);
    print_array(array, 6);
    return 0;
}

void insertionsort(int *array, int len)
{
    // implement insertionsort
    for(int j = 1; j < len; j++)
    {
        int key = array[j];
        int i = j - 1;
        while(i > -1 && array[i] > key)
        {
            array[i + 1] = array[i];
            i = i - 1;
        }
        array[i + 1] = key;
    }
}