/* Some structures relating to the .NET CLI files and metadata PMCs. */

/* This structure describes a loaded .NET assembly. */
struct dotnet_assembly {
    /* Details that the user of the PMC may be interested in. */
    STRING* filename;
    int is_dll;
    Parrot_UInt4 entry_point;

    /* Heaps and tables pointers, sizes and pointer sizes if needed. */
    unsigned char *strings;
    Parrot_UInt4 strings_size;
    Parrot_UInt4 strings_ptr_size;
    unsigned char *user_strings;
    Parrot_UInt4 user_strings_size;
    unsigned char *blobs;
    Parrot_UInt4 blobs_size;
    Parrot_UInt4 blobs_ptr_size;
    unsigned char *tables;
    Parrot_UInt4 tables_size;
    Parrot_UInt4 guid_ptr_size;

    /* Table info. */
    Parrot_UInt4 valid_hi;
    Parrot_UInt4 valid_lo;
    Parrot_UInt4 positions[MAX_TABLE];
    Parrot_UInt4 rows[MAX_TABLE];

    /* Globals PMC and classes PMC array. */
    PMC *globals;
    PMC *classes;
    PMC *class_order;

    /* Field and method tables pointing to field and method PMCs. */
    PMC *fields;
    PMC *methods;

    /* Linkage related PMCs. */
    PMC *typerefs;
    PMC *memberrefs;
    PMC *assemblyrefs;

    /* Internal stuff relating to PE headers. */
    Parrot_UInt2 pe_sections;
    int pe_sections_pos;
    Parrot_UInt4 rva_code;
    Parrot_UInt4 rva_data;

    /* Flag indicating if the file has been loaded. */
    int loaded;
};


/* This structure describes a reference to another assembly. */
struct dotnet_assemblyref {
    /* Version. */
    Parrot_UInt2 version_major;
    Parrot_UInt2 version_minor;
    Parrot_UInt2 version_build;
    Parrot_UInt2 version_revision;
    
    /* Info about the assembly and its author. */
    Parrot_UInt4 flags;
    Parrot_UInt4 public_key;
    STRING *str_name;
    STRING *str_culture;
    Parrot_UInt4 hash_value;
};


/* This structure describes a .NET class. */
struct dotnet_class {
    /* Pointer to the assembly PMC the class belongs to. */
    PMC *parent;

    /* Position in heaps for name, namespace and signature. */
    STRING *str_name;
    STRING *str_namespace;
    STRING *str_fullname;

    /* Arrays of fields and methods. */
    PMC *fields;
    PMC *methods;

    /* Flags. */
    Parrot_UInt4 flags;

    /* Parent. */
    Parrot_UInt4 parent_type;
    Parrot_UInt4 parent_id;

    /* Interfaces. */
    PMC* interface_types;
    PMC* interface_ids;
};


/* This structure describes a .NET method. */
struct dotnet_method {
    /* Pointer to the class PMC the method belongs to. */
    PMC *parent;

    /* Name. signature blob position and parameter array. */
    STRING *str_name;
    Parrot_UInt4 signature;
    PMC *params;

    /* Bytecode. */
    PMC *bytecode;

    /* Some flags. */
    Parrot_UInt2 implFlags;
    Parrot_UInt2 flags;
};


/* This structure describes a .NET field. */
struct dotnet_field {
    /* Pointer to the class PMC the field belongs to. */
    PMC *parent;

    /* Name and signature blob position. */
    STRING *str_name;
    Parrot_UInt4 signature;

    /* Flags. */
    Parrot_UInt2 flags;
};


/* This structure describes a .NET member reference. */
struct dotnet_memberref {
    /* Name and signature blob position. */
    STRING *str_name;
    Parrot_UInt4 signature;

    /* Class (which could be a method def or many other things) */
    Parrot_UInt4 class_type;
    Parrot_UInt4 class_id;
};


/* This structure describes a .NET parameter. */
struct dotnet_param {
    /* Pointer to the method PMC the parameter belongs to. */
    PMC *parent;

    /* Name. */
    STRING *str_name;

    /* Flags and sequence number. */
    Parrot_UInt2 flags;
    Parrot_UInt2 sequence;
};


/* This structure describes a chunk of .NET bytecode. */
struct dotnet_bytecode {
    /* Pointer to the method PMC the field belongs to. */
    PMC *parent;

    /* Locals signature blob position. */
    Parrot_UInt4 locals_signature;

    /* Method body and it's size. */
    char *body;
    Parrot_UInt4 body_size;

    /* Bytecode walking data. */
    Parrot_UInt4 cur_pos;

    /* Init locals flag. */
    Parrot_UInt2 init_locals_flag;

    /* Array of DotNetEH (Exception Handlers). */
    PMC *eh;
};


/* This structure describes a .NET exception handler. */
struct dotnet_eh {
    /* Pointer to the method PMC the handler belongs to. */
    PMC *parent;

    /* Try block offset and length. */
    Parrot_UInt4 try_offset;
    Parrot_UInt4 try_length;

    /* Handler block offset and length. */
    Parrot_UInt4 handler_offset;
    Parrot_UInt4 handler_length;

    /* Flags and stuff specific to certain handler types. */
    Parrot_UInt4 flags;
    Parrot_UInt4 class_type;
    Parrot_UInt4 class_id;
    Parrot_UInt4 filter_offset;
};


/* This structure describes a .NET signature. */
struct dotnet_signature {
    /* Stream of bytes that makes up the signature and its length. */
    char *data;
    int data_size;

    /* Current position we're at while walking the sig. */
    int cur_pos;
};


/* This structure describes a reference to a type in another file. */
struct dotnet_typeref {
    /* Position in heaps for name and namespace. */
    STRING *str_name;
    STRING *str_namespace;

    /* Resolution scope (basically, what module do we find the type in). */
    Parrot_UInt4 resolution_scope;
};


/* Enums and structure relating to the managed pointer PMC. */
/* Some enumerations. */
typedef enum dotnet_managed_ptr_type {
    PTR_TYPE_REGISTER,
    PTR_TYPE_FIELD,
    PTR_TYPE_ELEMENT,
    PTR_TYPE_PMC
} Dotnet_Ptr_Type;
typedef enum dotnet_managed_ptr_reg_type {
    PTR_REGTYPE_I,
    PTR_REGTYPE_N,
    PTR_REGTYPE_S,
    PTR_REGTYPE_P
} Dotnet_Reg_Type;

/* Register info. */
struct reg_info {
    Dotnet_Reg_Type reg_type;
    int number;
};

/* Underlying struct for the PMC. */
struct dotnet_managed_ptr
{
    Dotnet_Ptr_Type type;
    union {
        PMC* pmc;              /* For arrays, fields and PMCs. */
        parrot_context_t *ctx; /* For registers. */
    };
    union {
        int index;             /* For arrays. */
        STRING *name;          /* For field name. */
        struct reg_info r;     /* For registers. */
    };
};


/* Int64 and UInt64 PMC underlying structs. */
struct dotnet_int64
{
    __int64 x;
};

struct dotnet_uint64
{
    unsigned __int64 x;
};
