#! perl -w

use Parrot::Test tests => 7;
use Test::More;

$/=undef; # slurp mode

c_output_is(<<'CODE', <<'OUTPUT', "hello world");
#include <parrot/parrot.h>
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

c_output_is(<<'CODE', <<'OUTPUT', "write");
#include <parrot/parrot.h>
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

    io = PIO_open(interpreter, "temp.file", ">");
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

c_output_is(<<'CODE', <<'OUTPUT', 'read');
#include <parrot/parrot.h>
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

    io = PIO_open(interpreter, "temp.file", "<");
    len = PIO_read(interpreter, io, buf, sizeof(buf)-1);
    PIO_close(interpreter, io);

    buf[len] = '\0';
    PIO_printf(interpreter, "%s", buf);

    io = PIO_open(interpreter, "temp.file", "<");
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

c_output_is(<<'CODE', '', 'append');
#include <parrot/parrot.h>
#include <parrot/io.h>

int
main ()
{
    struct Parrot_Interp *interpreter;
    ParrotIO *io;

    interpreter = Parrot_new();
    Parrot_init(interpreter);

    io = PIO_open(interpreter, "temp.file", ">>");
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

  c_output_is(<<'CODE', <<'OUTPUT', 'readline');
#include <parrot/parrot.h>
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

    io = PIO_open(interpreter, "temp.file", "<");
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
