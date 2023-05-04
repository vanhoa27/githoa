#include <stddef.h>
typedef struct _integersequenz integersequenz;

struct _integersequenz {
    int* elements;
    size_t len;
};

int delta(integersequenz*);
integersequenz encrypt(integersequenz*, int);
integersequenz decrypt(integersequenz*, int);
void free_integersequenz(integersequenz*);
integersequenz build_integersequenz(int[], int);
void print_integer_sequenz(integersequenz*);
