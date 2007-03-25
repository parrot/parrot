/*

=head1 NAME

pirlexer.c - lexical analysis for Parrot Intermediate Representation

=cut

*/
#include "pirlexer.h"
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>
#include <sys/stat.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>



#define EOF_MARKER         '\0' /* marker is put at end of file buffer to indicate end of file */
#define ERROR_CONTEXT_SIZE  30  /* number of characters being displayed in syntax errors */


/*

=head1 KEYWORDS


dictionary contains *all* keywords, directives, flags and
other (descriptions of) tokens that are recognized by the
lexer.

XXX NOTE:
The several 'groups' of words (will be) are separated by NULL
entries; this way, we can later optimize the search, by
just looking in a particular subsection ("while the iterator
is not null"), so you don't have to look into a section
that is not of interest. (not implemented right now)

 goto
 if
 int
 n_operators
 null
 num
 pmc
 string
 unless


=head1 DIRECTIVES

The following are PIR directives.

XXX TODO

=head1 FLAGS

The following are flags for subroutines and parameters/arguments.

=cut

*/
char const * dictionary[] = {
    "global",                   /* T_GLOBAL,                */
    "goto",                     /* T_GOTO,                  */
    "if",                       /* T_IF,                    */
    "int",                      /* T_INT,                   */
    "n_operators",              /* T_N_OPERATORS            */
    "null",                     /* T_NULL                   */
    "num",                      /* T_NUM                    */
    "pmc",                      /* T_PMC                    */
    "string",                   /* T_STRING                 */
    "unless",                   /* T_UNLESS                 */
   /* NULL,  */                 /* make sure we stop looking after normal keywords */
    ".arg",                     /* T_ARG                    */
    ".const",                   /* T_CONST,                 */
    ".constant",                /* T_CONSTANT,              */
    ".emit",                    /* T_EMIT,                  */
    ".end",                     /* T_END,                   */
    ".endnamespace",            /* T_ENDNAMESPACE,          */
    ".endm",                    /* T_ENDM,                  */
    ".eom",                     /* T_EOM,                   */
    ".get_results",             /* T_GET_RESULTS            */
    ".global",                  /* T_GLOBAL_DECL,           */
    ".globalconst",             /* T_GLOBALCONST            */
    ".HLL",                     /* T_HLL                    */
    ".HLL_map",                 /* T_HLL_MAP                */
    ".include",                 /* T_INCLUDE,               */
    ".invocant",                /* T_INVOCANT               */
    ".lex",                     /* T_LEX,                   */
    ".loadlib",                 /* T_LOADLIB                */
    ".local",                   /* T_LOCAL,                 */
    ".macro",                   /* T_MACRO,                 */
    ".meth_call",               /* T_METH_CALL              */
    ".namespace",               /* T_NAMESPACE,             */
    ".nci_call",                /* T_NCI_CALL               */
    ".param",                   /* T_PARAM,                 */
    ".pcc_begin",               /* T_PCC_BEGIN              */
    ".pcc_begin_return",        /* T_PCC_BEGIN_RETURN       */
    ".pcc_begin_yield",         /* T_PCC_BEGIN_YIELD        */
    ".pcc_call",                /* T_PCC_CALL               */
    ".pcc_end",                 /* T_PCC_END                */
    ".pcc_end_return",          /* T_PCC_END_RETURN         */
    ".pcc_end_yield",           /* T_PCC_END_YIELD          */
    ".pcc_sub",                 /* T_PCC_SUB                */
    ".pragma",                  /* T_PRAGMA                 */
    ".result",                  /* T_RESULT,                */
    ".return",                  /* T_RETURN,                */
    ".sub",                     /* T_SUB,                   */
    ".sym",                     /* T_SYM,                   */
    ".yield",                   /* T_YIELD                  */
   /* NULL,  */                 /* flags                    */
    ":anon",                    /* T_ANON_FLAG              */
    ":immediate",               /* T_IMMEDIATE_FLAG         */
    ":init",                    /* T_INIT_FLAG              */
    ":lex",                     /* T_LEX_FLAG               */
    ":load",                    /* T_LOAD_FLAG              */
    ":main",                    /* T_MAIN_FLAG              */
    ":multi",                   /* T_MULTI_FLAG             */
    ":outer",                   /* T_OUTER_FLAG             */
    ":postcomp",                /* T_POSTCOMP_FLAG          */
    ":vtable",                  /* T_VTABLE_FLAG            */
    ":named",                   /* T_NAMED_FLAG             */
    ":opt_flag",                /* T_OPT_FLAG_FLAG          */
    ":optional",                /* T_OPTIONAL_FLAG          */
    ":slurpy",                  /* T_SLURPY_FLAG            */
    ":flat",                    /* T_FLAT_FLAG              */
    ":unique_reg",              /* T_UNIQUE_REG_FLAG        */
   /* NULL,  */                 /* operators and misc.      */
    "+",                        /* T_PLUS,                  */
    "-",                        /* T_MINUS,                 */
    "/",                        /* T_DIVIDE,                */
    "//",                       /* T_FDIVIDE,               */
    "%",                        /* T_MODULO,                */
    "*",                        /* T_MULTIPLY,              */
    ".",                        /* T_CONCAT,                */
    "..",                       /* T_DOTDOT,                */
    "!",                        /* T_NOT                    */
    "&",                        /* T_BAND,                  */
    "&&",                       /* T_AND,                   */
    "|",                        /* T_BOR,                   */
    "||",                       /* T_OR,                    */
    "~",                        /* T_BXOR,                  */
    "~~",                       /* T_XOR,                   */
    ">>",                       /* T_RSHIFT,                */
    "<<",                       /* T_LSHIFT,                */
    ">>>",                      /* T_LOG_RSHIFT,            */
    ">",                        /* T_GT,                    */
    "<",                        /* T_LT,                    */
    ">=",                       /* T_GE,                    */
    "<=",                       /* T_LE,                    */
    "==",                       /* T_EQ,                    */
    "!=",                       /* T_NE,                    */
    "=>",                       /* T_ARROW,                 */
    "->",                       /* T_PTR,                   */
    ",",                        /* T_COMMA,                 */
    ";",                        /* T_SEMICOLON,             */
    "(",                        /* T_LPAREN,                */
    ")",                        /* T_RPAREN,                */
    "[",                        /* T_LBRACKET               */
    "]",                        /* T_RBRACKET               */
    "end of file",              /* T_EOF                    */
    "not found",                /* T_NOT_FOUND              */
    "PASM PREG",                /* T_PASM_PREG              */
    "PASM NREG",                /* T_PASM_NREG              */
    "PASM_IREG",                /* T_PASM_IREG,             */
    "PASM_SREG",                /* T_PASM_SREG,             */
    "PREG",                     /* T_PREG,                  */
    "SREG",                     /* T_SREG,                  */
    "NREG",                     /* T_NREG,                  */
    "IREG",                     /* T_IREG,                  */
    "macro identifier",         /* T_MACRO_IDENT,           */
    "macro label",              /* T_MACRO_LABEL,           */
    "type specifier",           /* T_TYPE,                  */
    "'identifier'",             /* T_IDENTIFIER,            */
    "int constant",             /* T_INTEGER_CONSTANT,      */
    "num constant",             /* T_NUMBER_CONSTANT,       */
    "label identifier",         /* T_LABEL,                 */
    "'\\n'",                    /* T_NEWLINE,               */
    "=",                        /* T_ASSIGN,                */
    "\"string\"",               /* T_DOUBLE_QUOTED_STRING,  */
    "'string'",                 /* T_SINGLE_QUOTED_STRING,  */
    "'literal'",                /* T_LITERAL,               */
    "invocant id",              /* T_INVOCANT_IDENT,        */
    "'number'",                 /* T_NUMBER,                */
    "'error'",                  /* T_ERROR,                 */
    "**",                       /* T_POWER,                 */
    "**=",                      /* T_POWER_ASSIGN,          */
    "*=",                       /* T_MULTIPLY_ASSIGN,       */
    "+=",                       /* T_PLUS_ASSIGN,           */
    "-=",                       /* T_MINUS_ASSIGN,          */
    "'register'",               /* T_REGISTER,              */
    "/=",                       /* T_DIVIDE_ASSIGN,         */
    "//=",                      /* T_FDIVIDE_ASSIGN,        */
    "%=",                       /* T_MODULO_ASSIGN,         */
    "~=",                       /* T_BXOR_ASSIGN,           */
    "&=",                       /* T_BAND_ASSIGN,           */
    "|=",                       /* T_BOR_ASSIGN,            */
    ">>=",                      /* T_RSHIFT_ASSIGN,         */
    ">>>=",                     /* T_LOG_RSHIFT_ASSIGN,     */
    "<<=",                      /* T_LSHIFT_ASSIGN,         */
    "heredoc id",               /* T_HEREDOC_ID,            */
    "heredoc string",           /* T_HEREDOC_STRING,        */
    "parrot op",                /* T_PARROT_OP              */
    NULL                        /*                          */
};




/*

=head2 file_buffer structure

Structure that represents a file.
It contains the filename, a buffer for the file contents,
a read pointer, the filesize, the current line number,
and a pointer to the previous buffer. If any, the
prevbuffer points to the structure of the file that
.include'd this file.

=cut

*/
typedef struct file_buffer {
    char *filename;                 /* the name of this file                 */
    char *buffer;                   /* buffer holding contents of this file  */
    char *curchar;                  /* pointer to the current char.          */
    unsigned filesize;              /* size of this file                     */
    unsigned int line;              /* line number                           */
    unsigned short linepos;         /* position on the current line          */
    char lastchar;                  /* the previous character that was read. */
    struct file_buffer *prevbuffer; /* pointer to 'including' file if any    */

} file_buffer;

/*

=head2 lexer_state structure

Structure representing the lexer. It holds a pointer to
the current file being read, a buffer holding the current
token, and a pointer to add characters to the token buffer.

=cut

*/
typedef struct lexer_state {
    struct file_buffer *curfile;    /* pointer to the current file           */
    char *token_chars;              /* characters of the current token       */
    char *charptr;                  /* used for adding/removing token chars  */
    /*Parrot_Interp interp;
    */

} lexer_state;


/*

=head1 ACCESSOR FUNCTIONS

=over 4

=item find_keyword()

Get the spelling of a keyword based on the specified token.

=cut

*/
char const *
find_keyword(token t) {
    if ((t >= 0) && (t <= MAX_TOKEN)) {
        return dictionary[t];
    }
    else {
        fprintf(stderr, "FATAL: invalid token in find_keyword()\n");
        fprintf(stderr, "No entry for token %d\n", t);
        if (t-1 <= MAX_TOKEN) fprintf(stderr, "Previous token: %s\n", dictionary[t - 1]);
        return "ERROR";
    }
}

/*

=item get_current_token()

return a constant pointer to the current token buffer

=cut

*/
char * const
get_current_token(lexer_state *s) {
    return s->token_chars;
}

/*

=item get_current_file()

return a constant pointer to the current file name

=cut

*/
char * const
get_current_file(struct lexer_state *s) {
    return s->curfile->filename;
}

/*

=item get_current_line()

return the current line number

=cut

*/
long
get_current_line(struct lexer_state *s) {
    return s->curfile->line;
}


/*

=item print_error_context()

Print some surrounding text from the file to indicate
where the error occurred. This may make finding the error
easier.

=cut

*/
void
print_error_context(struct lexer_state *s) {
    /* print context of size ERROR_CONTEXT_SIZE */
    int read_chars = s->curfile->curchar - s->curfile->buffer;
    int context_length = read_chars > ERROR_CONTEXT_SIZE ? ERROR_CONTEXT_SIZE : read_chars;
    char *start = s->curfile->curchar - context_length;
    char *end = s->curfile->curchar;

    while (start < end ) {
        fprintf(stderr, "%c", *start++);
    }
    /* print an indicator like "^" */
    fprintf(stderr, "\n%*s\n", s->curfile->linepos - 1, "^");
}


/*

=back

=head1 INTERNAL FUNCTIONS

=over 4

=item buffer_char()

Store a character in the lexer's buffer.

=cut

*/
static void
buffer_char(lexer_state *lexer, char c) {
    *lexer->charptr++ = c;
}

/*

=item read_char()

Return the next character from the buffer.

=cut

*/
static char
read_char(file_buffer *buf) {
    char c = *buf->curchar;

    /* store previous character, but only if not at first character of file */
    if (buf->curchar > buf->buffer) buf->lastchar = *(buf->curchar - 1);
    else buf->lastchar = '\n';

    buf->curchar++;  /* update pointer to current char. */
    buf->linepos++; /* update the token position */

    return c;

}

/*

=item unread_char()

Push back the last read character.
It was never removed from the buffer, so just
decrement the pointer in the buffer.

=cut

*/
static void
unread_char(file_buffer *buf, char c) {
   --buf->curchar;
   --buf->linepos;
}

/*

=item print_buffer()

Debug function to show the rest of the current buffer.
(starting from current character)

=cut

*/
static void
print_buffer(lexer_state *lexer) {
    fprintf(stderr, "Rest of buffer of file '%s'\n", lexer->curfile->filename);
    fprintf(stderr, "[%s]", lexer->curfile->curchar);
}


/*

=item clear_buffer()

Clears the buffer in which the current token
is stored.

=cut

*/
static void
clear_buffer(lexer_state *lexer) {
    while (lexer->charptr >= lexer->token_chars) {
        *lexer->charptr-- = '\0';
    }
    /* decremented once too much; restore it */
    lexer->charptr = lexer->token_chars;
}

/*

=item clone_string()

clone a string. Copy the characters of src into dest
and return dest.

=cut

*/
char *
clone_string(char const * src) {
    int srclen = strlen(src);
    char * dest, *ptr;
    dest = ptr = (char *)calloc(srclen + 1, sizeof(char));
    while(*src) {
        *dest++ = *src++;
    }
    return ptr;
}

/*

=item read_file()

Allocate a new file_buffer structure, allocate
memory for the file's contents and read all contents
into this buffer. The file_buffer structure is returned.

=cut

*/
static file_buffer *
read_file(char const * filename) {
    FILE *fileptr = NULL;
    struct stat filestatus;

    file_buffer *filebuff = (file_buffer *)malloc(sizeof(file_buffer));

    if (filebuff == NULL) {
        fprintf(stderr, "Error in read_file(): failed to allocate memory for file buffer\n");
        exit(1);
    }

    filebuff->filename = clone_string(filename);
    /*fprintf(stderr, "Opening file '%s'\n", filebuff->filename); */

    fileptr = fopen(filename, "r");

    if (fileptr == NULL) {
        fprintf(stderr, "Error in read_file(): failed to open file '%s'\n", filename);
        exit(1);
    }

    /* allocate memory for this file. Reserve 1 more byte to store the EOF marker */
    stat(filename, &filestatus);
    filebuff->filesize = filestatus.st_size;
    /* printf("file size: %ld\n", filebuff->filesize); */

    filebuff->buffer = (char *)calloc(filebuff->filesize + 1, sizeof(char));

    if (filebuff->buffer == NULL) {
        fprintf(stderr, "Error in read_file(): failed to allocate memory for file contents\n");
        exit(1);
    }

    /* initialize other fields */
    filebuff->prevbuffer = NULL;
    filebuff->line = 1;

    /* read file contents into buffer */
    fread(filebuff->buffer, sizeof(char), filebuff->filesize, fileptr);
    fclose(fileptr);

    /* set EOF marker at last position of buffer */
    filebuff->buffer[filebuff->filesize] = EOF_MARKER;
    filebuff->curchar = filebuff->buffer; /* set current char. to start of buffer */

    filebuff->linepos = 0;
    return filebuff;
}

/*

=item destroy_buffer()

Destructor for file_buffer.

=cut

*/
static void
destroy_buffer(file_buffer *buf) {
    free(buf->buffer);
    free(buf);
}



/*

=item do_include_file()

Calls read_file() that returns a file_buffer structure.
This file_buffer's previous buffer is set to the current file_buffer.
The newfile buffer is assigned to the lexer's current file buffer.

=cut

*/
static void
do_include_file(lexer_state *lexer, char const * filename) {
    file_buffer *newfile = read_file(filename);
    newfile->prevbuffer = lexer->curfile;
    lexer->curfile = newfile;
}


/*

=item is_op()

TODO: FIX THIS

Function to check if the specified id is a Parrot op.
Dynamically loaded op libraries need to be considered as well.

=cut

*/
static int
is_op(char *word) {
    if (strcmp(word, "add") == 0) return 1; /* FIX */
    if (strcmp(word, "print") == 0) return 1;
    return 0;
}


/*

=item is_start_of_line()

Checks whether the current pointer in the specified file buffer
is at the beginning of a line.

=cut

*/
static int
is_start_of_line(file_buffer *buf) {
    if (buf->lastchar == '\n') return 1;
    /* start of file: start of line    */
    if (buf->curchar == buf->buffer) return 1;
    return 0; /* all other cases not at start of line */
}


/*

=item check_dictionary()

Checks whether the current token is a member of the specified
dictionary. If it is, the index of the word in the dict. is returned.
If not, T_NOT_FOUND is returned.

=cut

*/
static token
check_dictionary(lexer_state *lexer, char const *dictionary[]) {
    int index = 0;
    char const * word = dictionary[index];
    /* check all words in dictionary; if equal, return its token enum value */
    while(word) {
        if (strcmp(word, lexer->token_chars) == 0) return index;
        word = dictionary[++index];
    }
    return T_NOT_FOUND;
}


/*

=item switch_buffer()

set the current file_buffer to the previous one stored in
the field prevbuffer. The .include'ing file is now continued
to be processed after this.

=cut

*/
static void
switch_buffer(lexer_state *lexer) {
    /* destroy this buffer, set 'buf' to its previous buffer */
    if (lexer->curfile->prevbuffer == NULL) {
        fprintf(stderr, "Error: cannot switch buffers; no more buffers\n");
        exit(1);
    }
    else {
        file_buffer *tmp = lexer->curfile;
        lexer->curfile = lexer->curfile->prevbuffer;
        destroy_buffer(tmp);
        /* printf("switching to buffer '%s'\n", lexer->curfile->filename);
        */
    }
}


/*

=item read_digits()

Helper function to read as many digits into the current token's buffer.
Returns the number of digits read.

=cut

*/
static int
read_digits(lexer_state *lexer) {
    int count = 0;
    char c = read_char(lexer->curfile);
    while ( isdigit(c) ) {
        buffer_char(lexer, c);
        c = read_char(lexer->curfile);
        count++;
    }
    unread_char(lexer->curfile, c); /* no digit, put it back */
    return count;
}

/*

=item update_line()

Updates the line number in the lexer, and adjusts the
error_context pointer, to show a bit of surrounding code
when an error occurs.

=cut

*/
static void
update_line(lexer_state *lexer) {
    ++lexer->curfile->line;
    lexer->curfile->linepos = 0; /* start of newline */

}

/*

=item read_token()

Reads a token from the current file buffer.

=back

=head1 LEXICAL SPECIFICATION

=cut

*/
static token
read_token(lexer_state *lexer) {
    char c;
    int ok = 1;

    /* before reading a new token, first clear the buffer */
    clear_buffer(lexer);

    while (ok) {

        /* read the first character of the next token */
        c = read_char(lexer->curfile);

        if (c == EOF_MARKER) return T_EOF;
        /* skip spaces but not newlines.
         * read the next character and continue
         */
        if (isspace(c) && (c != '\n')) continue;

        /* skip pod */
        /* FIX
        while ((c == '=') && is_start_of_line(lexer->curfile)) {
             c = read_char(lexer->curfile);
        }
        XXX */


        /* skip comments */

/*

=pod

=head2 Comments

Comments start with the pound sign ('#') and continue up to the end of the line.

POD comments are not yet supported.

=cut

*/
        if (c == '#') {
            /* eat comments up to but not including newline */
            do {
                c = read_char(lexer->curfile);
                if (c == EOF_MARKER) return T_EOF;
            }
            while (c != '\n');

            unread_char(lexer->curfile, c);
            continue; /* with main loop */
        }

/*

=pod

=head2 Tokens

Any whitespace in the specification is merely for readability. Significant whitespace
is indicated explicitly.

  PASM-REG        -> PASM-PREG | PASM-SREG | PASM-NREG | PASM-IREG

  PASM-PREG       -> 'P' DIGIT+

  PASM-SREG       -> 'S' DIGIT+

  PASM-NREG       -> 'N' DIGIT+

  PASM-IREG       -> 'I' DIGIT+

=cut

*/
        /* now start checking for real tokens */
        switch(c) {
            case 'P':
                read_digits(lexer);
                return T_PASM_PREG;
            case 'S':
                read_digits(lexer);
                return T_PASM_SREG;
            case 'I':
                read_digits(lexer);
                return T_PASM_IREG;
            case 'N':
                read_digits(lexer);
                return T_PASM_NREG;
            default:
                break; /* continue below */
        }

        /* it was not a PASM register */

/*

=pod

  IDENT           -> [a-zA-Z_][a-zA-Z_0-9]*

  LABEL           -> IDENT ':'

  INVOCANT-IDENT  -> IDENT '.'

  PARROT-OP       -> IDENT

  MACRO-IDENT     -> '.' IDENT

  MACRO-LABEL     -> '$' IDENT ':'

  PIR-REGISTER    -> '$' PASM-REG

  HEREDOC-IDENT   -> << STRINGC

  STRING-CONSTANT -> ' <characters> ' | " <characters> "

  INT-CONSTANT    -> DIGIT+

  NUM-CONSTANT    -> DIGIT+ '.' DIGIT*

  DIGIT           -> [0-9]


=cut

*/
        if (isalpha(c) || c == '_' ) {  /* check for identifier, op, invocant or label */
            do {
                buffer_char(lexer, c);
                c = read_char(lexer->curfile);
                if (c == EOF_MARKER) break;
            }
            while ( isalnum(c) || c == '_');

            if (c == ':') { /* label -> IDENT':' */
                buffer_char(lexer, c);
                return T_LABEL;
            }
            else if (c == '.') { /* invocant_id -> IDENT'.' */
                return T_INVOCANT_IDENT;
            }
            else { /* not a label or invocant put the last read char. back */
                token tmp;

                unread_char(lexer->curfile, c);

                tmp = check_dictionary(lexer, dictionary); /* look up the id */

                /* if not found, then it is an identifier, otherwise return the keyword */
                if (tmp == T_NOT_FOUND) {
                    /*if (is_op(lexer->interp, lexer->token_chars)) return T_PARROT_OP;
                    */
                    if (is_op(lexer->token_chars)) return T_PARROT_OP;
                    else return T_IDENTIFIER;
                }
                else {
                    return tmp;
                }
            }
        }
        else if (c == '.') { /* check for directives or macro id's */
            token tmp;
            buffer_char(lexer, c);

            c = read_char(lexer->curfile);

            if (c == EOF_MARKER) return T_EOF;
            if (c == '.') return T_DOTDOT;  /* ".." */

            if ( isspace(c) ) { /* a dot followed by a space */
                unread_char(lexer->curfile, c);
                return T_CONCAT;
            }

            while ( isalnum(c) || c == '_') {
                buffer_char(lexer, c);
                c = read_char(lexer->curfile);
                if (c == EOF_MARKER) break;
            }
            unread_char(lexer->curfile, c);
            tmp = check_dictionary(lexer, dictionary);

            /* if not found, then it is a macro id */
            if (tmp == T_NOT_FOUND) {
                return T_MACRO_IDENT;
            }
            else {
                return tmp;
            }
        }
        else if (isdigit(c) ) { /* check for numbers */
            buffer_char(lexer, c);
            read_digits(lexer);

            c = read_char(lexer->curfile);
            if (c == '.') { /* floating point number */
                buffer_char(lexer, c);
                read_digits(lexer);
                return T_NUMBER_CONSTANT;
            }
            else {
                unread_char(lexer->curfile, c); /* put back last read char. */
                return T_INTEGER_CONSTANT;
            }
        }
        else if (c == '$') { /* parse PIR register or macro label */
            token regtype;
            int numdigits;

            buffer_char(lexer, c);

            /* read register type */
            c = read_char(lexer->curfile);
            if (c == EOF_MARKER) return T_EOF;

            switch(c) {
                case 'P': regtype = T_PREG; break;
                case 'N': regtype = T_NREG; break;
                case 'S': regtype = T_SREG; break;
                case 'I': regtype = T_IREG; break;
                default: /* macro label -> '$' IDENT ':' */
                    c = read_char(lexer->curfile);
                    if (c == EOF_MARKER) return T_EOF;

                    while (isalnum(c)) { /* this is all part of the label name */
                        buffer_char(lexer, c);
                        c = read_char(lexer->curfile);
                        if (c == EOF_MARKER) return T_EOF;
                    }

                    /* now c is no alnum */
                    if (c == ':') {
                        return T_MACRO_LABEL;
                    }
                    else { /* $ ??? */
                        unread_char(lexer->curfile, c);
                        return T_ERROR;
                    }
            }
            /* store the register letter */
            buffer_char(lexer, c);

            numdigits = read_digits(lexer);
            if (numdigits == 0) {
                fprintf(stderr, "digits expected (line %d)\n", lexer->curfile->line);
                return T_ERROR;
            }
            return regtype; /* return register */
        }


        /* check for single special tokens */

/*

=pod

=head2 Special tokens

  ( ) [ ] , ;

=cut

*/
        switch(c) {
            case '(': buffer_char(lexer, c); return T_LPAREN;
            case ')': buffer_char(lexer, c); return T_RPAREN;
            case '[': buffer_char(lexer, c); return T_LBRACKET;
            case ']': buffer_char(lexer, c); return T_RBRACKET;
            case ',': buffer_char(lexer, c); return T_COMMA;
            case ';': buffer_char(lexer, c); return T_SEMICOLON;
            default:
                break; /* continue below */
        }

/*

=pod

=head2 Operators

Due to PIR's simplicity, there are no different levels of precedence for operators.

=head3 Unary operators

    -   !   ~

=head3 Binary operators

    **  *  %  /  //  +  -  >>  >>>  <<  ~   ~~   &  &&  |  ||  .

=head3 Augmented operators

    **=   *=    %=   /=   //=   +=   -=   >>=  >>>=   <<=  &=   |=   ~=

=head3 Conditional operators

    <    >   ==   <=   >=  !=

=head3 Miscellaneous operators

    ->   =>   ..

=cut

*/

        /* check for possible multi-character special tokens */
        if (c == '*') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '*': return T_POWER;        /* *= */
                case '=': return T_POWER_ASSIGN; /* **= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c);
                    return T_MULTIPLY;           /* * */
            }
        }
        else if (c == '%') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '=': return T_MODULO_ASSIGN; /* %= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c);
                    return T_MODULO;              /* % */
            }
        }
        else if (c == '/') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '/': 
                    c = read_char(lexer->curfile);
                    if (c == '=') {
                        return T_FDIVIDE_ASSIGN; /* //= */
                    }
                    else {
                        unread_char(lexer->curfile, c);
                        return T_FDIVIDE;   
                    }
                    break;
                case '=': return T_DIVIDE_ASSIGN; /* /= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c);
                    return T_DIVIDE;              /* / */
            }
        }
        else if (c == '+') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '=': return T_PLUS_ASSIGN; /* += */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c);
                    return T_PLUS;              /* + */
            }
        }
        else if (c == '-') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '>': return T_PTR;         /* -> */
                case '=': return T_MINUS_ASSIGN; /* -= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c);
                    return T_MINUS;
            }
        }
        else if (c == '!') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '=': return T_NE;              /* != */
                case EOF_MARKER: return T_EOF;
                default:                            /* ! */
                    unread_char(lexer->curfile, c);
                    return T_NOT;
            }
        }
        else if (c == '=') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '>': return T_ARROW;          /* => */
                case '=': return T_EQ;             /* == */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c);
                    return T_ASSIGN;               /* = */
            }
        }
        else if (c == '>') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '>':
                    c = read_char(lexer->curfile);
                    if (c == '>') { /* >>> */
                        c = read_char(lexer->curfile);
                        if (c == '=') { /* >>>= */
                            return T_LOG_RSHIFT_ASSIGN;
                        }
                        else { /* >>> */
                            unread_char(lexer->curfile, c);
                            return T_LOG_RSHIFT;
                        }
                    }
                    else if (c == '=') { /* >>= */
                        return T_RSHIFT_ASSIGN;
                    }
                    else { /* >> */
                        unread_char(lexer->curfile, c);
                        return T_RSHIFT;
                    }
                case '=': return T_GE; /* >= */
                case EOF_MARKER: return T_EOF;
                default:  /* > */
                    unread_char(lexer->curfile, c);
                    return T_GT;
            }
        }
        else if (c == '<') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '=': return T_LE; /* <= */
                case '<': /* <<? */
                    c = read_char(lexer->curfile);

                    if (c == '\'') { /* heredoc like  <<'SOME_ID' */
                        c = read_char(lexer->curfile);
                        while (c != '\'') {
                            buffer_char(lexer, c);
                            c = read_char(lexer->curfile);
                        }
                        return T_HEREDOC_ID;
                    }
                    else { /* no heredoc */
                        if (c == '=') {                 /* <<= */
                            return T_LSHIFT_ASSIGN;   
                        }
                        else {                          /* << */
                            unread_char(lexer->curfile, c);
                            return T_LSHIFT;
                        }
                    }
                    break;
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c);
                    return T_LT;
            }
        }
        else if (c == '~') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '~': return T_XOR;             /* ~~ */
                case '=': return T_BXOR_ASSIGN;     /* ~= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c); /* ~ */
                    return T_BXOR;
            }
        }
        else if (c == '&') {
            c = read_char(lexer->curfile);
            switch(c) {
                case '&': return T_AND;             /* && */
                case '=': return T_BAND_ASSIGN;     /* &= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c); /* & */
                    return T_BAND;
            }
        }
        else if (c == '|') {                        
            c = read_char(lexer->curfile);
            switch(c) {
                case '|': return T_OR;              /* || */
                case '=': return T_BOR_ASSIGN;      /* |= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile, c); /* | */
                    return T_BOR;
            }
        }
        else if (c == '\n') {
            update_line(lexer);

            /* read as much space and newlines as you can */
            do {
                c = read_char(lexer->curfile);
                /* do keep track of line number */
                if (c == '\n') update_line(lexer);
                else if (c == EOF_MARKER) return T_EOF;
            }
            /* while ( c == ' ' || c == '\t' || c == '\n' || c == '\r');  */
            while (isspace(c));

            /* the last read char. was not space/newline, put it back */
            unread_char(lexer->curfile, c);

            return T_NEWLINE;
        }
        else if (c == '"') {
            buffer_char(lexer, c);
            do {
                c = read_char(lexer->curfile);
                if (c == '\n') {
                    fprintf(stderr, "Possibly a run-away string on line %ld\n", lexer->curfile->line);
                    buffer_char(lexer, '"'); /* try to fix it */
                    update_line(lexer);
                    return T_ERROR;
                }
                if (c == EOF_MARKER) return T_EOF;
                buffer_char(lexer, c);
            }
            while (c != '"');

            return T_DOUBLE_QUOTED_STRING;
        }
        else if (c == '\'') {
            buffer_char(lexer, c);
            do {
                c = read_char(lexer->curfile);
                if (c == '\n') {
                    fprintf(stderr, "Possibly a run-away string on line %ld\n", lexer->curfile->line);
                    buffer_char(lexer, '"'); /* try to fix it */
                    update_line(lexer);
                    return T_ERROR;
                }
                if (c == EOF_MARKER) return T_EOF;
                buffer_char(lexer, c);
            }
            while (c != '\'');

            return T_SINGLE_QUOTED_STRING;
        }
        else if (c == ':') { /* read flags */
            token tmp;

            do {
                buffer_char(lexer, c);
                c = read_char(lexer->curfile);
                if (c == EOF_MARKER) return T_EOF;
            }
            while ( isalnum(c) );

            unread_char(lexer->curfile, c); /* push back last character not needed */
            tmp = check_dictionary(lexer, dictionary);

            /* if not found, then no valid flag found */
            if (tmp == T_NOT_FOUND) return T_ERROR;
            else return tmp;
        }
        else {
            fprintf(stderr, "BUG IN LEXER: Unknown character: %c", c);
            fprintf(stderr, "Was parsing file: '%s'\n", lexer->curfile->filename);
            if (lexer->curfile->curchar >= lexer->curfile->buffer+lexer->curfile->filesize) {
                printf("FATAL: end of file passed!\n");
            }
            exit(1);


        }
    }

    fprintf(stderr, "THIS SHOULD NEVER HAPPEN\n");
    return T_ERROR;

}


/*



=head1 LEXER API

=over 4


=item read_heredoc()

Reads heredoc text up to the specified heredoc label.
Returns either T_HEREDOC_STRING if successful, or T_EOF.
The heredoc string is stored in the token buffer.

=cut

*/
token
read_heredoc(lexer_state *lexer, char *heredoc_label) {
    char *heredoc_iter = heredoc_label;
    char c;

    clear_buffer(lexer);
    c = read_char(lexer->curfile);

    /* safe guard; never give a NULL argument! */
    if (heredoc_label == NULL) return 0;

    while (c != EOF_MARKER) { /* never read beyond end of file */

        if (is_start_of_line(lexer->curfile) == 1) {
            /* is this the start of a line ? */

            /* try to match the heredoc label */
            while (c == *heredoc_iter) {
                heredoc_iter++;                 /* next heredoc char. */
                c = read_char(lexer->curfile);  /* next input char. */
                buffer_char(lexer, c);          /* of course store the heredoc */
            }

            /* the loop broke, but why? */
            if (*heredoc_iter == '\0' && isspace(c)) { /* loop broke because heredoc label was fully iterated; success! */
                unread_char(lexer->curfile, c); /* we read 1 char too many; put back last read character */
                return T_HEREDOC_STRING;   /* return success */
            }
        }

        /* not successfully iterated heredoc label, get next char to try next */
        c = read_char(lexer->curfile);

        /* reset for next attempt to match */
        heredoc_iter = heredoc_label;
    }

    /* failure, tried to find the heredoc label, but got EOF first */
    return T_EOF;
}


/*

=item read_macro()

Just skip all tokens until we find ".endm" (or end of file)
Later this can be improved.

=cut

*/
token
read_macro(lexer_state *lexer) {
    token t;
    do {
        t = next_token(lexer);
    }
    while ((t != T_ENDM) && (t != T_EOF));
    return t; /* return either T_ENDM or T_EOF */
}

/*

=item new_lexer()

Constructor for the lexer.

=cut

*/
lexer_state *
new_lexer(char const * filename) {
    lexer_state *lexer = (lexer_state *)malloc(sizeof(lexer_state));
    if (lexer == NULL) {
        fprintf(stderr, "Error in new_lexer(): failed to allocate memory for lexer\n");
        exit(1);
    }

    /* max. token length is 128 for now */
    lexer->token_chars = (char *)calloc(128, sizeof(char));
    lexer->charptr = lexer->token_chars;
    lexer->curfile = NULL;

    /*lexer->interp = Parrot_new(NULL);
    */

    /* read the first file */
    do_include_file(lexer, filename);
    return lexer;
}

/*

=item destroy_lexer()

Destructor for lexer.

=cut

*/
void
destroy_lexer(lexer_state *lexer) {
    /* destroy the buffers */
    file_buffer *buf = lexer->curfile;
    while (buf) {
        file_buffer *tmp = buf; /* store current */
        buf = tmp->prevbuffer; /* get 'prevbuffer' */
        destroy_buffer(tmp);   /* destroy current */
    }
    free(lexer->token_chars);
    free(lexer);
}

/*

=item include_file()

This function takes a quoted string, to be found
the current token, and removes the quotes.
Then the file is included through do_include_file().

=cut

*/
void
open_include_file(lexer_state *lexer) {
    char *filename = lexer->token_chars;
    int len = strlen(filename);

    /* make sure it's a string */
    char firstchar = filename[0];
    char lastchar  = filename[len - 1];
    assert( (firstchar == '"' && lastchar == '"') || (firstchar == '\'' && lastchar == '\''));

    filename[len - 1] = '\0'; /* remove last quote */
    ++filename; /* skip first quote */
    do_include_file(lexer, filename);
}

/*

=item close_file()

Opposite of include_file(), it sets the current file in the lexer
to the 'including' file (found through the 'prevbuffer' pointer).

=cut

*/
void
close_include_file(lexer_state *lexer) {
    if (lexer->curfile->prevbuffer) { /* this was an .include'd file */
        switch_buffer(lexer);
    }
    else { /* no more buffers. */
        fprintf(stderr, "FATAL: attempt to close file '%s' without any open files left\n", lexer->curfile->filename);
    }
}


/*

=item next_token()

Calls read_token() for the next token.

XXX NOTE: There used to be some checks in this function. If this doesn't prove
to be necessary, we can rename read_token() to next_token().

=cut

*/
token
next_token(lexer_state *lexer) {
    token t = read_token(lexer);
    return t;
}

/*

=pod

=back

=cut

*/

/*
int
main(int argc, char **argv)
{
    lexer_state *lexer = new_lexer(argv[1]);

    char c = read_char(lexer->curfile);
    while (c != EOF_MARKER) {
        printf("%c", c);
        c = read_char(lexer->curfile);
    }
    return 0;
}


*/