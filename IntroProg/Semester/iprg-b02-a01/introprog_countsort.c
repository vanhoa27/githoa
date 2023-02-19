#include <stdio.h>
#include <stdlib.h>
#include "arrayio.h"

int MAX_LAENGE = 1000;
int MAX_VALUE = 100;

void count_sort_calculate_counts(int input_array[], int len, int count_array[]) {

    for(int a=0;a<=MAX_VALUE;a++){
         count_array[a]=0; //Countarray initialised with 0
     }

    for(int j=0;j<len;j++){
        count_array[input_array[j]]++;
    }
}

void count_sort_write_output_array(int output_array[], int len, int count_array[]) {

    int k=0;
    for(int j=0; j<=MAX_VALUE;j++){
        for(int i=0;i<count_array[j];i++){
            output_array[k]=j;
            k++;
        }
    }
}


int main(int argc, char *argv[]) {

    if (argc < 2){
        printf("Aufruf: %s <Dateiname>\n", argv[0]);
        printf("Beispiel: %s zahlen.txt\n", argv[0]);
        exit(1);
    }

    char *filename = argv[1];

    int input_array[MAX_LAENGE];
    int len = read_array_from_file(input_array, MAX_LAENGE, filename);

    printf("Unsortiertes Array:");
    print_array(input_array, len);

    /*
     * Hier alle nötigen Deklarationen und Funktionsaufrufe für
     * Countsort einfügen!
     */
    int count_array[MAX_LAENGE]; 
    int output_array[MAX_LAENGE];
    /* int *count_array=(int*)malloc(sizeof(int)*MAX_LAENGE); */
    /* int *output_array=(int*)malloc(sizeof(int)*MAX_LAENGE); */ 

    count_sort_calculate_counts(input_array,len,count_array); //count_array initialised with 0, calc freuqunency of elemtents 
    count_sort_write_output_array(output_array,len,count_array); //numbers sorted into output_array 
    
    printf("Sortiertes Array:");
    print_array(output_array, len); //print output_array
                                    
    /* free((int*)count_array); */
    /* free((int*)output_array); */
    return 0;
}
