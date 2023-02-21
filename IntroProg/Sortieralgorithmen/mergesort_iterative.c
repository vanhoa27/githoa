#include <stdio.h>
#include "printarray.c"

void mergesort_iterative(int *array, int len);

int main(int argc, char *argv[])
{
    int array[] = {10, 2, 3, 7, 9, 8};
    int len = 6;
    mergesort_iterative(array, len);
    print_array(array, len);
    return 0;
}

void mergesort_iterative(int *array, int len)
{
    // implement mergesort_iterative
}