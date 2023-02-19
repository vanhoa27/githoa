#include <stdio.h>

int main(){
    int data[] = {2, 3, 5, 7, 9};
    int *p;
    p = data;

    printf("Content of p %p == address of data %p\n", p, data);
    printf("data[0]: %d ==       *p: %d\n", data[0], *p);
    printf("data[2]: %d == *(p + 2): %d\n\n", data[2], *(p+2));

    // Actually interesting
    printf("data[0] == %p\n" ,&data[0]);
    printf("data    == %p\n" ,&data);
    printf("data[1] == %p\n" ,&data[1]);
}
