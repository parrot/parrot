#! perl -w

use Parrot::Test tests => 17;
use Test::More;

$/=undef; # slurp mode

sub setup
{
	my $name = @_ ? shift : "temp.file";
	my $content = @_ ? shift : "This is a test\n";
	
	open(FILE, ">$name") or die "Failed to create $name";
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

###############################################################################

c_output_is(<<'CODE', <<'OUTPUT', "hello world");
#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/io.h>

int
main ()
{
    struct Parrot_Interp *interpreter;

    interpreter = Parrot_new();
    Parrot_init(interpreter);

    PIO_printf(interpreter, "Hello, World!\n");

    return 0;
}
CODE
Hello, World!
OUTPUT

###############################################################################

c_output_is(<<'CODE', <<'OUTPUT', "write");
#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/io.h>

int
main ()
{
    struct Parrot_Interp *interpreter;
    ParrotIO *io;
    char *p;

    interpreter = Parrot_new();
    Parrot_init(interpreter);

    io = PIO_STDOUT(interpreter);
    PIO_write(interpreter, io, "Hello, World!\n", 14);

    io = PIO_open(interpreter, NULL, "temp.file", ">");
    for (p="Hello, World!\n"; *p; p++) {
        PIO_write (interpreter, io, p, 1);
    }
    PIO_close(interpreter, io);

    return 0;
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

c_output_is(<<'CODE', <<'OUTPUT', 'read');
#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/io.h>

int
main ()
{
    struct Parrot_Interp *interpreter;
    ParrotIO *io;
    char buf[1024];
    UINTVAL len;

    interpreter = Parrot_new();
    Parrot_init(interpreter);

    io = PIO_open(interpreter, NULL, "temp.file", "<");
    len = PIO_read(interpreter, io, buf, sizeof(buf)-1);
    PIO_close(interpreter, io);

    buf[len] = '\0';
    PIO_printf(interpreter, "%s", buf);

    io = PIO_open(interpreter, NULL, "temp.file", "<");
    /* this is for testing buffers, not for performance */
    PIO_setbuf(interpreter, io, 4);

    do {
        len = PIO_read(interpreter, io, buf, 3);
        buf[len] = '\0';
        PIO_printf(interpreter, "%d: %s\n", len, buf);
    } while (len > 0);

    return 0;
}
CODE
Hello, World!
3: Hel
3: lo,
3:  Wo
3: rld
2: !

0: 
OUTPUT

###############################################################################

c_output_is(<<'CODE', '', 'append');
#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/io.h>

int
main ()
{
    struct Parrot_Interp *interpreter;
    ParrotIO *io;

    interpreter = Parrot_new();
    Parrot_init(interpreter);

    io = PIO_open(interpreter, NULL, "temp.file", ">>");
    PIO_write(interpreter, io, "Parrot flies.\n", 14);
    PIO_close(interpreter, io);

    return 0;
}
CODE

open FILE, "temp.file";
is(<FILE>, <<'DATA', 'file content');
Hello, World!
Parrot flies.
DATA
close FILE;

###############################################################################

c_output_is(<<'CODE', <<'OUTPUT', 'readline');
#include <parrot/parrot.h>
#include <parrot/embed.h>
#include <parrot/io.h>

int
main ()
{
    struct Parrot_Interp *interpreter;
    ParrotIO *io;
    size_t len;
    char buf[1024];

    interpreter = Parrot_new();
    Parrot_init(interpreter);

    io = PIO_open(interpreter, NULL, "temp.file", "<");
    PIO_setlinebuf(interpreter, io);

    do {
        len = PIO_read(interpreter, io, buf, sizeof(buf)-1);
        buf[len] = '\0';
        PIO_printf(interpreter, "%d: %s", len, buf);
    } while (len > 0);

   PIO_printf(interpreter, "\n");

    return 0;
}
CODE
14: Hello, World!
14: Parrot flies.
0: 
OUTPUT

###############################################################################

c_output_is(<<'CODE', <<'OUTPUT', "PIO_parse_open_flags");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "../io/io_private.h"

int main(int argc, char* argv[]) {
    char *flags[] = {"<", ">", ">>", "+<", "+>", "", ";-)", "<<<<<<<<<", "+", "<-:"};
    INTVAL expected[] = {PIO_F_READ, (PIO_F_WRITE | PIO_F_TRUNC), (PIO_F_WRITE | PIO_F_APPEND), (PIO_F_WRITE | PIO_F_READ), (PIO_F_WRITE | PIO_F_READ | PIO_F_TRUNC), 0, 0, 0, 0, 0};
    INTVAL got;
    int i;
	
	for (i = 0; i < 10; i++)
	{
		got = PIO_parse_open_flags(flags[i]);

		if ( got != expected[i] )
		{
			printf("\"%s\" should have parsed to %i not %i\n", 
				flags[i], expected[i], got);
		}
	}
	
    printf("done\n");

    return 0;
}
CODE
done
OUTPUT

###############################################################################

setup();

c_output_is(<<'CODE', <<'OUTPUT', "PIO_open");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    char *file[] = {"", "temp.file", "does_not_exist"};
    char *flags[] = {"<", ">", ">>", "+<", "+>", "", ";-)"};
    int expected[][7] = {
    	{0, 0, 0, 0, 0, 0, 0},
    	{1, 1, 1, 1, 1, 0, 0},
    	{0, 1, 1, 1, 1, 0, 0},
    };
    Interp* interpreter;
    PMC *io;
    int i, j;
	
    interpreter = Parrot_new();
    
    if ( interpreter == NULL ) return 1;
    
    Parrot_init(interpreter);

	for (i = 0; i < 3; i++)
	{
		for (j = 0; j < 7; j++)
		{
			io = PIO_open(interpreter, NULL, file[i], flags[j]);

			if ( (PIO_eof(interpreter, io) ? 0:1) != expected[i][j] )
			{
				printf("\"%s\" \"%s\" should%s have opened\n", 
					file[i], flags[j], expected[i][j] ? "" : " not");
			}
		}
	}
    
    printf("done\n");

    return 0;
}
CODE
done
OUTPUT

teardown();

###############################################################################

setup("temp.file", "This is a test.");

c_output_is(<<'CODE', <<'OUTPUT', "PIO_read");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    int len[] = {0, 9, 5, 100};
    char *str[] = {"", "This is a", " test", "."};
    int i, n;
    Interp* interpreter;
    PMC *io;
    char *buffer;
    
    interpreter = Parrot_new();
    
    if ( interpreter == NULL ) return 1;
    
    Parrot_init(interpreter);

	io = PIO_open(interpreter, NULL, "temp.file", "<");

	if ( PIO_eof(interpreter, io) )
	{
		printf("PIO_open failed\n");
		return 1;
	}
	
	for (i = 0; i < 4; i++)
	{
        buffer = malloc((len[i] + 1) * sizeof(char));
        buffer[len[i]] = '\0';
        
        /* 
         * What's the expected relationship between 
         * buffer and len[i]?
         */
         
        n = PIO_read(interpreter, io, buffer, len[i]);
        
        if ( n != strlen(str[i]) )
        {
            printf("read: %i expected: %i\n", n, strlen(str[i]));
        }
        
        if ( strcmp(buffer, str[i]) ) 
        {
            printf("should have read \"%s\" not \"%s\"", 
                str[i], buffer);
        }
	}
	
    printf("done\n");

	return 0;
}
CODE
done
OUTPUT

teardown();

###############################################################################

setup("temp.file", ("x" x 65533) . "yz");

c_output_is(<<'CODE', <<'OUTPUT', "PIO_read larger file");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    PMC *io;
    char *buffer;
    
    interpreter = Parrot_new();
    
    if ( interpreter == NULL ) return 1;
    
    Parrot_init(interpreter);

	io = PIO_open(interpreter, NULL, "temp.file", "<");

	if ( !io )
	{
		printf("PIO_open failed\n");
		return 1;
	}
	
	buffer = malloc(65536 * sizeof(char));	
	buffer[65535] = '\0';
	printf("%i\n", PIO_read(interpreter, io, buffer, 65535));
	printf("%s\n", &buffer[65532]);
	
    return 0;
}
CODE
65535
xyz
OUTPUT

teardown();

###############################################################################

c_output_is(<<'CODE', <<'OUTPUT', "PIO_write");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    PMC *io;
    
    interpreter = Parrot_new();
    
    if ( interpreter == NULL ) return 1;
    
    Parrot_init(interpreter);

	io = PIO_open(interpreter, NULL, "temp.file", ">");

	if ( !io )
	{
		printf("PIO_open failed\n");
		return 1;
	}
	
    printf("%i\n", PIO_write(interpreter, io, "This is a test\n", 15));

    return 0;
}
CODE
15
OUTPUT

###############################################################################
# PIO_unix_close and PIO_win32_close return 0.

setup();

c_output_is(<<'CODE', <<'OUTPUT', "PIO_close");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    Interp* interpreter;
    PMC *io;
    
    interpreter = Parrot_new();
    
    if ( interpreter == NULL ) return 1;
    
    Parrot_init(interpreter);

	io = PIO_open(interpreter, NULL, "temp.file", "<");

	if ( !io )
	{
		printf("PIO_open failed\n");
		return 1;
	}

	printf("%i\n", PIO_close(interpreter, io));
	
    return 0;
}
CODE
0
OUTPUT

teardown;

###############################################################################

c_output_is(<<'CODE', <<'OUTPUT', "PIO_make_offset");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    INTVAL intval[] = {0, 1, -1, 100, -100};
    PIOOFF_T expected[] = {0, 1, -1, 100, -100};
    PIOOFF_T offset;
    int i;
    
	for (i = 0; i < 5; i++)
	{
        offset = PIO_make_offset(intval[i]);
	
	    if ( offset != expected[i] )
        {
            printf("offset for %i should have been %i not %i\n", 
                intval[i], (int)expected[i], (int)offset);
        }
    }
    
    printf("done\n");
    
    return 0;
}
CODE
done
OUTPUT

###############################################################################

setup("temp.file", "abcdefg");

c_output_is(<<'CODE', <<'OUTPUT', "PIO_seek");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"
#include "../io/io_private.h"

int main(int argc, char* argv[]) {
	INTVAL fixture[][3] = {
		{1, SEEK_SET},
		{2, SEEK_CUR},
		{-2, SEEK_CUR},
		{-3, SEEK_END}
	};
    Interp* interpreter;
    PMC *io;
    char *buffer;
    int i;
    int got;
    
    interpreter = Parrot_new();
    
    if ( interpreter == NULL ) return 1;
    
    Parrot_init(interpreter);

    io = PIO_open(interpreter, NULL, "temp.file", "<");

    if ( !io )
    {
        printf("PIO_open failed\n");
        return 1;
    }

    for (i = 0; i < 4; i++) {
        got = PIO_seek(interpreter, io, 
                       PIO_make_offset(fixture[i][0]), fixture[i][1]);	
		
        if ( got >= 0 ) {
            buffer = malloc(2 * sizeof(char));
            buffer[1] = '\0';
            PIO_read(interpreter, io, buffer, 1);
            printf("%s", buffer);
            free(buffer);
        }
        else {
            printf("seek %i %i failed\n", fixture[i][0], fixture[i][1]);
        }
    }

    printf("\ndone\n");

    return 0;
}
CODE
bede
done
OUTPUT

teardown();

###############################################################################

SKIP: {
    skip ("fdopen does not handle illegal modes correct", 1);
c_output_is(<<'CODE', <<'OUTPUT', "PIO_fdopen");
#include <stdio.h>
#include "parrot/parrot.h"
#include "parrot/embed.h"

int main(int argc, char* argv[]) {
    char *flags[] = {"<", ">", ">>", "+<", "+>", "", ";-)"};
    int expected[] = {1, 1, 1, 1, 1, 0, 0};
    int i;
    Interp* interpreter;
    PMC *iostdout;
    PIOHANDLE fd;
    PMC *io;
    
    interpreter = Parrot_new();
    
    if ( interpreter == NULL ) return 1;
    
    Parrot_init(interpreter);

    for (i = 0; i < 7; i++)
    {
        iostdout = PIO_STDOUT(interpreter);
        fd = PIO_getfd(interpreter, iostdout);
        io = PIO_fdopen(interpreter, NULL, fd, flags[i]);
    
        if ( ( io != NULL ) != expected[i] )
        {
            printf("stdout should%s have opened with \"%s\" flags\n", 
                expected[i] ? "" : " not", flags[i]);
        }
	}
	
    printf("done\n");

    return 0;
}
CODE
done
OUTPUT
}

###############################################################################

c_output_is(<<'CODE', <<'OUTPUT', 'stdio-layer');
#include "parrot/parrot.h"

extern ParrotIOLayer pio_stdio_layer;

int main()
{
    Interp *interpreter;
    PMC *io;

    interpreter = Parrot_new();
    
    if ( interpreter == NULL ) return 1;
    
    Parrot_init(interpreter);

    io = PIO_fdopen(interpreter, &pio_stdio_layer, (PIOHANDLE)stdout, ">");
    PIO_puts(interpreter, io, "Hello, World\n");
    PIO_flush(interpreter, io);

    return 0;
}
CODE
Hello, World
OUTPUT
