/*

=head1 NAME

pirlexer.c - lexical analysis for Parrot Intermediate Representation

=head1 THOUGHTS FOR LATER

=over 4

=item *

Implement dictionary as hashtable, which will be MUCH faster

=item *

Optimize small functions (using #define to inline) and optimize by 'smarter'
implementation (where appropiate). I'm doing a lot of stuff in read_char(),
which might slow down things.

=item *

TODO: implement POD parsing

=item *

TODO: read input files a few blocks a time, instead of the whole file at once.
This is to prevent failure when compiling 100M files.

=item *

Place and remove checks for EOF where appropiate, they are scattered throughout
the code. Clean that up.

=item *

Check for 'correct' use of data types (unsigned etc.) (should characters be stored
in C<char>s or C<int>s?

=back

=cut

*/
#include "pirlexer.h"
#include "pirutil.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <ctype.h>
#include <string.h>
#include <assert.h>


/* end of file marker. Just use "EOF" (defined as -1) */
#define EOF_MARKER          -1
/* number of characters being displayed in syntax errors */
#define ERROR_CONTEXT_SIZE  30
/* max. token length is 128 for now. */
#define MAX_ID_LENGTH       128

/*

=head1 KEYWORDS


dictionary contains *all* keywords, directives, flags and
other (descriptions of) tokens that are recognized by the
lexer.

  global    goto
  if        n_operators
  int       null
  num       pmc
  string    unless


=head1 DIRECTIVES

The following are PIR directives.

  .arg               .const      .constant    .emit             .end
  .endnamespace      .endm       .eom         .get_results      .global
  .globalconst       .HLL        .HLL_map     .include          .invocant
  .lex               .loadlib    .local       .macro            .meth_call
  .namespace         .nci_call   .param       .pcc_begin        .pcc_begin_return
  .pcc_begin_yield   .pcc_call   .pcc_end     .pcc_end_return   .pcc_end_yield
  .pcc_sub           .pragma     .result      .return           .sub
  .sym               .yield


=head1 FLAGS

The following are flags for subroutines:

  :anon     :immediate   :init        :lex         :load        :main
  :method   :multi       :outer       :postcomp    :vtable      :named

The following are flags for parameters/arguments.

  :opt_flag
  :optional
  :slurpy
  :flat
  :unique_reg


=head1 STRING ENCODINGS

The following are string encoding specifiers:

  ascii:
  binary:
  iso-8859-1:
  unicode:

=cut


Note w.r.t. dictionary:

Make sure that the spelling can /only/ be a single word if it is a keyword
(or directive etc.). If it is a description, make sure the word cannot occurr
as such, for instance, by using an embedded space.

*/
static char const * dictionary[] = {
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
   /* NULL,  */                 /*                          */
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
    ":method",                  /* T_METHOD_FLAG            */
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
    "string constant",          /* T_STRING_CONSTANT,       */
    "'literal'",                /* T_LITERAL,               */
    "invocant id",              /* T_INVOCANT_IDENT,        */
    "'error'",                  /* T_ERROR,                 */
    "**",                       /* T_POWER,                 */
    "**=",                      /* T_POWER_ASSIGN,          */
    "*=",                       /* T_MULTIPLY_ASSIGN,       */
    "+=",                       /* T_PLUS_ASSIGN,           */
    "-=",                       /* T_MINUS_ASSIGN,          */
    ".=",                       /* T_CONCAT_ASSIGN          */
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
    "unicode:",                 /* T_UNICODE                */
    "ascii:",                   /* T_ASCII                  */
    "binary:",                  /* T_BINARY                 */
    "iso-8859-1:",              /* T_ISO_8859_1             */
    NULL                        /*                          */
};




/*

=head2 file_buffer structure

Structure that represents a file. Its layout is shown below. First, it contains the filename
of the file that is represented by this buffer. Then, the buffer is an array that holds the
complete file contents. This is done for efficiency (instead of reading character by character
from disk). The C<curchar> acts like a cursor, that points to the current character.
The field C<filesize> contains the size of the file counted in bytes, C<line> keeps track of
the current line number, and C<linepos> counts the number of characters since the last newline
character. The field C<lastchar> stores the previous character (so the character I<before> the
character pointed to by C<curchar>. This field is used to decide whether the previous character
was a newline. If so, then C<curchar> is at the start of a line (needed for Heredoc delimiters).

The field C<prevbuffer> points to another file_buffer; if the current file was C<.include>d,
then C<prevbuffer> points to the file_buffer that represents the including file. An example:

 $ cat main.pir

 .include "util.pir"

 .sub main
 # ...
 .end

 $ cat util.pir

 .sub foo
 # ...
 .end

In this case, when parsing the file C<main.pir>, C<prevbuffer> is NULL, because this file was
not included. Then, when the file C<util.pir> is included, a new file_buffer is created for that
file, and C<prevbuffer> is set to the file_buffer representing C<main.pir>.

The file_buffer structure is shown below:

 typedef struct file_buffer {
     char     *filename;              -- the name of this file
     char     *buffer;                -- buffer holding contents of this file
     char     *curchar;               -- pointer to the current char.
     unsigned  filesize;              -- size of this file in bytes
     unsigned  long line;             -- line number
     unsigned  short linepos;         -- position on the current line
     char      lastchar;              -- the previous character that was read.
     struct file_buffer *prevbuffer;  -- pointer to 'including' file if any

 } file_buffer;

=cut

*/
typedef struct file_buffer {
    char     *filename;
    char     *buffer;
    char     *curchar;
    unsigned  filesize;
    unsigned  long line;
    unsigned  short linepos;
    char      lastchar;
    struct file_buffer *prevbuffer;

} file_buffer;

/*

=head2 lexer_state structure

Structure representing the lexer. It holds a pointer to
the current file being read, a buffer holding the current
token, and a pointer to add characters to the token buffer.

 typedef struct lexer_state {
     struct file_buffer *curfile;    -- pointer to the current file
     char *token_chars;              -- characters of the current token
     char *charptr;                  -- used for adding/removing token chars

 } lexer_state;

=cut

*/
typedef struct lexer_state {
    struct file_buffer *curfile;
    char *token_chars;
    char *charptr;

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
    assert((t >= 0) && (t <= MAX_TOKEN));
    return dictionary[t];
}

/*

=item get_current_token()

return a constant pointer to the current token buffer

=cut

*/
char * const
get_current_token(lexer_state const *s) {
    assert(s->token_chars);
    return s->token_chars;
}

/*

=item get_current_file()

return a constant pointer to the current file name

=cut

*/
char * const
get_current_file(struct lexer_state *s) {
    assert(s->curfile->filename);
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

=item get_current_linepos()

Returns the current line position (i.o.w., how many characters
have been read on the current line?)

=cut

*/
unsigned short
get_current_linepos(struct lexer_state *s) {
    return s->curfile->linepos;
}

/*

=item get_current_filepos()

Returns the number of charactars read in the current file so far.

=cut

*/
long
get_current_filepos(struct lexer_state *s) {
    return (s->curfile->curchar - s->curfile->buffer);
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
    /* print context of max. size ERROR_CONTEXT_SIZE */
    int read_chars     = s->curfile->curchar - s->curfile->buffer; /* get no. of read chars. */
    int context_length = (read_chars > ERROR_CONTEXT_SIZE) ? ERROR_CONTEXT_SIZE : read_chars;
    char *start        = s->curfile->curchar - context_length;
    char *end          = s->curfile->curchar;

    /* print all characters from start to end */
    while (start < end ) {
        /* print tab characters as spaces to make the "^" indicator fit nicely */
        if (*start == '\t') fprintf(stderr, " ");
        else fprintf(stderr, "%c", *start);
        ++start;
    }
    /* print an indicator like "^" on the next line */
    fprintf(stderr, "\n%*s\n", s->curfile->linepos, "^");
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
    /* put c into *lexer->charptr and increment the pointer */
    *lexer->charptr++ = c;
}


/*

=item read_char()

Return the next character from the buffer.
It's a good idea to check for "c == EOF_MARKER" after each call.

=cut

*/
static char
read_char(file_buffer *buf) {
    char c = *buf->curchar;

    /* store previous character, but only if not at first character of file */
    if (buf->curchar > buf->buffer) buf->lastchar = *(buf->curchar - 1);
    else buf->lastchar = '\n'; /* makes the check for prev. char. at start of file successful */

    buf->curchar++;  /* update pointer to current char. */
    buf->linepos++; /* update the token position */

    return c;
}

/*

=item unread_char()

Push back the last read character.

=cut

*/
static void
unread_char(file_buffer *buf) {
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
    fprintf(stderr, "token buffer: [%s]\n", lexer->token_chars);
    /*
    fprintf(stderr, "Rest of buffer of file '%s'\n", lexer->curfile->filename);
    fprintf(stderr, "[%s]", lexer->curfile->curchar);
    */
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

=item read_file()

Allocate a new file_buffer structure, allocate
memory for the file's contents and read all contents
into this buffer. The file_buffer structure is returned.

=cut

*/
static file_buffer *
read_file(char const * filename) {
    FILE *fileptr         = NULL;
    file_buffer *filebuff = NULL;
    struct stat filestatus;


    assert(filename != NULL);

    filebuff = (file_buffer *)malloc(sizeof(file_buffer));

    if (filebuff == NULL) {
        fprintf(stderr, "Error in read_file(): failed to allocate memory for file buffer\n");
        exit(1);
    }

    filebuff->filename = clone_string(filename);
    /*fprintf(stderr, "Opening file '%s'\n", filebuff->filename); */

    fileptr = open_file(filename, "r");

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
    buf->buffer = NULL; /* good programming practice :-) */
    free(buf);
    buf = NULL;
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
    newfile->prevbuffer  = lexer->curfile;
    lexer->curfile       = newfile;
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
    while (word) {
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
    file_buffer *tmp = NULL;

    assert(lexer->curfile->prevbuffer != NULL);
    /* destroy this buffer, set 'buf' to its previous buffer */
    tmp            = lexer->curfile;
    lexer->curfile = lexer->curfile->prevbuffer;
    destroy_buffer(tmp);
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
    char c    = read_char(lexer->curfile);

    while ( isdigit(c) ) {
        buffer_char(lexer, c);
        c = read_char(lexer->curfile);
        count++;
    }
    unread_char(lexer->curfile); /* no digit, put it back */
    return count;
}

/*

=item update_line()

Updates the line number in the lexer, and resets
the line position pointer.

=cut

*/
static void
update_line(lexer_state *lexer) {
    ++lexer->curfile->line;
    lexer->curfile->linepos = 0; /* start of newline */

}


/*

=item read_string()

Read a quoted string.

=cut

*/
static token
read_string(lexer_state *lexer, char delimiter) {
    char c;
    buffer_char(lexer, delimiter); /* buffer first delimiter */
    do {
        c = read_char(lexer->curfile);
        if (c == '\n') {
            fprintf(stderr, "Possibly a run-away string on line %ld\n", lexer->curfile->line);
            buffer_char(lexer, delimiter); /* try to fix it */
            update_line(lexer);
            return T_ERROR;
        }
        if (c == EOF_MARKER) return T_EOF;
        buffer_char(lexer, c);
    }
    while (c != delimiter);

    return T_STRING_CONSTANT;
}



/*

=back

=head1 LEXER API

=over 4

=item read_heredoc()

Reads heredoc text up to the specified heredoc label.
Returns either T_HEREDOC_STRING if successful, or T_EOF (if encountered).
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
                unread_char(lexer->curfile); /* we read 1 char too many; put back last read character */
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

    lexer->token_chars = (char *)calloc(MAX_ID_LENGTH, sizeof(char));
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
        tmp = NULL;
    }
    free(lexer->token_chars);
    lexer->token_chars = NULL;
    free(lexer);
    lexer = NULL;
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
    assert((filename[0] == '"' && filename[len - 1] == '"')
           || (filename[0] == '\'' && filename[len -1] == '\''));

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
    assert(lexer->curfile->prevbuffer);
    switch_buffer(lexer);
}



/*

=item next_token()

Reads a token from the current file buffer.

=back

=head1 LEXICAL SPECIFICATION

=cut

*/
token
next_token(lexer_state *lexer) {
    int ok    = 1;
    int count = 0;

    /* before reading a new token, first clear the buffer */
    clear_buffer(lexer);

    while (ok) {
        char c; /* holds the "current" character */

        /* read the first character of the next token */
        c = read_char(lexer->curfile);

        if (c == EOF_MARKER) return T_EOF;
        /* skip spaces but not newlines.
         * read the next character and continue
         */
        if (isspace(c) && (c != '\n')) continue;

        /* skip pod */

        /* FIX PARSING OF POD; kinda hard :-( */




/*

=pod

=head2 Comments

Comments start with the pound sign ('#') and continue up to the end of the line.

POD comments are not yet supported.

=cut

*/
        /* skip comments */
        if (c == '#') {
            /* eat comments up to but not including newline */
            do {
                c = read_char(lexer->curfile);
                if (c == EOF_MARKER) return T_EOF;
            }
            while (c != '\n');

            unread_char(lexer->curfile);
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

  IDENT           -> [a-zA-Z_][a-zA-Z_0-9]*

  LABEL           -> IDENT ':'

  INVOCANT-IDENT  -> IDENT '.'

  PARROT-OP       -> IDENT

  MACRO-IDENT     -> '.' IDENT

  MACRO-LABEL     -> '$' IDENT ':'

  PIR-REGISTER    -> '$' PASM-REG

  HEREDOC-IDENT   -> << STRINGC

  STRING-CONSTANT -> ' <characters> ' | " <characters> "

  INT-CONSTANT    -> [-] DIGIT+ | 0 [xX] DIGIT+ | 0 [bB] DIGIT+

  NUM-CONSTANT    -> [-] DIGIT+ '.' DIGIT*

  DIGIT           -> [0-9]


=cut

*/

        if (isalpha(c) || c == '_' ) {  /* check for identifier, op, invocant or label */

            /* handle pasm registers */
            if (c == 'P' || c == 'I' || c == 'N' || c == 'S') {
                int count;
                char regtype = c; /* store register type for later */
                buffer_char(lexer, c); /* store current char. */
                count = read_digits(lexer); /* read digits and count how many */
                c = read_char(lexer->curfile); /* the last one was not a digit, re-read it */

                /* only if the current char is not an alpha and we just read a number of digits,
                 * can this be a pasm register. */
                if (count > 0 && !isalpha(c)) {
                    if (c != '.') {
                        /* last char was not a dot, so this is not an invocant */
                        unread_char(lexer->curfile);
                        /* check for the register type */
                        if (regtype == 'P') return T_PREG;
                        if (regtype == 'N') return T_NREG;
                        if (regtype == 'S') return T_SREG;
                        if (regtype == 'I') return T_IREG;
                    }
                    else {
                        return T_INVOCANT; /* like 'P.' */
                    }
                }
                /* else it is not a pasm register and not a single letter invocant */
            }

            /* it was not a pasm register or a single-letter invocant */

            while (isalnum(c) || c == '_') {
                buffer_char(lexer, c);
                c = read_char(lexer->curfile);
                if (c == EOF_MARKER) break;
            }

            /* we got some kind of an identifier, maybe it's a label, invocant, etc */
            if (c == ':') { /* label -> IDENT':' */
                token tmp;
                buffer_char(lexer, c);

                /* it might be a string encoding specifier */
                tmp = check_dictionary(lexer, dictionary);

                if (tmp == T_NOT_FOUND) return T_LABEL;
                else {
                    c = read_char(lexer->curfile); /* this should be a quote char. */
                    return read_string(lexer, c);
                }
            }
            else if (c == '.') { /* invocant_id -> IDENT'.' */
                return T_INVOCANT_IDENT;
            }
            else { /* not a label or invocant put the last read char. back */
                token tmp;

                unread_char(lexer->curfile);

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
            if (c == '=') return T_CONCAT_ASSIGN;
            if (c == '.') return T_DOTDOT;  /* ".." */

            if ( isspace(c) ) { /* a dot followed by a space */
                unread_char(lexer->curfile);
                return T_CONCAT;
            }

            while ( isalnum(c) || c == '_') {
                buffer_char(lexer, c);
                c = read_char(lexer->curfile);
                if (c == EOF_MARKER) break;
            }
            unread_char(lexer->curfile);
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
            c = read_char(lexer->curfile);

            while (isdigit(c)) {
                buffer_char(lexer, c);
                c = read_char(lexer->curfile);
            }

            /* it is a different char, either '.', ' ' or something else */
            if (c == '.') { /* floating point number */
                buffer_char(lexer, c);
                read_digits(lexer);
                return T_NUMBER_CONSTANT;
            }
            else if (c == 'b' || c == 'B') { /* 0b<digit>+ or 0B<digit>+ */
                buffer_char(lexer, c);
                read_digits(lexer);
                return T_INTEGER_CONSTANT;
            }
            else if (c == 'x' || c == 'X') { /* 0x<digit>+ or 0X<digit>+ */
                buffer_char(lexer, c);
                read_digits(lexer);
                return T_INTEGER_CONSTANT;
            }
            else { /* 1 digit */
                unread_char(lexer->curfile);
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

            switch (c) {
                case 'P': regtype = T_PREG; break;
                case 'N': regtype = T_NREG; break;
                case 'S': regtype = T_SREG; break;
                case 'I': regtype = T_IREG; break;
                default: /* macro label -> '$' IDENT ':' */
                    c = read_char(lexer->curfile);
                    if (c == EOF_MARKER) return T_EOF;

                    while (isalnum(c) || c == '_') { /* this is all part of the label name */
                        buffer_char(lexer, c);
                        c = read_char(lexer->curfile);
                        if (c == EOF_MARKER) return T_EOF;
                    }

                    /* now c is no alnum */
                    if (c == ':') {
                        return T_MACRO_LABEL;
                    }
                    else { /* $ ??? unexpected, put it back */
                        unread_char(lexer->curfile);
                        fprintf(stderr, "Unknown token starting with '$'\n");
                        return T_ERROR;
                    }
            }
            /* store the register letter */
            buffer_char(lexer, c);

            numdigits = read_digits(lexer);

            /* read next char, maybe a dot? */
            c = read_char(lexer->curfile);

            if (numdigits == 0) {
                unread_char(lexer->curfile);
                fprintf(stderr, "digits expected (line %d)\n", lexer->curfile->line);
                return T_ERROR;
            }

            if (c == '.') { /* $P0. and friends */
                buffer_char(lexer, c);
                return T_INVOCANT_IDENT;
            }
            else { /* just a simple pir reg $P0 */
                unread_char(lexer->curfile);
                return regtype; /* return register */
            }
        }


        /* check for single special tokens */

/*

=pod

=head2 Special tokens

  ( ) [ ] , ;

=cut

*/
        switch (c) {
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

    **=   *=    %=   /=   //=   +=   -=  .=  >>=  >>>=   <<=  &=   |=   ~=

=head3 Conditional operators

    <    >   ==   <=   >=  !=

=head3 Miscellaneous operators

    ->   =>   ..

=cut

*/

        /* check for possible multi-character special tokens */
        if (c == '*') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '*': return T_POWER;        /* *= */
                case '=': return T_POWER_ASSIGN; /* **= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile);
                    return T_MULTIPLY;           /* * */
            }
        }
        else if (c == '%') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '=': return T_MODULO_ASSIGN; /* %= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile);
                    return T_MODULO;              /* % */
            }
        }
        else if (c == '/') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '/':
                    c = read_char(lexer->curfile);
                    if (c == '=') {
                        return T_FDIVIDE_ASSIGN; /* //= */
                    }
                    else {
                        unread_char(lexer->curfile);
                        return T_FDIVIDE;
                    }
                    break;
                case '=': return T_DIVIDE_ASSIGN; /* /= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile);
                    return T_DIVIDE;              /* / */
            }
        }
        else if (c == '+') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '=': return T_PLUS_ASSIGN; /* += */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile);
                    return T_PLUS;              /* + */
            }
        }
        else if (c == '-') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '>': return T_PTR;         /* -> */
                case '=': return T_MINUS_ASSIGN; /* -= */
                case EOF_MARKER: return T_EOF;
                default:

                    /* TODO: refactor this number reading code, it's also somewhere else */

                    if (isdigit(c)) { /* handle negative numbers here */
                        int count = read_digits(lexer);
                        c = read_char(lexer->curfile);
                        if (c == '.') {
                            buffer_char(lexer, c);
                            read_digits(lexer);
                            return T_NUMBER_CONSTANT;
                        }
                        else {
                            unread_char(lexer->curfile);
                            return T_INTEGER_CONSTANT;
                        }
                    }
                    else { /* no negative number, just a minus sign */
                        unread_char(lexer->curfile);
                        return T_MINUS;
                    }
            }
        }
        else if (c == '!') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '=': return T_NE;              /* != */
                case EOF_MARKER: return T_EOF;
                default:                            /* ! */
                    unread_char(lexer->curfile);
                    return T_NOT;
            }
        }
        else if (c == '=') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '>': return T_ARROW;          /* => */
                case '=': return T_EQ;             /* == */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile);
                    return T_ASSIGN;               /* = */
            }
        }
        else if (c == '>') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '>':
                    c = read_char(lexer->curfile);
                    if (c == '>') { /* >>> */
                        c = read_char(lexer->curfile);
                        if (c == '=') { /* >>>= */
                            return T_LOG_RSHIFT_ASSIGN;
                        }
                        else { /* >>> */
                            unread_char(lexer->curfile);
                            return T_LOG_RSHIFT;
                        }
                    }
                    else if (c == '=') { /* >>= */
                        return T_RSHIFT_ASSIGN;
                    }
                    else { /* >> */
                        unread_char(lexer->curfile);
                        return T_RSHIFT;
                    }
                case '=': return T_GE; /* >= */
                case EOF_MARKER: return T_EOF;
                default:  /* > */
                    unread_char(lexer->curfile);
                    return T_GT;
            }
        }
        else if (c == '<') {
            c = read_char(lexer->curfile);
            switch (c) {
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
                            unread_char(lexer->curfile);
                            return T_LSHIFT;
                        }
                    }
                    break;
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile);
                    return T_LT;
            }
        }
        else if (c == '~') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '~': return T_XOR;             /* ~~ */
                case '=': return T_BXOR_ASSIGN;     /* ~= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile); /* ~ */
                    return T_BXOR;
            }
        }
        else if (c == '&') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '&': return T_AND;             /* && */
                case '=': return T_BAND_ASSIGN;     /* &= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile); /* & */
                    return T_BAND;
            }
        }
        else if (c == '|') {
            c = read_char(lexer->curfile);
            switch (c) {
                case '|': return T_OR;              /* || */
                case '=': return T_BOR_ASSIGN;      /* |= */
                case EOF_MARKER: return T_EOF;
                default:
                    unread_char(lexer->curfile); /* | */
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
            while (isspace(c));

            /* the last read char. was not space/newline, put it back */
            unread_char(lexer->curfile);

            return T_NEWLINE;
        }
        else if (c == '"') {
            return read_string(lexer, c);
        }
        else if (c == '\'') {
            return read_string(lexer, c);
        }
        else if (c == ':') { /* read flags */
            token tmp;

            do {
                buffer_char(lexer, c);
                c = read_char(lexer->curfile);
                if (c == EOF_MARKER) return T_EOF;
            }
            while ( isalnum(c) || c == '_' );

            unread_char(lexer->curfile); /* push back last character not needed */
            tmp = check_dictionary(lexer, dictionary);

            /* if not found, then no valid flag found */
            if (tmp == T_NOT_FOUND) {
                fprintf(stderr, "invalid flag: '%s'\n", lexer->token_chars);
                return T_ERROR;
            }
            else return tmp;
        }
        else if (c == 0) { /* this is necessary since svn properties on input files */
            return T_EOF;
        }
        else {

            fprintf(stderr, "BUG IN LEXER: Unknown character: '%c' (ascii: %d) "
                            "at character position %d.\n", c, (int)c,
                            get_current_filepos(lexer));
            fprintf(stderr, "Was parsing file: '%s'\n", lexer->curfile->filename);
            if (lexer->curfile->curchar >= lexer->curfile->buffer+lexer->curfile->filesize) {
                printf("FATAL: end of file passed!\n");
            }
            exit(1);
        }
    }

    /* it is impossible to come here, but just keep the compiler happy: */
    return T_ERROR;

}

/*
 * Local variables:
 *   c-file-style: "parrot"
 * End:
 * vim: expandtab shiftwidth=4:
 */

