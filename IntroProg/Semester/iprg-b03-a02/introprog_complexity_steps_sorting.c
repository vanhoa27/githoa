#include <stdio.h>
#include <stdlib.h>
#include "introprog_complexity_steps_input.h"

const int MAX_VALUE = 5000000;

void count_sort_calculate_counts(int input_array[], int len, int count_array[], unsigned int* befehle) {

    (*befehle)++; // Variable i wird mit 0 initialisiert 
    for(int a=0;a<= MAX_VALUE;a++){ 
         
         (*befehle)++; // a und MAX_VALUE werden so of wie MAX_VALUE groß ist verglichen 
         (*befehle)++; // a wird so oft wie MAX_VALUE groß ist inkrementiert
         (*befehle)++; // count_array wird von 0 bis bis MAX_VALUE mit 0 initialisiert 

         count_array[a]=0; 
    }
    (*befehle)++; // letzter Vergleich von a und MAX_VALUE 


    (*befehle)++; // Variable j wird mit 0 initialisiert
    for(int j=0;j<len;j++){ 

        (*befehle)++; // j und len werden len-1 mal verglichen 
        (*befehle)++; // j wird len-1 mal inkrementiert 
        (*befehle)++; // count_array wird so oft an den Stellen der Zahlen inkrementiert, wie die Zahlen vorkommen  

        count_array[input_array[j]]++;
    }

    (*befehle)++; // letzter Vergleich von j und len 

}

void count_sort_write_output_array(int output_array[], int len, int count_array[], unsigned int* befehle) {
     
    (*befehle)++; // Variable k wird mit 0 initialisiert 
    int k=0;

    (*befehle)++; // Variable j wird initialisiert
    for(int j=0; j<= MAX_VALUE;j++){
        
        (*befehle)++; // j und MAX_VALUE werden MAX_VALUE+1 mal verglichen  
        (*befehle)++; // j wird von MAX_VALUE+1 mal inkrementiert

        (*befehle)++; // Variable i wird von 0 bis MAX_VALUE initialisiert 
        for(int i=0;i<count_array[j];i++){ 
            
            (*befehle)++; // i und count_array[j] werden n^2-mal verglichen   
            (*befehle)++; // i wird n^2-mal inkrementiert 
            
            (*befehle)++; // dem output_array[k] wird n^2-mal der Wert j zugewiesen 
            (*befehle)++; // k wird n^2-mal inkrementiert
            output_array[k]=j;
            k++;
        }

        (*befehle)++; // letzter Vergleich von i und count_array[j]
    }

    (*befehle)++; // letzter Vergleich von j und MAX_VALUE

}


void count_sort(int array[], int len, unsigned int* befehle) {
     
    // Arrays mit malloc Speicher allokiert
    int* count_array = malloc((sizeof(int)* MAX_VALUE)+sizeof(int));
 
    (*befehle)++; // count_array wird Speicher allokiert


    // Aufrufen der Funktionen count_sort_calculate_counts && count_sort_write_output_array
    count_sort_calculate_counts(array, len, count_array, befehle);
    count_sort_write_output_array(array, len, count_array, befehle);


    // Speicher wird freigegeben 
    free(count_array);

    (*befehle)++; // count_array wird freigegeben
    
}


void insertion_sort(int array[], int len, unsigned int* befehle) {
    
    (*befehle)++; // array_insertionsort Speicher allokiert

    int tempkey; 
	int counter;

    (*befehle)++; // Variable j wird mit 1 initialisiert
	for (int j=1;j<len; j++) {
        
        (*befehle)++; // j und len werden n-mal verglichen
        (*befehle)++; // j wird n-mal inkrementiert
        

        (*befehle)++; // tempkey wird n-mal der Wert array[j] zugewiesen
        (*befehle)++; // counter wird n-mal der Wert j-1 zugewiesen
		tempkey = array[j]; 
		counter=j-1;  

		while (counter>-1 && array[counter]>tempkey) { 

            (*befehle)++; // counter wird n-mal mit -1 verglichen
            (*befehle)++; // array[counter] wird n-mal mit tempkey verglichen
            
            (*befehle)++; // array[counter+1] wird solange die While-Schleife stimmt der Wert array[counter] zugewiesen
			array[counter+1]=array[counter];


            (*befehle)++; // counter wird solange die Bedingung der While-Schleife stimmt inkrementiert
			counter--; 
		}

        (*befehle)++; // letzter Vergleich von counter und -1
        (*befehle)++; // letzter Vergleich von array[counter] und tempkey
        

        (*befehle)++; // array[counter+1] wird der Wert von tempkey zugewiesen
		array[counter+1]=tempkey;
	}

    (*befehle)++; // letzter Vergleich von j und len
    
}


int main(int argc, char *argv[]) {
    const int WERTE[] = {10000,20000,30000,40000,50000};
    const int LEN_WERTE = 5;
    const int LEN_ALGORITHMEN = 2;

    int rc = 0;
    unsigned int befehle_array[LEN_ALGORITHMEN][LEN_WERTE];
    double laufzeit_array[LEN_ALGORITHMEN][LEN_WERTE];

    for(int j = 0; j < LEN_WERTE; ++j) {
        int n = WERTE[j];

        // Reserviere Speicher für  Arrays der Länge n
        int* array_countsort = malloc(sizeof(int) * n);
        int* array_insertionsort = malloc(sizeof(int) * n);

        // Fülle array_countsort mit Zufallswerten ..
        fill_array_randomly(array_countsort, n, MAX_VALUE);
        // ... und kopiere die erzeugten Werte in das Array
        // array_insertionsort
        copy_array_elements(array_insertionsort, array_countsort, n);

        // Teste ob beide Arrays auch wirklich die gleichen Werte
        // enthalten
        if(!check_equality_of_arrays(array_countsort, array_insertionsort, n)) {
            printf("Die Eingaben für beide Algorithmen müssen für die Vergleichbarkeit gleich sein!\n");
            return -1;
        }

        for(int i = 0; i < LEN_ALGORITHMEN; ++i) {
            unsigned int anzahl_befehle = 0;

            start_timer();

            // Aufruf der entsprechenden Sortieralgorithmen
            if(i==0) {
                    count_sort(array_countsort, n, &anzahl_befehle);
            } else if(i==1) {
                    insertion_sort(array_insertionsort, n, &anzahl_befehle);
            }

            // Speichere die Laufzeit sowie die Anzahl benötigter
            // Befehle
            laufzeit_array[i][j] = end_timer();
            befehle_array[i][j] = anzahl_befehle;
        }

        // Teste, ob die Ausgabe beider Algorithmen gleich sind
        if(!check_equality_of_arrays(array_countsort, array_insertionsort, n)) {
            printf("Die Arrays sind nicht gleich. Eines muss (falsch) sortiert worden sein!\n");
            rc = -1;
        }

        // Gib den Speicherplatz wieder frei
        free(array_countsort);
        free(array_insertionsort);
    }

    // Ausgabe der Anzahl ausgeführter Befehle sowie der gemessenen
    // Laufzeiten (in Millisekunden)
    printf("Parameter MAX_VALUE hat den Wert %d\n", MAX_VALUE);
    printf("\t %32s           %32s \n", "Countsort","Insertionsort");
    printf("%8s \t %16s %16s \t %16s %16s \n", "n","Befehle", "Laufzeit","Befehle","Laufzeit");

    for(int j = 0; j < LEN_WERTE; ++j) {
        printf("%8d \t ",WERTE[j]);
        for(int i = 0; i < LEN_ALGORITHMEN; ++i) {
            printf("%16u %16.4f \t ",  befehle_array[i][j], laufzeit_array[i][j]);
        }
        printf("\n");
    }

    return rc;
}
