#include <stdio.h>
#include <stdlib.h>
#include "integersequenz.h"

/* Implementierung */
// int delta(integersequenz*)

/* Implementierung */
//integersequenz encrypt(integersequenz* , int);


/* Implementierung */
//integersequenz decrypt(integersequenz* , int);


/* Implementierung */
//void free_integersequenz(integersequenz*);

/*
 * Erzeugt eine Struktur integersequenz und kopiert die Inhalte
 * 1. Parameter Zeiger auf ein Integerarray
 * 2. Parameter Länge des Arrays
 */
integersequenz build_integersequenz(int integers[], int len){
    integersequenz i_seq;
    i_seq.elements = malloc(len * sizeof(int));
    i_seq.len = len;
    for(int i=0; i<len; i++){ i_seq.elements[i] = integers[i]; }
    return i_seq;
}

/*
 * Gibt eine Intersequenz auf der Konsole aus
 * Parameter Zeiger auf ein integersequenz struct
 */
void print_integer_sequenz(integersequenz* i_seq){
    printf("\n=====\n[");
    for(int i=0; i < i_seq->len; i++){
        printf("%4d", i_seq->elements[i]);
        if(i < i_seq->len - 1) { printf("|"); }
    }
    printf("]\nLänge der Sequenz beträgt %zu Elemente.\n=====\n", i_seq->len);
}

int main(int argc, char** args)
{
    /* // Debughilfe siehe auch logfile.txt */
    integersequenz i_seq;
    int my_arr1[]= {-40,20,38,3,-80,5};
    i_seq = build_integersequenz(my_arr1, 6);
    print_integer_sequenz(&i_seq);

    /*
    integersequenz i_seq2;
    int mysecret = 20;
    int d = delta(&i_seq);
    printf("Die Differenz nach Süden beträgt %d Meter.\n\n", d);

    i_seq2 = encrypt(&i_seq, mysecret);
    printf("\n\nVerschlüsselt mit Geheimnis %d.\n", mysecret);
    print_integer_sequenz(&i_seq2);
    free_integersequenz(&i_seq);

    i_seq = decrypt(&i_seq2, mysecret);
    printf("\n\nEntschlüsselt mit Geheimnis %d.\n", mysecret);
    print_integer_sequenz(&i_seq);

    free_integersequenz(&i_seq);
    free_integersequenz(&i_seq2);
    return 0;
    */
}
