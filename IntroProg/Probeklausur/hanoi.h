typedef struct {
    char* name;
    int* array;
    int top_of_stack;
    int max_size;
} stack;

void stack_push(stack *tower, int value);
int stack_pop(stack *tower);

stack *stack_create(char* name, int max_size);
void stack_fill(stack *tower, int count);
void stack_move(int count, stack *source, stack *target, stack *buffer);

int steps;
stack *a_stack, *b_stack, *c_stack;