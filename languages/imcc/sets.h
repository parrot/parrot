
typedef struct _Set {
   int length;
   char* bmp;
} Set;

Set* set_make(int);
Set* set_make_full(int);
Set* set_copy(Set*);
void set_free(Set*);

void set_add (Set*, int);
int set_contains(Set*, int);

int set_equal (Set*, Set*);
void set_intersec_inplace(Set*, Set*);
