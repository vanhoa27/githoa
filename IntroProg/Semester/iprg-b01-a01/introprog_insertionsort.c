#include <stdio.h>
#include <stdlib.h>
#include "arrayio.h"

int MAX_LAENGE = 1000;

void insertion_sort(int array[], int len) 
{
	int tempkey; 
	int counter;
	for (int j=1; j<len; j++) 
	{
		tempkey = array[j]; 
		counter= j-1;  

		while (counter > -1 && array[counter] > tempkey) 
		{ 
			array[counter+1] = array[counter];
			counter--; 
		}
		array[counter+1] = tempkey;
	}
}

int main(int argc, char *argv[]) 
{

    if (argc < 2)
    {
        printf("Aufruf: %s <Dateiname>\n", argv[0]);
        printf("Beispiel: %s zahlen.txt\n", argv[0]);
        exit(1);
    }

    char *filename = argv[1];

    int array[MAX_LAENGE];
    int len = read_array_from_file(array, MAX_LAENGE, filename);

    printf("Unsortiertes Array:");
    print_array(array, len);

	insertion_sort(array,len);

    printf("Sortiertes Array:");
    print_array(array, len);
    return 0;
}
