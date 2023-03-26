#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ITERATIONS 1000

void perm_print(unsigned char* perm, int length) {
    for (int i = 0; i < length; i++) {
        printf("%d  ", perm[i]);
    }
    printf("\n");
}

void swap(unsigned char* perm, int a, int b) {
    unsigned char temp = perm[a];
    perm[a] = perm[b];
    perm[b] = temp;
}

int permnext(unsigned char* perm, int length);

int main() {
    printf("Das Programm ruft die Funktion permnext auf und zeigt Iterationsnummer und die neu gebildete Permutation an.\n");

    unsigned char test_perm[] = {0, 1, 2, 3};
    int test_perm_length = sizeof(test_perm) / sizeof(test_perm[0]);

    int i = 0;
    while (1) {
        printf("(%d):\t", i);
        perm_print(test_perm, test_perm_length);
        if (!permnext(test_perm, test_perm_length)) {
            printf("Ausfuehrung abgebrochen (maximale Iterationsnummer erreicht).\n");
            break;
        }
        i++;
        if (i >= MAX_ITERATIONS) {
            printf("Ausfuehrung abgebrochen (maximale Iterationsnummer erreicht).\n");
            break;
        }
    }

    return 0;
}

int permnext(unsigned char *perm, int length) {
    int k = length - 2; // largest index k such that perm[k] < perm[k+1]
    int l = length - 1; // largest index l such that perm[k] < perm[l]
    int i, j;           // loop variables used for swapping

    // Step 1: Find the largest index k such that perm[k] < perm[k+1]
    while (k >= 0 && perm[k] >= perm[k + 1]) {
        k--;
    }

    // If there is no such k, we have generated all permutations
    if (k < 0) {
        return 0;
    }

    // Step 2: Find the largest index l such that perm[k] < perm[l]
    while (perm[k] >= perm[l]) {
        l--;
    }

    // Step 3: Swap perm[k] and perm[l]
    swap(perm, k, l);

    // Step 4: Reverse the sequence from perm[k+1] to the end
    i = k + 1;
    j = length - 1;
    while (i < j) {
        swap(perm, i, j);
        i++;
        j--;
    }

    // We have generated the next permutation successfully
    return 1;
}
