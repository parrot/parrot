#! perl -w

use Parrot::Test tests => 20;
use Test::More;

$/=undef; # slurp mode

sub setup
{
	my $name = @_ ? shift : "temp.file";
	my $content = @_ ? shift : "This is a test\n";

	open(FILE, ">$name") or die "Failed to create $name";
        binmode FILE;
	print FILE $content;
	close(FILE);

	unlink("does_not_exist") if -e "does_not_exist";
}

sub teardown
{
	my $name = @_ ? shift : "temp.file";

	unlink($name) if -e $name;
	die "Failed to delete $name"if -e $name;
}

my $main = <<'CODE';
#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *the_test(Parrot_Interp, opcode_t *, opcode_t *);

int main(int argc, char* argv[])
{
    Parrot_Interp interpreter = Parrot_new(NULL);
    if (!interpreter) {
        return 1;
    }
    Parrot_init(interpreter);

    Parrot_run_native(interpreter, the_test);

    Parrot_exit(0);
    return 0;
}

CODE

###############################################################################

c_output_is($main . <<'CODE', <<'OUTPUT', "hello world");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    PIO_printf(interpreter, "Hello, World!\n");

    return NULL;
}
CODE
Hello, World!
OUTPUT

###############################################################################

c_output_is($main . <<'CODE', <<'OUTPUT', "write");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    PMC *io;
    char *p;

    io = PIO_STDOUT(interpreter);
    PIO_write(interpreter, io, "Hello, World!\n", 14);

    io = PIO_open(interpreter, NULL, "temp.file", ">");
    for (p="Hello, World!\n"; *p; p++) {
        PIO_write (interpreter, io, p, 1);
    }
    PIO_close(interpreter, io);

    return NULL;
}
CODE
Hello, World!
OUTPUT

open FILE, "temp.file";
is(<FILE>, <<DATA, 'file content');
Hello, World!
DATA
close FILE;

###############################################################################

c_output_is($main . <<'CODE', <<'OUTPUT', 'read');
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    PMC *io;
    char buf[1024];
    INTVAL len;

    io = PIO_open(interpreter, NULL, "temp.file", "<");
    len = PIO_read(interpreter, io, buf, sizeof(buf)-1);
    PIO_close(interpreter, io);

    buf[len < 0 ? 0 : len] = '\0';
    PIO_printf(interpreter, "%s", buf);

    io = PIO_open(interpreter, NULL, "temp.file", "<");
    /* this is for testing buffers, not for performance */
    PIO_setbuf(interpreter, io, 4);

    do {
        len = PIO_read(interpreter, io, buf, 3);
        buf[len] = '\0';
	/* dont write trailing spaces */
        PIO_printf(interpreter, "%d: %s\n", len, len ? buf : "EOF");
    } while (len > 0);

    return NULL;
}
CODE
Hello, World!
3: Hel
3: lo,
3:  Wo
3: rld
2: !

0: EOF
OUTPUT

###############################################################################

c_output_is($main . <<'CODE', '', 'append');
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    PMC *io;

    io = PIO_open(interpreter, NULL, "temp.file", ">>");
    PIO_write(interpreter, io, "Parrot flies.\n", 14);
    PIO_close(interpreter, io);

    return NULL;
}
CODE

open FILE, "temp.file";
is(<FILE>, <<'DATA', 'file content');
Hello, World!
Parrot flies.
DATA
close FILE;

###############################################################################

c_output_is($main . <<'CODE', <<'OUTPUT', 'readline');
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    PMC *io;
    INTVAL len;
    char buf[1024];

    io = PIO_open(interpreter, NULL, "temp.file", "<");
    PIO_setlinebuf(interpreter, io);

    do {
        len = PIO_read(interpreter, io, buf, sizeof(buf)-1);
        buf[len < 0 ? 0 : len] = '\0';
        PIO_printf(interpreter, "%d: %s", len, len ? buf : "EOF");
    } while (len > 0);

    PIO_printf(interpreter, "\n");

    return NULL;
}
CODE
14: Hello, World!
14: Parrot flies.
0: EOF
OUTPUT

###############################################################################

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_parse_open_flags");
#include "../io/io_private.h"

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    char *flags[] = {"<", ">", ">>", "+<", "+>",
		     "", ";-)", "<<<<<<<<<", "+", "<-:"};
    INTVAL expected[] = {PIO_F_READ,
			 (PIO_F_WRITE | PIO_F_TRUNC),
			 (PIO_F_WRITE | PIO_F_APPEND),
			 (PIO_F_WRITE | PIO_F_READ),
			 (PIO_F_WRITE | PIO_F_READ | PIO_F_TRUNC),
			 0, 0, 0, 0, 0};
    INTVAL got;
    int i;

    for (i = 0; i < 10; i++) {
	got = PIO_parse_open_flags(flags[i]);

	if ( got != expected[i] ) {
	    PIO_printf(interpreter,
		       "\"%s\" should have parsed to %i not %i\n",
		       flags[i], expected[i], got);
	}
    }

    PIO_printf(interpreter, "done\n");

    return NULL;
}
CODE
done
OUTPUT

###############################################################################

setup();

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_open");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    char *file[] = {"", "temp.file", "does_not_exist"};
    char *flags[] = {"<", ">", ">>", "+<", "+>", "", ";-)"};
    int expected[][7] = {
    	{0, 0, 0, 0, 0, 0, 0},
    	{1, 1, 1, 1, 1, 0, 0},
    	{0, 1, 1, 1, 1, 0, 0},
    };
    PMC *io;
    int i, j;

    for (i = 0; i < 3; i++) {
	for (j = 0; j < 7; j++) {
	    io = PIO_open(interpreter, NULL, file[i], flags[j]);

	    if ( (PIO_eof(interpreter, io) ? 0:1) != expected[i][j] ) {
		PIO_printf(interpreter,
			   "\"%s\" \"%s\" should%s have opened\n",
			   file[i], flags[j], expected[i][j] ? "" : " not");
	    }
	}
    }

    PIO_printf(interpreter, "done\n");

    return NULL;
}
CODE
done
OUTPUT

teardown();

###############################################################################

setup("temp.file", "This is a test.");

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_read");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    int len[] = {0, 9, 5, 100};
    char *str[] = {"", "This is a", " test", "."};
    int i, n;
    PMC *io;
    char *buffer;

    io = PIO_open(interpreter, NULL, "temp.file", "<");

    if ( PIO_eof(interpreter, io) ) {
	PIO_printf(interpreter, "PIO_open failed\n");
	return NULL;
    }

    for (i = 0; i < 4; i++) {
        /* alloc enough space including '\0' */
        buffer = malloc((len[i] + 1) * sizeof(char));

        n = PIO_read(interpreter, io, buffer, len[i]);
        buffer[n] = '\0';

        if ( n != strlen(str[i]) ) {
            PIO_printf(interpreter,
		       "read: %i expected: %i\n", n, strlen(str[i]));
        }

        if ( strcmp(buffer, str[i]) ) {
            PIO_printf(interpreter,
		       "should have read \"%s\" not \"%s\"", str[i], buffer);
        }

        /* buffer no longer needed */
        free(buffer);
    }

    PIO_printf(interpreter, "done\n");

    return NULL;
}
CODE
done
OUTPUT

teardown();

###############################################################################

setup("temp.file", ("x" x 65533) . "yz");

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_read larger file");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    PMC *io;
    char *buffer;

    io = PIO_open(interpreter, NULL, "temp.file", "<");

    if ( !io ) {
	PIO_printf(interpreter, "PIO_open failed\n");
	return NULL;
    }

    buffer = malloc(65536 * sizeof(char));
    buffer[65535] = '\0';
    printf("%i\n", PIO_read(interpreter, io, buffer, 65535));
    printf("%s\n", &buffer[65532]);

    return NULL;
}
CODE
65535
xyz
OUTPUT

teardown();

###############################################################################

setup("temp.file", ("x" x 65536) . "yz");

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_read larger chunk when the buffer is not-empty");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    PMC *io;
    char *buffer;

    io = PIO_open(interpreter, NULL, "temp.file", "<");

    if ( !io ) {
	PIO_printf(interpreter, "PIO_open failed\n");
	return NULL;
    }

    buffer = malloc(65536 * sizeof(char));
    buffer[65535] = '\0';
    PIO_read(interpreter, io, buffer, 3);
    printf("%i\n", PIO_read(interpreter, io, buffer, 65535));
    printf("%s\n", &buffer[65532]);

    return NULL;
}
CODE
65535
xyz
OUTPUT

teardown();

###############################################################################

setup("temp.file", "words\n" x 10000);

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_tell: read larger chunk when the buffer is not-empty");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    PMC *io;
    char *buf;

    io = PIO_open(interpreter, NULL, "temp.file", "<");

    if ( !io ) {
	PIO_printf(interpreter, "PIO_open failed\n");
	return NULL;
    }

    buf = malloc(65536 * sizeof(char));

    printf("%d\n", (int)PIO_tell(interpreter, io));
    PIO_read(interpreter, io, buf, 6);
    printf("%d\n", (int)PIO_tell(interpreter, io));
    PIO_read(interpreter, io, buf, 65535);
    printf("%d\n", (int)PIO_tell(interpreter, io));

    return NULL;
}
CODE
0
6
60000
OUTPUT

teardown();

###############################################################################

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_write");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    PMC *io;

    io = PIO_open(interpreter, NULL, "temp.file", ">");

    if ( !io ) {
	PIO_printf(interpreter, "PIO_open failed\n");
	return NULL;
    }

    PIO_printf(interpreter,
	       "%i\n", PIO_write(interpreter, io, "This is a test\n", 15));

    return NULL;
}
CODE
15
OUTPUT

###############################################################################
# PIO_unix_close and PIO_win32_close return NULL.

setup();

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_close");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    PMC *io;

    io = PIO_open(interpreter, NULL, "temp.file", "<");

    if ( !io ) {
	PIO_printf(interpreter, "PIO_open failed\n");
	return NULL;
    }

    PIO_printf(interpreter, "%i\n", PIO_close(interpreter, io));

    return NULL;
}
CODE
0
OUTPUT

teardown;

###############################################################################

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_make_offset");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    INTVAL intval[] = {0, 1, -1, 100, -100};
    PIOOFF_T expected[] = {0, 1, -1, 100, -100};
    PIOOFF_T offset;
    int i;

    for (i = 0; i < 5; i++) {
        offset = PIO_make_offset(intval[i]);

	if ( offset != expected[i] ) {
            PIO_printf(interpreter,
		       "offset for %i should have been %i not %i\n",
		       intval[i], (int)expected[i], (int)offset);
        }
    }

    PIO_printf(interpreter, "done\n");

    return NULL;
}
CODE
done
OUTPUT

###############################################################################

setup("temp.file", "abcdefg");

c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_seek");
#include "../io/io_private.h"

static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    INTVAL fixture[][3] = {
	{1, SEEK_SET},
	{2, SEEK_CUR},
	{-2, SEEK_CUR},
	{-3, SEEK_END}
    };
    PMC *io;
    char *buffer;
    int i;
    int got;

    io = PIO_open(interpreter, NULL, "temp.file", "<");

    if ( !io ) {
        PIO_printf(interpreter, "PIO_open failed\n");
        return NULL;
    }

    for (i = 0; i < 4; i++) {
        got = PIO_seek(interpreter, io,
                       PIO_make_offset(fixture[i][0]), fixture[i][1]);

        if ( got >= 0 ) {
            buffer = malloc(2 * sizeof(char));
            buffer[1] = '\0';
            PIO_read(interpreter, io, buffer, 1);
            PIO_printf(interpreter, "%s", buffer);
            free(buffer);
        }
        else {
            PIO_printf(interpreter,
		       "seek %i %i failed\n", fixture[i][0], fixture[i][1]);
        }
    }

    PIO_printf(interpreter, "\ndone\n");

    return NULL;
}
CODE
bede
done
OUTPUT

teardown();

###############################################################################

SKIP: {
    skip ("fdopen does not handle illegal modes correct", 1);
c_output_is($main . <<'CODE', <<'OUTPUT', "PIO_fdopen");
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    char *flags[] = {"<", ">", ">>", "+<", "+>", "", ";-)"};
    int expected[] = {1, 1, 1, 1, 1, 0, 0};
    int i;
    PMC *iostdout;
    PIOHANDLE fd;
    PMC *io;

    for (i = 0; i < 7; i++)
    {
        iostdout = PIO_STDOUT(interpreter);
        fd = PIO_getfd(interpreter, iostdout);
        io = PIO_fdopen(interpreter, NULL, fd, flags[i]);

        if ( ( io != NULL ) != expected[i] )
        {
            PIO_printf(interpreter,
		       "stdout should%s have opened with \"%s\" flags\n",
		       expected[i] ? "" : " not", flags[i]);
        }
    }

    PIO_printf(interpreter, "done\n");

    return NULL;
}
CODE
done
OUTPUT
}

###############################################################################

c_output_is($main . <<'CODE', <<'OUTPUT', 'stdio-layer');
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	 opcode_t *cur_op, opcode_t *start)
{
    extern ParrotIOLayer pio_stdio_layer;

    PMC *io;

    io = PIO_fdopen(interpreter, &pio_stdio_layer, (PIOHANDLE)stdout, ">");
    PIO_puts(interpreter, io, "Hello, World\n");
    PIO_flush(interpreter, io);

    return NULL;
}
CODE
Hello, World
OUTPUT

###############################################################################

setup("temp.file", "Hello World!");

c_output_is($main . <<'CODE', <<'OUTPUT', 'peek');
static opcode_t*
the_test(struct Parrot_Interp *interpreter,
	opcode_t *cur_op, opcode_t *start)
{
    ParrotIO *io;
    char peekbuf[1024], readbuf[1024];
    UINTVAL len;

    io = PIO_open(interpreter, NULL, "temp.file", "<");

    do {
      len = PIO_peek(interpreter, io, peekbuf);
      peekbuf[len] = '\0';

      len = PIO_read(interpreter, io, readbuf, 1);
      readbuf[len] = '\0';

      PIO_printf(interpreter, "peek = '%s', read = '%s'\n", peekbuf, readbuf);
    } while (len > 0);


    PIO_close(interpreter, io);

    return NULL;
}
CODE
peek = 'H', read = 'H'
peek = 'e', read = 'e'
peek = 'l', read = 'l'
peek = 'l', read = 'l'
peek = 'o', read = 'o'
peek = ' ', read = ' '
peek = 'W', read = 'W'
peek = 'o', read = 'o'
peek = 'r', read = 'r'
peek = 'l', read = 'l'
peek = 'd', read = 'd'
peek = '!', read = '!'
peek = '', read = ''
OUTPUT

teardown("temp.file");
