#include <stdio.h>

void bubblesort(int array[], int len);
void selectionsort(int array[], int len);
void insertionsort(int array[], int len);
void print_array(int array[], int len);

int getMax(int array[], int len);
void count_init(int input[], int count[], int max_value, int len);
void count_sort_write(int count[], int output[], int count_len);

int main()
{
	int array[] = {18 , 2 ,3 , 34 , 9 , 43};
	int len = sizeof(array)/sizeof(int);
	int max = getMax(array, len);
	int count[max + 1];

	printf("Unsorted array: ");
	print_array(array, len);

	printf("Sorted array: ");
	count_init(array, count, max, len);
	count_sort_write(count, array, max);
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

void bubblesort(int array[], int len)
{
	for (int i = len; i > 0; i--)
	{
		for (int j = 0; j < i - 1; j++)
		{
			if (array[j] > array[j + 1])
			{
				int temp = array[j];
				array[j] = array[j + 1];
				array[j + 1] = temp;
			}
		}
	}
}

void selectionsort(int array[], int len)
{
	for (int i = 0; i < len -1; i++)
	{
		int min = i;
		for (int j = i + 1; j < len; j++)
		{
			if(array[j] < array[min])
			{
				min = j;
			}
		}
		int temp = array[i];
		array[i] = array[min];
		array[min] = temp;
	}
}

void insertionsort(int array[], int len)
{
	for (int i = 0; i < len; i++)
	{
		int key = array[i];
		int j = i - 1;

		while (j >= 0 && array[j] > key)
		{
			array[j + 1] = array[j];
			j--;
		}
		array[j + 1] = key;
	}
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
void count_init(int input[], int count[], int max_value, int len)
{
	for (int i = 0; i <= max_value; i++)
	{
		count[i] = 0;
	}

	for (int j = 0; j < len; j++)
	{
		count[input[j]]++;
	}
	
}
void count_sort_write(int count[], int output[], int count_len)
{
	int k = 0;
	for (int i = 0; i <= count_len; i++)
	{
		for (int j = 0; j < count[i]; ++j)
		{
			output[k] = i;
			k++;
		} 
	}
}



