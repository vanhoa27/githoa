#include <stdio.h>

void swap(int *a, int *b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
}

void print_array(int array[], int len)
{
	for (int i = 0; i < len; i++)
	{
		printf("%d ", array[i]);
	}
	printf("\n");
}

int main()
{
	int a[] = {12, 24, 11, 42};
	int len = 4;

	int x = 1;
	while (x <= len)
	{
		if (x == 1 || a[x] <= a[x - 1])
		{
			x = x + 1;
			print_array(a, len);
		}
		else
		{
			swap(&a[x], &a[x-1]);
			x = x - 1;
			print_array(a, len);
		}
	}


}