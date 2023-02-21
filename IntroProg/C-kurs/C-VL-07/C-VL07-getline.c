#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char **argv) 
{
    int lines = 0;
    int chars = 0;
    char* buf = NULL;
    size_t buflen = 0;

    while (getline(&buf, &buflen, stdin) > 0)
    {
        lines++;
        chars += strlen(buf);
    }

    printf("Read %2d lines, %3d chars\n", lines, chars);

    if (buf != NULL) 
    { 
        free(buf);
    }

    return(0);
}
