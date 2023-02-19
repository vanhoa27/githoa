#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include "introprog_input_merge_sort.h"

/*
 * Diese Funktion fügt zwei bereits sortierte Arrays zu einem
 * sortierten Array zusammen
 *
 * array : Pointer auf das Array
 * first : Index des ersten Elemements (Beginn) des (Teil-)Array
 * middle: Index des mittleren Elements des (Teil-)Array
 * last  : Index des Letzten Elements (Ende) des (Teil-)Array
 */

void merge(int* array, int first, int middle, int last)
{
    int H_array[last - first + 1]; 
    int k = first;
    int m = middle + 1;
    int i = 0; 

    while (k <= middle && m <= last)
    {
        if (array[k] <= array[m])
        {
            H_array[i] = array[k];
            k++;
        }
        else
        {
            H_array[i] = array[m];
            m++;
        }
        i++;
    }
    while(k <= middle)
    {
        H_array[i] = array[k];
        k++;
        i++;
    }
    while(m <= last)
    {
        H_array[i] = array[m];
        m++;
        i++; 
    }

    int j = 0;
    while(j < i) 
    {
        array[first + j] = H_array[j];
        j++;
    }
}


/*
 * Diese Funktion implementiert den iterativen Mergesort
 * Algorithmus auf einem Array. Sie soll analog zum Pseudocode
 * implementiert werden.
 *
 * array:  Pointer auf das Array
 * last :  Index des letzten Elements
 */
int min(int a, int b){
    return (a > b) ? b: a;
}

void merge_sort(int* array, int last)
{
    // HIER Funktion merge_sort() implementieren
    int middle;
    int right;
    int step = 1;

    while (step <= last)
    {
        int left = 0;
        while (left <= last - step)
        {
            middle = left + step - 1;
            middle = min(middle, last);

            right = left + 2*step -1;
            right = min(right, last);

            merge(array, left, middle, right);
            left = left + 2*step;
        }
        step = step*2;
    }
}

/*
 * Hauptprogramm.
 *
 * Liest Integerwerte aus einer Datei und gibt diese sortiert im
 * selben Format über die Standardausgabe wieder aus.
 *
 * Aufruf: ./introprog_merge_sort_iterativ <maximale anzahl> \
 * 	   <dateipfad>
 */

int main (int argc, char *argv[])
{
    if (argc!=3){
        printf ("usage: %s <maximale anzahl>  <dateipfad>\n", argv[0]);
        exit(2);
    }
    
    char *filename = argv[2];
    
    // !Hier array initialisieren
    int array[5000]; //array statisch
   
    int len = read_array_from_file(array, atoi(argv[1]), filename);
    int last = len-1; // letzete Element len -1, Index beginnt bei 0 

    printf("Eingabe:\n");
    print_array(array, len);

    // !HIER Aufruf von "merge_sort()"
    merge_sort(array, last);

    printf("Sortiert:\n");
    print_array(array, len);

    return 0;
}
