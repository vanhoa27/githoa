#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() 
{
    char wochentag[] = "Freitag";
    int tag = 13;
    char monat[] = "Mai";
    int jahr = 1927;
    const size_t capacity = 100*sizeof(char);
    char *string= (char*)malloc(capacity);

    // Hier implementieren und dynamisch Speicher reservieren 
    snprintf(string, capacity,"%s, der %d %s %d" ,wochentag ,tag ,monat ,jahr);
    printf("%s\n", string);

    free(string);
    return 0;
}
