#include <stdio.h>

int main() {
	int foo[3];

	foo[0] = 0;
	foo[1] = 1;
	foo[2] = 2;

	int *elem_int = foo;  // First elem!

	printf("foo[0]: %d\n", *(elem_int+0));
	printf("foo[1]: %d\n", *(elem_int+1));
	printf("foo[2]: %d\n", *(elem_int+2));

	void *elem = foo;

	printf("foo[?]: %d\n", *(int *)(elem + 2 * sizeof(char)));

	return 0;
}
