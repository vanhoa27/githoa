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

    unsigned char test_perm[] = {1, 2, 3, 4};
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

// int permnext(unsigned char* perm, int length) {
// 	// Save to stack
//     int i = length - 2;
// 	int j = 0;
// 	int k = 0;
// 	int l = 0;

//     while (i >= 0 && perm[i] >= perm[i + 1]) {
//         i--;
//     }

//     if (i < 0) {
//         return 0;
//     }

//     j = length - 1;

//     while (perm[i] >= perm[j]) {
//         j--;
//     }

//     swap(perm, i, j);

//     k = i + 1;
//     l = length - 1;

//     while (k < l) {
//         swap(perm, k, l);
//         k++;
//         l--;
//     }
//     return 1;
// }

int permnext(unsigned char* perm, int length) {
    int i = length - 2;
    int j = 0;
    int k = 0;
    int l = 0;

    // Find the largest i such that perm[i] < perm[i+1]
    while (i >= 0 && perm[i] >= perm[i + 1]) {
        i--;
    }

    // If no such i exists, then the permutation is the last one
    if (i < 0) {
        return 0;
    }

    // Find the largest j such that perm[i] < perm[j]
    j = length - 1;
    while (perm[i] >= perm[j]) {
        j--;
    }

    // Swap perm[i] and perm[j]
    swap(perm, i, j);

    // Reverse the sequence from i+1 to the end of the sequence
    k = i + 1;
    l = length - 1;
    while (k < l) {
        swap(perm, k, l);
        k++;
        l--;
    }

    return 1;
}
