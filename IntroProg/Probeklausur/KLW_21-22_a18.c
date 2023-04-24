#include <stdio.h>

void swap(int *a, int *b)
{
	int temp = *a;
	*a = *b;
	*b = temp;
}

void num_out(int *nums, int len)
{
	for (int i = 1; i < len; i++)
		printf("%d ", nums[i]);
	printf("%d\n", nums[len]);
}

int main()
{
	int a[] = {-1, 12, 24, 11, 42, 1};
	int a_len = 5;
	int x = 1;
	while (x <= a_len)
	{
		num_out(a, a_len);
		printf("%d\n", x);
	}

	if (x == 1 || a[x] >= a[x - 1])
	{
		x += 1;
	}
	else
	{
		swap(&a[x], &a[x - 1]);
		x -= 1;
	}
}


