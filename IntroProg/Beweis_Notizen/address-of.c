#include <stdio.h>

int main() {
	char foo = 1;
	char bar = 2;

	// &foo -> address-of foo
	printf("foo: %d an Stelle %p\n", foo, &foo);
	printf("bar: %d an Stelle %p\n", bar, &bar);

	return 0;
}
