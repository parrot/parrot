#ifndef P6NUM_H_GUARD
#define P6NUM_H_GUARD

/* This is how an instance with the P6num representation looks. */
typedef struct {
    /* The commonalities all objects have. */
    SixModelObjectCommonalities common;

    /* Floating point storage slot. */
    FLOATVAL value;
} P6numInstance;

/* Initializes the P6num REPR. */
REPROps * P6num_initialize(PARROT_INTERP);

#endif
