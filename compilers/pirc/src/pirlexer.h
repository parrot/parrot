#ifndef PARROT_PIRC_PIRLEXER_H_GUARD
#define PARROT_PIRC_PIRLEXER_H_GUARD

typedef enum tokens {
    T_GLOBAL,                           /* "global"                   */
    T_GOTO,                             /* "goto",                    */
    T_IF,                               /* "if",                      */
    T_INT,                              /* "int",                     */
    T_N_OPERATORS,                      /* "n_operators",             */
    T_NULL,                             /* "null",                    */
    T_NUM,                              /* "num",                     */
    T_PMC,                              /* "pmc",                     */
    T_STRING,                           /* "string",                  */
    T_UNLESS,                           /* "unless",                  */
                                        /* NULL,                      */
    T_ARG,                              /* ".arg",                    */
    T_CONST,                            /* ".const",                  */
    T_CONSTANT,                         /* ".constant",               */
    T_EMIT,                             /* ".emit",                   */
    T_END,                              /* ".end",                    */
    T_ENDNAMESPACE,                     /* ".endnamespace",           */
    T_ENDM,                             /* ".endm",                   */
    T_EOM,                              /* ".eom",                    */
    T_GET_RESULTS,                      /* ".get_results",            */
    T_GLOBAL_DECL,                      /* ".global",                 */
    T_GLOBALCONST,                      /* ".globalconst",            */
    T_HLL,                              /* ".HLL",                    */
    T_HLL_MAP,                          /* ".HLL_map",                */
    T_INCLUDE,                          /* ".include",                */
    T_INVOCANT,                         /* ".invocant",               */
    T_LEX,                              /* ".lex",                    */
    T_LOADLIB,                          /* ".loadlib",                */
    T_LOCAL,                            /* ".local",                  */
    T_MACRO,                            /* ".macro",                  */
    T_METH_CALL,                        /* ".meth_call",              */
    T_NAMESPACE,                        /* ".namespace",              */
    T_NCI_CALL,                         /* ".nci_call",               */
    T_PARAM,                            /* ".param",                  */
    T_PCC_BEGIN,                        /* ".pcc_begin",              */
    T_PCC_BEGIN_RETURN,                 /* ".pcc_begin_return",       */
    T_PCC_BEGIN_YIELD,                  /* ".pcc_begin_yield",        */
    T_PCC_CALL,                         /* ".pcc_call",               */
    T_PCC_END,                          /* ".pcc_end",                */
    T_PCC_END_RETURN,                   /* ".pcc_end_return",         */
    T_PCC_END_YIELD,                    /* ".pcc_end_yield",          */
    T_PCC_SUB,                          /* ".pcc_sub",                */
    T_PRAGMA,                           /* ".pragma",                 */
    T_RESULT,                           /* ".result",                 */
    T_RETURN,                           /* ".return",                 */
    T_SUB,                              /* ".sub",                    */
    T_SYM,                              /* ".sym",                    */
    T_YIELD,                            /* ".yield",                  */
                                        /* NULL,                      */
    T_ANON_FLAG,                        /* ":anon",                   */
    T_IMMEDIATE_FLAG,                   /* ":immediate",              */
    T_INIT_FLAG,                        /* ":init",                   */
    T_LEX_FLAG,                         /* ":lex",                    */
    T_LOAD_FLAG,                        /* ":load",                   */
    T_MAIN_FLAG,                        /* ":main",                   */
    T_METHOD_FLAG,                      /* ":method",                 */
    T_MULTI_FLAG,                       /* ":multi",                  */
    T_OUTER_FLAG,                       /* ":outer",                  */
    T_POSTCOMP_FLAG,                    /* ":postcomp",               */
    T_VTABLE_FLAG,                      /* ":vtable",                 */
    T_NAMED_FLAG,                       /* ":named",                  */
    T_OPT_FLAG_FLAG,                    /* ":opt_flag",               */
    T_OPTIONAL_FLAG,                    /* ":optional",               */
    T_SLURPY_FLAG,                      /* ":slurpy",                 */
    T_FLAT_FLAG,                        /* ":flat",                   */
    T_UNIQUE_REG_FLAG,                  /* ":unique_reg",             */
                                        /*   NULL,                    */
    T_PLUS,                             /* "+",                       */
    T_MINUS,                            /* "-",                       */
    T_DIVIDE,                           /* "/",                       */
    T_FDIVIDE,                          /* "//",                      */
    T_MODULO,                           /* "%",                       */
    T_MULTIPLY,                         /* "*",                       */
    T_CONCAT,                           /* ".",                       */
    T_DOTDOT,                           /* "..",                      */
    T_NOT,                              /* "!",                       */
    T_BAND,                             /* "&",                       */
    T_AND,                              /* "&&",                      */
    T_BOR,                              /* "|",                       */
    T_OR,                               /* "||",                      */
    T_BXOR,                             /* "~",                       */
    T_XOR,                              /* "~~",                      */
    T_RSHIFT,                           /* ">>",                      */
    T_LSHIFT,                           /* "<<",                      */
    T_LOG_RSHIFT,                       /* ">>>",                     */
    T_GT,                               /* ">",                       */
    T_LT,                               /* "<",                       */
    T_GE,                               /* ">=",                      */
    T_LE,                               /* "<=",                      */
    T_EQ,                               /* "==",                      */
    T_NE,                               /* "!=",                      */
    T_ARROW,                            /* "=>",                      */
    T_PTR,                              /* "->",                      */
    T_COMMA,                            /* ",",                       */
    T_SEMICOLON,                        /* ";",                       */
    T_LPAREN,                           /* "(",                       */
    T_RPAREN,                           /* ")",                       */
    T_LBRACKET,                         /* "[",                       */
    T_RBRACKET,                         /* "]",                       */
    T_EOF,                              /* "end of file",             */
    T_NOT_FOUND,                        /* "not found",               */
    T_PASM_PREG,                        /* "PASM PREG",               */
    T_PASM_NREG,                        /* "PASM NREG",               */
    T_PASM_IREG,                        /* "PASM_IREG",               */
    T_PASM_SREG,                        /* "PASM_SREG",               */
    T_PREG,                             /* "PREG",                    */
    T_SREG,                             /* "SREG",                    */
    T_NREG,                             /* "NREG",                    */
    T_IREG,                             /* "IREG",                    */
    T_MACRO_IDENT,                      /* "macro identifier",        */
    T_MACRO_LABEL,                      /* "macro label",             */
    T_TYPE,                             /* "type specifier",          */
    T_IDENTIFIER,                       /* "'identifier'",            */
    T_INTEGER_CONSTANT,                 /* "int constant",            */
    T_NUMBER_CONSTANT,                  /* "num constant",            */
    T_LABEL,                            /* "label identifier",        */
    T_NEWLINE,                          /* "'\\n'",                   */
    T_ASSIGN,                           /* "=",                       */
    T_STRING_CONSTANT,                  /* "string constant",         */
    T_LITERAL,                          /* "'literal'",               */
    T_INVOCANT_IDENT,                   /* "invocant id",             */
    T_ERROR,                            /* "'error'",                 */
    T_POWER,                            /* "**",                      */
    T_POWER_ASSIGN,                     /* "**=",                     */
    T_MULTIPLY_ASSIGN,                  /* "*=",                      */
    T_PLUS_ASSIGN,                      /* "+=",                      */
    T_MINUS_ASSIGN,                     /* "-=",                      */
    T_CONCAT_ASSIGN,                    /* ".="                       */
    T_DIVIDE_ASSIGN,                    /* "/=",                      */
    T_FDIVIDE_ASSIGN,                   /* "//=",                     */
    T_MODULO_ASSIGN,                    /* "%=",                      */
    T_BXOR_ASSIGN,                      /* "~=",                      */
    T_BAND_ASSIGN,                      /* "&=",                      */
    T_BOR_ASSIGN,                       /* "|=",                      */
    T_RSHIFT_ASSIGN,                    /* ">>=",                     */
    T_LOG_RSHIFT_ASSIGN,                /* ">>>=",                    */
    T_LSHIFT_ASSIGN,                    /* "<<=",                     */
    T_HEREDOC_ID,                       /* "heredoc id",              */
    T_HEREDOC_STRING,                   /* "heredoc string",          */
    T_PARROT_OP,                        /* "parrot op",               */
    T_UNICODE,                          /* "unicode:",                */
    T_ASCII,                            /* "ascii:",                  */
    T_BINARY,                           /* "binary:",                 */
    T_ISO_8859_1                        /* "iso-8859-1:"              */
    /* NULL                                                           */
} token;

/* Make sure MAX_TOKEN is the last enum value from enum token {} */
#  define MAX_TOKEN T_PARROT_OP


/* pirlexer API */

/* predeclare; hide internals in pirlexer.c */
struct lexer_state;

/* create a new lexer and read the specified file */
extern struct lexer_state *new_lexer(char const * filename);

/* free all resources allocated for the lexer */
extern void destroy_lexer(struct lexer_state *lexer);

/* request the next token of lexer s */
extern token next_token(struct lexer_state *s);

/* include the file specified in the lexer's current token so that the
 * next token read is from that file
 */
extern void open_include_file(struct lexer_state *lexer);

/* close the included file and clean up its resources */
extern void close_include_file(struct lexer_state *lexer);

/* get the characters of the current token */
extern char * const get_current_token(struct lexer_state const *s);

/* print some text from the buffer in the neighbourhood of the current token */
extern void print_error_context(struct lexer_state *s);

/* get the current line number */
extern long get_current_line(struct lexer_state *s);

/* get the current line position */
extern unsigned short get_current_linepos(struct lexer_state *s);

/* get current file position */
extern long get_current_filepos(struct lexer_state *s);

/* get the name of the current file being scanned */
extern char * const get_current_file(struct lexer_state *s);

/* read a heredoc 'token': everything up to and including the heredoc label */
extern token read_heredoc(struct lexer_state *lexer, char *heredoc_label);

/* read a macro body */
extern token read_macro(struct lexer_state *lexer);

/* get the spelling of a keyword */
extern char const * find_keyword(token t);

#endif /* PARROT_PIRC_PIRLEXER_H_GUARD */

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */
