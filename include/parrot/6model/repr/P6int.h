#ifndef P6INT_H_GUARD
#define P6INT_H_GUARD

/* This is how an instance with the P6int representation looks. */
typedef struct {
    /* The commonalities all objects have. */
    SixModelObjectCommonalities common;

    /* Integer storage slot. */
    INTVAL value;
} P6intInstance;

/* Initializes the P6int REPR. */
REPROps * P6int_initialize(PARROT_INTERP);

#endif
