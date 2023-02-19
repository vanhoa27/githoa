#include <stdio.h>
#include <stdlib.h>

char *foo_with_error_handling(int n);
void foo(int n);

int main()
{
    int n = 5;
    foo_with_error_handling(n);
    return 0;
}


// malloc example
char *foo_with_error_handling(int n) // to be used
{ 
    char *p;
    // allocate a block of n bytes
    // if ((p = (char *) malloc(n))) == NULL) {

    p = (char *) malloc(n);
    if ( p == NULL)
    {
        perror("malloc failed while allocating n chars");
        exit(1);
    }

    return p;
}

// free example
void foo(int n)
{
    int i, *p;

    /* allocate a block of n integers */
    if ((p=(int *) malloc(n*sizeof(int))) == NULL)
    {
        perror("malloc failed when allocating n integers");
        exit(1);
    }

    for (i = 0; i < n; i++)
    {
        p[i] = i;
    }

    free(p); /* return p to available memory pool */
}
