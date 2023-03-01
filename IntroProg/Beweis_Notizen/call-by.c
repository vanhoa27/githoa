#include <stdio.h>
#include <stdlib.h>

struct s {
	int bar0;
	int bar1;
};

void call_by_val(struct s foo) {
	foo.bar0 = 1;
	printf("In call_by_val:\t%d bei %p\n", foo.bar0, &foo);
}

void call_by_ref(struct s *foo) {
	foo->bar0 = 1;
	printf("In call_by_ref:\t%d bei %p\n", foo->bar0, foo);
}

int main() {
	struct s *foo = malloc(sizeof(struct s));
	if (!foo) {
		perror("no mem");
		exit(1);
	}

	foo->bar0 = 0;
	foo->bar1 = 0;

	printf("In main:\t%d bei %p\n", foo->bar0, foo);
	//call_by_val(*foo); // Dereferenced!
	call_by_ref(foo);
	printf("In main:\t%d bei %p\n", foo->bar0, foo);

	return 0;
}













