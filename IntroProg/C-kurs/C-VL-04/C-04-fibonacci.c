#include <stdio.h>
#include <stdlib.h>

int fibonacci(int n);

int main(){
    int len;
    scanf("%d", &len);

    
    for(int i = 0; i < len; i++){
        int x = fibonacci(i);
        printf("fibonacci(%d) = %d\n", i, x);
    }
    return 0;
}


/* Terminierung muss immer erreicht werden: 
 * andernfalls kann es zu einem Buffer-Overflow kommen 
 */
int fibonacci(int n){
    if(n <= 1) 
    { 
        return 1; 
    } 
    else
    {
        return fibonacci(n - 1) + fibonacci(n - 2);
    }
}
