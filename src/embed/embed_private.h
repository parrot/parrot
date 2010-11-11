
#define GET_RAW_INTERP(p) ((Parrot_ParrotInterpreter_attributes)(p)->data)->interp;
#define EMBED_API_CALLIN(p, i) \
    jmp_buf _env; \
    Interp * (i) = PMC_IS_NULL(p) ? NULL : GET_RAW_INTERP(p); \
    void *_oldtop = (i)->lo_var_ptr; \
    if (_oldtop) {} else (1)->lo_var_ptr = &oldtop \
    PARROT_ASSERT(i); \
    PARROT_ASSERT((i)->lo_val_ptr); \
    if (setjmp(_env)) { \
        (i)->api_jmp_buf = NULL; \
        return 0; \
    } else { \
        (i)->api_jmp_buf = _env; \
        {
#define EMBED_API_CALLOUT(p, i) \
        } \
        if (!_oldtop) {\
            PARROT_ASSERT((i)->lo_var_ptr == &oldtop);\
            (i)->lo_var_ptr = NULL;\
        }\
        return 1; \
    }

#define EMBED_API_FAILURE(p, i) \
    do { \
        if (!_oldtop) {\
            PARROT_ASSERT((i)->lo_var_ptr == &oldtop);\
            (i)->lo_var_ptr = NULL;\
        } \
        return 0; \
    }
