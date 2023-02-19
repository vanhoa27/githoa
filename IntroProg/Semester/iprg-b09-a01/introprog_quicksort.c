#define _POSIX_C_SOURCE 200809L
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include "quicksort.h"

/*****************************************************
 * Die benoetigten structs findet Ihr in quicksort.h *
 *****************************************************/

void init_list(list* mylist)
{
    // HIER Liste initialisieren
    mylist->first = NULL;
    mylist->last = NULL;
}


// Diese Funktion fügt Listenelemente an die Liste an
void insert_list(list_element* le, list* mylist)
{
    // HIER Code einfügen
    if(mylist->first == NULL){
        mylist->last =  le;
        mylist->first = le;
        le->next = NULL;
    } else{
        mylist->last->next = le;
        mylist->last = le;
        le->next = NULL;
    }
}

// Speicher für Listenelemente wieder freigeben
void free_list(list* mylist)
{
    // HIER Code einfügen
    list_element *previous_elem;
    list_element *current_elem = mylist->first;
    while(current_elem){

        previous_elem = current_elem;
        current_elem = current_elem->next;

        free(previous_elem->password);
        free(previous_elem);
    }
}

// Namen, Zahlen Paare in Liste einlesen
void read_data(char* filename, list* mylist)
{
    char delim[] = " ";
    char line[100] ;
    FILE *f_pointer = fopen(filename, "r");

    if(f_pointer == NULL){
        perror("Error");
        return;
    }

    while(fgets(line, sizeof(line), f_pointer)){
        char number[100];
        char password_array[100];

        char *password= strtok(line, delim);
        char *counter = strtok(NULL, delim);

        strncpy(number, counter, 100);
        strncpy(password_array, password, 100);

        list_element *element;
        element = malloc(sizeof(list_element));

        password_array[strlen(password_array)] = '\0';
        number[strlen(number)] = '\0';

        element->count = atoi(number);
        element->password = malloc(strlen(password_array) + 1);
        strncpy(element->password, password_array ,strlen(password_array) + 1);

        insert_list(element, mylist);
    }
    fclose(f_pointer);
}




// Liste teilen. Teillisten werden in left und right zurück gegeben
list_element* partition( list* input, list* left, list* right )
{
    list_element *pivot_elem;
    if(input->first == NULL){
        pivot_elem = NULL;
        return pivot_elem;
    }
    pivot_elem = input->first;
    input->first = pivot_elem->next;
    pivot_elem->next = NULL;
    list_element *temp_P = input->first;
    list_element *store;
    while(temp_P != NULL) {
        store = temp_P;
        temp_P = temp_P->next;
        if (store->count <= pivot_elem->count){ // insert in left subarray
            insert_list(store, left);
        } else{                  // insert in right subarray
            insert_list(store, right);
        }
    }
    return pivot_elem;
}


// Hauptfunktion des quicksort Algorithmus

void qsort_list(list* mylist)
{
    // HIER Code einfügen
    if(mylist->first == mylist->last){
        return;
    } else{
        list left_list, right_list;

        list *left = &left_list;
        list *right = &right_list;
        init_list(left);
        init_list(right);

        list_element* pivot_elem = partition(mylist, left, right);

        qsort_list(left);
        qsort_list(right);

        if(left->first == NULL){
            mylist->first = pivot_elem;
        } else{
            mylist->first = left->first;
            left->last->next = pivot_elem;
        }
        if(right->first == NULL){
            pivot_elem->next = NULL;
            mylist->last = pivot_elem;
        } else{
            pivot_elem->next = right->first;
            mylist->last = right->last;
        }
    }
}

// Liste ausgeben
void print_list(list* mylist)
{
    // HIER Code einfügen:
    // * Laufe über die list_element in mylist und gebe sie aus.
    if(mylist->first == NULL){
        printf("Die Liste ist leer!");
        return;
    }

    list_element *temp;
    temp = mylist->first;

    while(temp){
        printf("%s %d\n", temp->password, temp->count);
        temp = temp->next ;
    }
}

