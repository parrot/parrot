#if !defined(PARROT_IMCC_SETS_H_GUARD)
#define PARROT_IMCC_SETS_H_GUARD

typedef struct _Set {
   int length;
   unsigned char* bmp;
} Set;

Set* set_make(int);
Set* set_make_full(int);
void set_free(Set*);
void set_clear(Set *s) ;
Set* set_copy(Set*);

int set_equal (Set*, Set*);
void set_add (Set*, int);
int set_contains(Set*, int);
Set* set_union(Set*, Set*);
Set* set_intersec(Set*, Set*);
void set_intersec_inplace(Set*, Set*);

#endif /* PARROT_IMCC_SETS_H_GUARD */

