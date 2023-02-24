#include <stdio.h>


void print_array(int array[], int len);
int getMax(int array[], int len);
void count_init(int input_array[], int count_array[], int max_value, int len);
void count_sort_write(int a_in[], int a_out[], int len);

int main()
{
	int array[] = {3, 2, 4, 5, 1};
	int len = sizeof(array)/sizeof(int);
	int max = getMax(array, len);
	int count_array[max + 1];

	printf("Unsorted array: ");
	print_array(array, len);

	
	printf("Sorted array: ");
	count_init(array, count_array, max, len);
	count_sort_write(count_array, array, max);
	print_array(array, len);

}

void print_array(int array[], int len)
{
	for (int i = 0; i < len; i++)
	{
		printf("%d ", array[i]);
	}
	printf("\n");
}

int getMax(int array[], int len)
{
	int max = array[0];

	for (int i = 0; i < len; i++)
	{
		if (array[i] > max)
		{
			max = array[i];
		}
	}

	return max;
}

void count_init(int input_array[], int count_array[], int max_value, int len)
{
	for (int i = 0; i <= max_value; i++)
	{
		count_array[i] = 0;
	}

	for (int j = 0; j < len; j++)
	{
		++count_array[input_array[j]];
	}
}

void count_sort_write(int a_in[], int a_out[], int max_value)
{
	int k = 0;
	for (int j = 0; j <= max_value; j++)
	{
		for (int i = 0; i < a_in[j]; i++)
		{
			a_out[k] = j;
			k++;
		}
	}
}
