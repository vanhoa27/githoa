#include <stdio.h>

void print_array(int *array, int len);
void count_init(int input[], int count[], int len, int max);
void count_sort_write(int count[], int output[], int len, int max);

int main(int argc, char const *argv[])
{
	int array[] = {18, 29, 3, 23, 5};
	int len = sizeof(array)/sizeof(int);
	int max = 29;
	int count[max + 1];

	printf("Unsorted array: ");
	print_array(array, len);

	printf("Sorted array: ");
	count_init(array, count, len, max);
	count_sort_write(count, array, len, max);
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

void count_init(int input[], int count[], int len, int max)
{
	for (int i = 0; i <= max; i++)
	{
		count[i] = 0;
	}

	for (int j = 0; j < len; j++)
	{
		++count[input[j]];
	}
}

void count_sort_write(int count[], int output[], int len, int max)
{
	int k = 0;
	for (int j = 0; j <= max; j++)
	{
		for (int i = 0; i < count[j]; i++)
		{
			output[k] = j;
			k++;
		}
	}
}
