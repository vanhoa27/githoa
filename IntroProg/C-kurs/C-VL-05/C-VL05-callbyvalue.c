#include <stdio.h>
#include <stdlib.h>

int add1 (int a, int b){
    return a+b;
}

int main(){
    int x = 5, y = 3, sum = 0;
    sum = add1(x,y);

    printf("The value of the sum is %d", sum);
}
