#ifndef __PIRLEXER_H
#define __PIRLEXER_H

typedef enum tokens {
        T_GOTO,
        T_IF,
        T_INT,
        T_N_OPERATORS,
        T_NULL,
        T_NUM,
        T_PMC,
        T_STRING,
        T_UNLESS,

        T_ARG,
        T_CONST,
        T_CONSTANT,
        T_EMIT,
        T_END,
        T_ENDNAMESPACE,
        T_ENDM,
        T_EOM,
        T_GET_RESULTS,
        T_GLOBAL,
        T_GLOBALCONST,
        T_HLL,
        T_HLL_MAP,
        T_INCLUDE,
        T_INVOCANT,
        T_LEX,
        T_LOADLIB,
        T_LOCAL,
        T_MACRO,
        T_METH_CALL,
        T_NAMESPACE,
        T_NCI_CALL,
        T_PARAM,
        T_PCC_BEGIN,
        T_PCC_BEGIN_RETURN,
        T_PCC_BEGIN_YIELD,
        T_PCC_CALL,
        T_PCC_END,
        T_PCC_END_RETURN,
        T_PCC_END_YIELD,
        T_PCC_SUB,
        T_PRAGMA,
        T_RESULT,
        T_RETURN,
        T_SUB,
        T_SYM,
        T_YIELD,

        T_ANON_FLAG,
        T_IMMEDIATE_FLAG,
        T_INIT_FLAG,
        T_LEX_FLAG,
        T_LOAD_FLAG,
        T_MAIN_FLAG,
        T_MULTI_FLAG,
        T_OUTER_FLAG,
        T_POSTCOMP_FLAG,
        T_VTABLE_FLAG,
        T_NAMED_FLAG,
        T_OPT_FLAG_FLAG,
        T_OPTIONAL_FLAG,
        T_SLURPY_FLAG,
        T_FLAT_FLAG,
        T_UNIQUE_REG_FLAG,

        T_PLUS,
        T_MINUS,
        T_DIVIDE,
        T_MODULO,
        T_MULTIPLY,
        T_CONCAT,
        T_DOTDOT,
        T_BAND,
        T_AND,
        T_BOR,
        T_OR,
        T_XOR,
        T_HUH,
        T_RSHIFT,
        T_LSHIFT,
        T_RRSHIFT,
        T_GT,
        T_LT,
        T_GE,
        T_LE,
        T_EQ,
        T_NE,
        T_ARROW,
        T_PTR,
        T_COMMA,
        T_SEMICOLON,
        T_LPAREN,
        T_RPAREN,
        T_LBRACKET,
        T_RBRACKET,
        T_EOF,
        T_NOT_FOUND,
        T_PASM_PREG,
        T_PASM_NREG,
        T_PASM_IREG,
        T_PASM_SREG,
        T_PREG,
        T_SREG,
        T_NREG,
        T_IREG,
        T_MACRO_IDENT,
        T_MACRO_LABEL,
        T_TYPE,
        T_IDENTIFIER,
        T_INTEGER_CONSTANT,
        T_NUMBER_CONSTANT,
        T_LABEL,
        T_NEWLINE,
        T_ASSIGN,
        T_DOUBLE_QUOTED_STRING,
        T_SINGLE_QUOTED_STRING,
        T_LITERAL,
        T_INVOCANT_IDENT,
        T_NUMBER,
        T_ERROR,
        T_POWER,
        T_POWER_ASSIGN,
        T_MULTIPLY_ASSIGN,
        T_PLUS_ASSIGN,
        T_MINUS_ASSIGN,
        T_REGISTER,
        T_DIVIDE_ASSIGN,
        T_MODULO_ASSIGN,
        T_BAND_ASSIGN,
        T_BOR_ASSIGN,
        T_RRSHIFT_ASSIGN,
        T_RSHIFT_ASSIGN,
        T_HEREDOC_ID,
        T_HEREDOC_STRING,
        T_PARROT_OP

} token;

/* Make sure MAX_TOKEN is the last enum value from enum token {} */
#define MAX_TOKEN T_PARROT_OP


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
extern char * const get_current_token(struct lexer_state *s);

/* print some text from the buffer in the neighbourhood of the current token */
extern void print_error_context(struct lexer_state *s);

/* get the current line number */
extern long get_current_line(struct lexer_state *s);

/* get the name of the current file being scanned */
extern char * const get_current_file(struct lexer_state *s);

/* clone the specified string; *do* free the allocated memory yourself */
extern char *clone_string(char const * src);

/* read a heredoc 'token': everything up to and including the heredoc label */
extern token read_heredoc(struct lexer_state *lexer, char *heredoc_label);

/* read a macro body */
extern token read_macro(struct lexer_state *lexer);

/* get the spelling of a keyword */
extern char const * find_keyword(token t);

#endif

