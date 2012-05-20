#ifndef M0_MOB_STRUCTURES_H
#  include <stdint.h>

typedef struct M0_Constants_Segment {
    uint64_t       *consts;
    unsigned int   *pointers;
    unsigned long   count;
} M0_Constants_Segment;

typedef struct M0_Metadata_Entry {
    unsigned long offset;
    unsigned long name_index;
    unsigned long value_index;
} M0_Metadata_Entry;

typedef struct M0_Metadata_Segment {
    const M0_Metadata_Entry **entries;
    unsigned long             count;
} M0_Metadata_Segment;

typedef struct M0_Bytecode_Segment {
    unsigned long  op_count;
    unsigned char *ops;
} M0_Bytecode_Segment;

typedef struct M0_Chunk {
    unsigned int          id;
    unsigned long         name_length;
    const char           *name;
    struct M0_Chunk      *next;
    M0_Constants_Segment *constants;
    M0_Metadata_Segment  *metadata;
    M0_Bytecode_Segment  *bytecode;
} M0_Chunk;

#  define M0_MOB_STRUCTURES_H 1
#endif

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4 cinoptions='\:2=2' :
 */
