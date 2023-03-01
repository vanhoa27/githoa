#include <stdio.h>

int main() {
	int foo = 8000;
	// Typisierung von Pointern beachten!
	int *foo_ptr = &foo;

	printf("foo: %d an Stelle %p\n", foo, foo_ptr);
	//printf("Groeße foo: %lu\n", sizeof(foo));
	//printf("Groeße foo_ptr: %lu\n", sizeof(foo_ptr));
	
	// *foo_ptr -> Dereferenzierung foo_ptr
	printf("foo: %d an Stelle %p\n", *foo_ptr, foo_ptr);

	return 0;
}
