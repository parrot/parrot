
/* Stack declarations. Stolen from rxstacks.h */

#define STACK_CHUNK_DEPTH 256

typedef struct IntStack_entry_t {
   int value;
} *IntStack_Entry;

typedef struct IntStack_chunk_t {
    int used;
    struct IntStack_chunk_t *next;
    struct IntStack_chunk_t *prev;
    struct IntStack_entry_t entry[STACK_CHUNK_DEPTH];
} *IntStack_Chunk;

typedef IntStack_Chunk IntStack;
IntStack intstack_new();
int intstack_depth(IntStack);
void intstack_push(IntStack, int);
int intstack_pop(IntStack);

