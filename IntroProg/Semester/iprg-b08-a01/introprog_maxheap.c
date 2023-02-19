#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>

#include "introprog_heap.h"

/* Reserviere Speicher für einen Heap
 *
 * Der Heap soll dabei Platz für capacity Elemente bieten.
 *
 * Um konsistent mit den Parametern für malloc zu sein, ist
 * capacity als size_t (entspricht unsigned long auf x86/64)
 * deklariert.
 * Da es sauberer ist, sind auch alle Indizes in dieser Aufgabe
 * als size_t deklariert. Ob man size_t oder int als Index für
 * ein Array verwendet, macht in der Praxis (auf x86/64) nur
 * bei Arrays mit mehr als 2.147.483.647 Elementen einen
 * Unterschied.
 */
heap* heap_create(size_t capacity) {
    heap* new_heap = malloc(sizeof(heap));
    new_heap->size = 0;
    new_heap->capacity = capacity;
    new_heap->elements = malloc(capacity *sizeof(int));

    return new_heap;
}

/* Stellt die Heap Bedingung an Index i wieder her
 *
 * Vorraussetzung: Der linke und rechte Unterbaum von i
 * erfüllen die Heap-Bedingung bereits.
 */
void heapify(heap* h, size_t i) {
    size_t temp = 0;
    size_t largest;
    size_t l = 2*i+1;
    size_t r = 2*i+2;
    if( l < h->size && h->elements[l]  > h->elements[i] ){
        largest = l;
    } else{
        largest = i;
    }
    if(r < h->size && h->elements[r] > h->elements[largest]){
        largest = r;
    }
    if(largest != i){
        // Swap
        temp = h->elements[largest];
        h->elements[largest] = h->elements[i];
        h->elements[i] = temp;
        heapify(h, largest);
    }
}

/* Holt einen Wert aus dem Heap
 *
 * Wenn der Heap nicht leer ist, wird die größte Zahl
 * zurückgegeben. Wenn der Heap leer ist, wird -1 zurückgegeben.
 */
int heap_extract_max(heap* h) {
    if(h->size < 1){
        return -1;
    }

    size_t max = h->elements[0];

    h->elements[0] = h->elements[h->size-1];
    h->size = h->size-1;
    heapify(h,0);

    return max;
}

/* Fügt einen Wert in den Heap ein
 *
 * Wenn der Heap bereits voll ist, wird -1 zurückgegeben.
 */
int heap_insert(heap* h, int key) {
    if (h->size == h->capacity) {
        return -1; 
    }

    h->size = h->size+1;
    int i = h->size-1; 

    while(i > 0 && h->elements[(i-1)/2] < key){ 
        h->elements[i] = h->elements[(i-1)/2];
        i = (i-1)/2;
    }
    h->elements[i] = key;

    return key;
}

/* Gibt den Speicher von einem Heap wieder frei
 */
void heap_free(heap* h) {
    free(h->elements);
    free(h);
}
