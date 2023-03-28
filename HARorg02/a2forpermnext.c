// #include <stdio.h>
#include <stdlib.h>

void swap(char* arr, int i, int j) {
    char temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

int next_permutation(char* perm, int length) {
    // Schritt 1
    int k = -1;
    for (int i = 0; i < length - 1; i++) {
        if (perm[i] < perm[i+1]) {
            k = i;
        }
    }

    if (k == -1) {
        return 0; // kein Nachfolger gefunden
    }
   
    //Schritt 2
    int l = k+1;
    for (int i = k+2; i < length; i++) {
        if (perm[i] > perm[k] && perm[i] < perm[l]) {
            l = i;
        }
    }
   
    // Schritt 3
    swap(perm, k, l);
   
    // Schritt 4
    int i = k+1;
    int j = length-1;
    while (i < j) {
        swap(perm, i, j);
        i++;
        j--;
    }
   
    return 1; // Nachfolger gefunden
}

int main() {
    char perm[] = {0, 1, 2, 3};
    int length = sizeof(perm) / sizeof(char);
    int found = next_permutation(perm, length);
    while (found) {
        for (int i = 0; i < length; i++) {
            printf("%d ", perm[i]);
        }
        printf("\n");
        found = next_permutation(perm, length);
    }
    return 0;
}