#! perl
# Copyright (C) 2001-2005, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test;

plan $^O =~ m/MSWin32/ ? (skip_all => 'broken on win32') : (tests => 2);

=head1 NAME

t/src/list.t - List Subsystem

=head1 SYNOPSIS

     % prove t/src/list.t

=head1 DESCRIPTION

Tests the various C<list_*> functions.

=cut


my $main = <<'CODE';

#include <parrot/parrot.h>
#include <parrot/embed.h>

static opcode_t *
the_test(Parrot_Interp, opcode_t *, opcode_t *);

int exit_value = 0;

int 
main(int argc, char* argv[])
{
    Parrot_Interp interp = Parrot_new(NULL);
    if (!interp) {
        return 1;
    }

    Parrot_run_native(interp, the_test);

    Parrot_exit(interp, exit_value);
    return exit_value;
}

CODE

c_output_is($main . <<'CODE', <<'OUTPUT', "data types");

static opcode_t*
the_test(Parrot_Interp interp, opcode_t *cur_op, opcode_t *start)
{
    int x, i, j;
    char c;
    short t;
    FLOATVAL f;
    STRING *s;
    List* list, *list2;
    PMC *p1, *p2;

    UNUSED(cur_op);
    UNUSED(start);

    list = list_new(interp, enum_type_int);
    if (list == NULL) {
        PIO_eprintf(interp, "list creation failed\n");
        exit_value = 1;
        return NULL;
    }

    for (i = 0, x = 32; x < 43; x++, i++) {
        list_push(interp, list, INTVAL2PTR(void*, x) ,enum_type_int);
        j = *(int*) list_get(interp, list, i, enum_type_int);
        if (i < 10)
            ;
        else
            PIO_eprintf(interp, "The answer is %d.\n", j);
    }

    /* test various data types */
    list = list_new(interp, enum_type_char);

    list_assign(interp, list, 0 ,(void*) 'a', enum_type_char);
    list_assign(interp, list, 1 ,(void*) 'b', enum_type_char);
    list_assign(interp, list, 2 ,(void*) 'c', enum_type_char);
    list_assign(interp, list, 3 ,(void*) 'd', enum_type_char);
    c = *(char*) list_get(interp, list, 1, enum_type_char);
    PIO_eprintf(interp, "char %c\n",  c);

    list = list_new(interp, enum_type_short);

    list_assign(interp, list, 20 ,(void*) 15, enum_type_short);
    list_assign(interp, list, 21 ,(void*) -15, enum_type_short);
    list_assign(interp, list, 22 ,(void*) 99, enum_type_short);
    t = *(short*) list_get(interp, list, 21, enum_type_short);
    PIO_eprintf(interp, "short %d\n",  t);

    list = list_new(interp, enum_type_FLOATVAL);

    f = 1234.56;
    list_assign(interp, list, 20 ,(void*) &f, enum_type_FLOATVAL);
    f = *(FLOATVAL*) list_get(interp, list, 20, enum_type_FLOATVAL);
    PIO_eprintf(interp, "num " FLOATVAL_FMT "\n",  f);

    s = string_make(interp, "Seems ok\n", 9, "iso-8859-1", 0);

    list = list_new(interp, enum_type_PMC);

    p1 = pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, p1, s);

    list_push(interp, list, p1, enum_type_PMC);

    p2 = *(PMC**)list_shift(interp, list, enum_type_PMC);
    s = VTABLE_get_string(interp, p2);
    PIO_eprintf(interp, "string %s", string_to_cstring(interp, s));

    i = list_length(interp, list);
    PIO_eprintf(interp, "len now %d\n", i);

    s = string_make(interp, "list\n", 5, "iso-8859-1",0);
    p1 = pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, p1, s);
    list_assign(interp, list, 0, p1, enum_type_PMC);

    /* clone */
    list2 = list_clone(interp, list);

    s = string_make(interp, "list 2\n", 7, "iso-8859-1",0);
    p1 = pmc_new(interp, enum_class_String);
    VTABLE_set_string_native(interp, p1, s);
    list_assign(interp, list2, 0, p1, enum_type_PMC);

    p1 = *(PMC**) list_shift(interp, list, enum_type_PMC);
    s = VTABLE_get_string(interp, p1);
    PIO_eprintf(interp, "string %s", string_to_cstring(interp, s));

    p2 = *(PMC**) list_shift(interp, list2, enum_type_PMC);
    s = VTABLE_get_string(interp, p2);
    PIO_eprintf(interp, "string %s", string_to_cstring(interp, s));

    list = list_new(interp, enum_type_STRING);
    s = string_make(interp, "list\n", 5, "iso-8859-1",0);
    list_assign(interp, list, 0, s, enum_type_STRING);

    list2 = list_clone(interp, list);

    s = string_make(interp, "list 2\n", 7, "iso-8859-1",0);
    list_assign(interp, list2, 0, s, enum_type_STRING);
    s = *(STRING**) list_shift(interp, list, enum_type_STRING);
    PIO_eprintf(interp, "string %s", string_to_cstring(interp, s));
    s = *(STRING**) list_shift(interp, list2, enum_type_STRING);
    PIO_eprintf(interp, "string %s", string_to_cstring(interp, s));

    /* delete test */
    list = list_new(interp, enum_type_char);
    for (i = 0; i < 20; i++) {
        int c = 'a' + i;
        list_push(interp, list, (void*) c, enum_type_char);
    }
    list_delete(interp, list, 1, 1);
    list_delete(interp, list, 1, 4);
    j = *(char*) list_get(interp, list, 1, enum_type_char);
    PIO_eprintf(interp, "delete 1 %s\n", (j == 6+'a') ? "ok" : "nok");

    list = list_new(interp, enum_type_char);
    for (i = 0; i < 26; i++) {
        int c = 'a' + i;
        list_push(interp, list, (void*) c, enum_type_char);
    }
    list_delete(interp, list, 1, 20);
    j = *(char*) list_get(interp, list, 1, enum_type_char);
    PIO_eprintf(interp, "delete 2 %s\n", (j == 21+'a') ? "ok" : "nok");

    list = list_new(interp, enum_type_char);
    for (i = 0; i < 26; i++) {
        int c = 'a' + i;
        list_push(interp, list, (void*) c, enum_type_char);
    }
    list_delete(interp, list, 2, 30);
    for (i = 0; i < 26; i++) {
        int c = 'A' + i;
        list_push(interp, list, (void*) c, enum_type_char);
    }
    j = *(char*) list_get(interp, list, 6, enum_type_char);
    PIO_eprintf(interp, "delete 3 %s\n", (j == 'E' && list_length(interp, list) == 28)
        ? "ok" : "nok");

    list = list_new(interp, enum_type_char);
    for (i = 0; i < 5; i++) {
        int c = 'a' + i;
        list_push(interp, list, (void*) c, enum_type_char);
    }
    list_assign(interp, list, 2000 ,(void*)'Y', enum_type_char);
    list_assign(interp, list, 4000 ,(void*)'Z', enum_type_char);
    list_delete(interp, list, 5, 3000);
    list_delete(interp, list, 2, 996);
    j = *(char*) list_get(interp, list, -1, enum_type_char);
    PIO_eprintf(interp, "delete 4 %s\n", (j == 'Z' && list_length(interp, list) == 5)
        ? "ok" : "nok");
#if 0
    /* insert */
    PIO_eprintf(interp, "\nnew list(0..5), shift\n");
    list = list_new(interp, enum_type_char);
    for (i = 0; i < 6; i++)
        list_push(interp, list, (void*) 'a'+i, enum_type_char);
    list_shift(interp, list, enum_type_char);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "insert(2, 5)\n");
    list_insert(interp, list, 2, 5);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "insert(1, 1)\n");
    list_insert(interp, list, 1, 1);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "list(1..) = 'A'..'F'\n");
    for (i = 0; i < 6; i++)
        list_assign(interp, list, 1+i ,(void*)'A'+i, enum_type_char);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "4 x pop\n");
    for (i = 0; i < 4; i++)
        list_pop(interp, list, enum_type_char);
    list_dump(0, list, 0);
#endif

    list = list_new(interp, enum_type_char);
    for (i = 0; i < 6; i++) {
        int c = 'a' + i;
        list_push(interp, list, (void*) c, enum_type_char);
    }
    list_shift(interp, list, enum_type_char);
    list_insert(interp, list, 0, 3);
    for (i = 0; i < 5; i++) {
        int c = 'A' + i;
        list_assign(interp, list, i, (void*) c, enum_type_char);
    }
    j = *(char*) list_get(interp, list, 0, enum_type_char);
    PIO_eprintf(interp, "insert 2 %s\n", (j == 'A') ? "ok" : "nok");

#if 0
    PIO_eprintf(interp, "\nnew list(0..5)\n");
    list = list_new(interp, enum_type_char);
    for (i = 0; i < 6; i++)
        list_push(interp, list, (void*) 'a'+i, enum_type_char);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "insert(5, 3)\n");
    list_insert(interp, list, 5, 3);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "list(5..9) = 'A'..'E'\n");
    for (i = 0; i < 5; i++)
        list_assign(interp, list, 5+i ,(void*)'A'+i, enum_type_char);
    list_dump(0, list, 0);

    PIO_eprintf(interp, "\nnew list(0..5)\n");
    list = list_new(interp, enum_type_char);
    for (i = 0; i < 6; i++)
        list_push(interp, list, (void*) 'a'+i, enum_type_char);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "insert(6, 3)\n");
    list_insert(interp, list, 6, 3);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "list(5..9) = 'A'..'E'\n");
    for (i = 0; i < 5; i++)
        list_assign(interp, list, 5+i ,(void*)'A'+i, enum_type_char);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "delete(0,1)\n");
    list_delete(interp, list, 0, 1);
    list_dump(0, list, 0);

    PIO_eprintf(interp, "\nnew list(0..5)\n");
    list = list_new(interp, enum_type_char);
    PIO_eprintf(interp, "insert(0, 3)\n");
    list_insert(interp, list, 0, 3);
    list_dump(0, list, 0);

    PIO_eprintf(interp, "\nnew list(0..25)\n");
    list = list_new(interp, enum_type_char);
    for (i = 0; i < 26; i++)
        list_push(interp, list, (void*) 'a'+i, enum_type_char);
    PIO_eprintf(interp, "set_length(4)\n");
    list_set_length(interp, list, 4);
    list_dump(0, list, 0);
    PIO_eprintf(interp, "set_length(-1)\n");
    list_set_length(interp, list, -1);
    list_dump(0, list, 0);
#endif
    PIO_eprintf(interp, "Done.\n");

    return NULL;
}

CODE
The answer is 42.
char b
short -15
num 1234.560000
string Seems ok
len now 0
string list
string list 2
string list
string list 2
delete 1 ok
delete 2 ok
delete 3 ok
delete 4 ok
insert 2 ok
Done.
OUTPUT

c_output_is($main . <<'CODE', <<'OUTPUT', "arbitrary sized");

static opcode_t*
the_test(Parrot_Interp interp, opcode_t *cur_op, opcode_t *start)
{
    int x;
    List* list;
    PMC *p;
    INTVAL key;
    char buf[100];
    int i, j, ok;

    UNUSED(cur_op);
    UNUSED(start);

    p = pmc_new(interp, enum_class_Array);

    VTABLE_set_integer_native(interp, p, 6);
    /* set data type */
    key = 0;
    VTABLE_set_integer_keyed_int(interp, p, key, 2);
    key++;
    VTABLE_set_integer_keyed_int(interp, p, key, enum_type_sized);
    /* set item_size to 100 */
    key++;
    VTABLE_set_integer_keyed_int(interp, p, key, 3);
    key++;
    VTABLE_set_integer_keyed_int(interp, p, key, 100);
    /* set item_per_chunk to 3 */
    key++;
    VTABLE_set_integer_keyed_int(interp, p, key, 4);
    key++;
    VTABLE_set_integer_keyed_int(interp, p, key, 3);

    list = list_new_init(interp, enum_type_sized, p);
    PIO_eprintf(interp, "ok 1\n");

    for (j = 0; j < 5; j++) {
        for (i = 0; i < 100; i++)
            buf[i] = j;
        list_assign(interp, list, j, buf, enum_type_sized);
    }
    for (j = 4; j >= 0; j--) {
        char *p = (char *) list_get(interp, list, j, enum_type_sized);
        ok = 1;
        for (i = 0; i < 100; i++)
            if (p[i] != j) {
                ok = 0;
                break;
            }
    }
    if (ok)
        PIO_eprintf(interp, "ok 2\n");
    else
        PIO_eprintf(interp, "failed 2: i=%d j=%d\n", i, j);

    return NULL;
}
CODE
ok 1
ok 2
OUTPUT
# TODO

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
