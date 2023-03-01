#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <math.h>
#include "hanoi.h"

/*
* stack_push legt ein Element auf den Stack
*
* tower - Ein Pointer auf den Stack
* value - Zahl, die als neues Element auf den Stack gelegt
* werden soll.
*/
void stack_push(stack* tower, int value)
{
    if( value <= 0) return;
    if(tower->top_of_stack >= tower->max_size) return;
    tower->array[tower->top_of_stack] = value;
    tower->top_of_stack++;

    //TODO: hier implementieren


}

/*
* stack_pop gibt das zu letzt eingefügte Element
* oder NaN bzw. -1 zurück, wenn kein Element vorhanden ist
*
* tower - Ein Pointer auf den Stack
*/
int stack_pop(stack* tower)
{
    if (tower->top_of_stack <= 0) {
        return -1;
    } else{
        int revalue = tower->array[tower->top_of_stack-1];
        tower->array[tower->top_of_stack-1]=0;
        tower->top_of_stack--;
        return revalue;
    }

    //TODO: hier implementieren
}

/*
* Debugausgabe des Stack
* Diese Funktion kannst du zum debugging des Stacks verwenden.
* 
* astack - Ein Pointer auf den Stack 
* bstack - Ein Pointer auf den Stack
* cstack - Ein Pointer auf den Stack
*
* Diese Funktion darf nicht verändert werden.
*/
void print_hanoi_stapel(stack *astack, stack *bstack, stack *cstack) {
    // warnung int counter = 0;
    printf("\n|xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx|\n");
    printf("[%3d/%3d|", astack->top_of_stack, astack->max_size);
    for(int c=0; c < astack->max_size; c++){
        int value = astack->array[c];
        printf("%3d ", value);
    }
    printf("%s|\n", astack->name);
    
    printf("[%3d/%3d|", bstack->top_of_stack, bstack->max_size);
    for(int c=0; c < bstack->max_size; c++){
        printf("%3d ", bstack->array[c]);
    }
    printf("%s|\n", bstack->name);

    printf("[%3d/%3d|", cstack->top_of_stack, cstack->max_size);
    for(int c=0; c < bstack->max_size; c++){
        printf("%3d ", cstack->array[c]);
    }
    printf("%s|\n", cstack->name);
}

/*
 * stack_create erstellt einen Stack mit dynamischem Speicher
 * und initialisiert die im struct definierten Variablen
 * und gibt einen Pointer auf den erstellten Stack
 * 
 * name - Ein Pointer auf einen String
 * value - Zahl, die als neues Element auf den Stack gelegt
 */
stack* stack_create(char* name, int max_size) { 
    //TODO: hier implementieren
    if(max_size <= 0){
        return NULL;
    }
    stack *new_stack = (stack*)malloc(sizeof (stack));
    new_stack->array = calloc(max_size, sizeof(int));
    new_stack->name = name; // nur eine Buchstabe
    new_stack->top_of_stack = 0;
    new_stack->max_size = max_size;
    return new_stack;
}

/*
 * stack_fill befüllt den Stack initial mit Elementen
 * das größte Element soll den Wert von count haben
 * das kleinste Element soll den Wert eins haben
 * die Elemente sollen entsprechend der Regeln sortiert sein 
 */
void stack_fill(stack * tower, int count) {
    //TODO: hier implementieren
    for (int i = 0; i< count;i++){
        tower->array[i]= count - i;
        tower->top_of_stack++;
    }
}

/**
 * rekursives verschieben
 * Diese Funktion enthält Fehler und muss korrigiert werden.
 * Hinweis: Jede Zeile enthält maximal 1 Fehler
 */
void stack_move(int count, stack *source, stack *target, stack *buffer) {
    if (count >= 2) {
        /* Schritt 1 Schiebe den oberen Teil des Turmes auf den Puffer */
        stack_move(count - 1, source, buffer, target);// tauschen buffer und target
        /* Schritt 2 Schiebe die letzte Scheibe */
        stack_move(1, source, target, buffer);// 1 statt 0
        /* Schritt 3 Schiebe den oberen Teil des Turmes vom Puffer in das Ziel */
        stack_move(count - 1, buffer, target, source);//
    } else if (count == 1) {// {
        int slice;
        // rekursionsende, es soll nur noch 1 Scheibe verschoben werden
        steps++;
        slice = stack_pop(source);
        stack_push(target, slice);
        printf("Scheibe: %3i von %s nach %s gelegt.\n", slice, source->name, target->name);//slice
    }
}
//[end_of_stack_move] // diese Zeile nicht ändern !

/*
 * Haupteinsprungpunkt
 */
int main(int argc, char** args)
{
    /* die Stapelhöhe kann variieren */
    int stapel_hoehe = 3;

    a_stack = stack_create("A", stapel_hoehe);
    b_stack = stack_create("B", stapel_hoehe);
    c_stack = stack_create("C", stapel_hoehe);

    // Spiel mit anzahl von Scheiben initilisieren
    stack_fill(a_stack, stapel_hoehe);
    print_hanoi_stapel(a_stack, b_stack, c_stack);

    /* wir wollen den Stapel A nach C verschieben und nutzen B als Puffer */
    stack_move(stapel_hoehe, a_stack, c_stack, b_stack);
    print_hanoi_stapel(a_stack, b_stack, c_stack);
}
