#include <stdio.h>
#include <stdlib.h>

typedef struct {
    int* data;
    int int1;
    int int2;
} mystruct;

void foo(mystruct *var1, int value)
{
    if(var1->int1 >= var1->int2){ exit(1); }
    var1->data[var1->int1] = value;
    (var1->int1)++;
    return;
}

int bar(mystruct *var1)
{
    if (var1->int1 < 1) { exit(1); }
    int value = var1->data[var1->int1 - 1];
    var1->data[var1->int1 - 1] = 0;
    (var1->int1)--;
    return value;
}

/*
 * Erstelle die Datenstruktur und reserviere den nötigen Speicher
 * für capacity Elemente und setze die Hilfsvariablen int1 und int2 
 */
mystruct* data_create(int capacity) {
    mystruct* data = malloc(sizeof(mystruct));
    data->data = malloc(capacity * sizeof(int));
    data->int1 = 0;
    data->int2 = capacity;
    return data;
}

int main(int argc, char** args)
{
    mystruct* data = data_create(9);
    foo(data, 9);
    foo(data, 52);
    foo(data, 32);
    foo(data, 10);
    bar(data);
    foo(data, 10);
    foo(data, 9);
    printf("Ich bin fertig.\n");
    return 0;
}
