#include <stdio.h>

int main(int argc, char *argv[])
{
    for(int i = 0; i < argc; i++) 
    {
        /* %02d => zwei Stelligkeit
         */
        printf("%02d: %s\n", i, argv[i]);
    }

    return(0);
}
