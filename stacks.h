/* stacks.h
 *
 * Define the structures in the perl 6 stack system
 *
 */

struct Stack_Entry {
  IV entry_type;
  union {
    NV number;
    IV int;
    PMC *pmc;
    STRING *string;
    void *generic_pointer;
  } entry;
}

struct Stack {
  struct *Stack_Entry[];
}
