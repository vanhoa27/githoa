#include "input3.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* Die Konstanten:
 *  int MAX_LAENGE_STR - die maximale String Länge
 *  int MAX_LAENGE_ARR - die maximale Array Länge
 *  sind input3.c auf jeweils 255 und 100 definiert
 */

int main(int argc, char **argv)
{
    if (argc < 3)
    {
        printf("Aufruf: %s <anzahl> <bundesland>\n", argv[0]);
        printf("Beispiel: %s 100 Bayern\n", argv[0]);
        printf("Klein-/Großschreibung beachten!\n");
        exit(1);
    }

    int anzahl = atoi(argv[1]);
    char *bundesland = argv[2];

    // Statisch allokierter Speicher
    char staedte[MAX_LAENGE_ARR][MAX_LAENGE_STR];
    char laender[MAX_LAENGE_ARR][MAX_LAENGE_STR];
    int bewohner[MAX_LAENGE_ARR];

    int len = read_file("staedte.csv", staedte, laender, bewohner);

    char **string = (char **)malloc(sizeof(char *) * len);
    int stringindex = 0;

    for (int i = 0; i < len; i++) 
    {
        if (strcmp(laender[i], bundesland) == 0 && bewohner[i] >= anzahl) 
        {
            string[stringindex] = (char *)malloc(sizeof(char) * MAX_LAENGE_STR);
            snprintf(string[stringindex], MAX_LAENGE_STR,
                     "Die Stadt %s hat %d Einwohner.", staedte[i], bewohner[i]);
            stringindex += 1;
        }
    }
    write_file(string, stringindex);

    // free line by line
    for (int j = 0; j < stringindex; j++) 
    {
        free(string[j]);
    }
    free(string);
}
