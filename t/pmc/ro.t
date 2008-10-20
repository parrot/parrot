#! perl
# Copyright (C) 2006-2007, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 8;

=head1 NAME

t/pmc/ro.t -- tests read-only value support

=head1 SYNOPSIS

    % prove t/pmc/ro.t

=head1 DESCRIPTION

Tests automatically generated read-only PMC support.

=cut

my $library = <<'CODE';
.include "except_types.pasm"
.sub make_readonly
    .param pmc arg
    .local pmc one
    one = new 'Integer'
    one = 1
    setprop arg, '_ro', one
.end

.sub make_writable
    .param pmc arg
    .local pmc zero
    zero = new 'Integer'
    zero = 0
    setprop arg, '_ro', zero
.end
CODE

pir_output_is( $library . <<'CODE', <<'OUTPUT', "Integer set read-only is not writable" );
.sub main :main
    .local pmc foo, eh

    foo = new 'Integer'
    foo = 42

    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label

    make_readonly(foo)
    push_eh eh
    foo = 43
    pop_eh
    print "no exception caught"
    end

eh_label:
    .get_results($P0)
    say "RO exception caught"
    end
.end
CODE
RO exception caught
OUTPUT

pir_output_is( $library . <<'CODE', <<'OUTPUT', "Integer set read-only can be read" );
.sub main :main
    .local pmc foo
    .local pmc tmp

    foo = new 'Integer'
    foo = 42

    make_readonly(foo)
    print foo
    print "\n"
    $I0 = foo
    $S0 = foo
    print $I0
    print "\n"
    print $S0
    print "\n"

    tmp = new 'Integer'
    add tmp, foo, foo
    print tmp
    print "\n"

    $P0 = foo
    add foo, foo, foo
    print foo
    print "\n"

    print $P0
    print "\n"
.end
CODE
42
42
42
84
84
42
OUTPUT

pir_output_is( $library . <<'CODE', <<'OUTPUT', "Integer stays Integer" );
.sub main :main
    .local pmc foo

    foo = new 'Integer'
    foo = 42

    make_readonly(foo)
    typeof $S0, foo
    say $S0
.end
CODE
Integer
OUTPUT

pir_output_is( $library . <<'CODE', <<'OUTPUT', "Integer add" );
.sub main :main
    .local pmc foo, eh

    foo = new 'Integer'
    foo = 42

    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label

    make_readonly(foo)
    push_eh eh
    foo += 16
    pop_eh

    say "no exception caught"
    end

eh_label:
    .get_results($P0)
    say "RO exception caught"
    end
.end
CODE
RO exception caught
OUTPUT

pir_output_is( $library . <<'CODE', <<'OUTPUT', "Complex i_add" );
.sub main :main
    .local pmc foo, eh

    foo = new 'Complex'
    foo[0] = 1.0
    foo[1] = 1.0

    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label

    make_readonly(foo)
    push_eh eh
    add foo, 4
    pop_eh
    say "no exception caught"
    end

eh_label:
    .get_results($P0)
    say "RO exception caught"
    end
.end
CODE
RO exception caught
OUTPUT

pir_output_is( $library . <<'CODE', <<'OUTPUT', "ResizablePMCArray (non-recursive part)" );
.sub main :main
    .local pmc foo, three, four, eh

    foo = new 'ResizablePMCArray'
    three = new 'Integer'
    three = 3
    four = new 'Integer'
    four = 4

    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label

    foo = 3
    foo[0] = three
    foo[1] = three
    foo[2] = three
    make_readonly(foo)

    push_eh eh
    foo[0] = four
    pop_eh
    say "no exception caught"
    end

eh_label:
    .get_results($P0)
    say "RO exception caught"
    end
.end
CODE
RO exception caught
OUTPUT

pir_output_is( $library . <<'CODE', <<'OUTPUT', "Objects" );
.sub main :main
    .local pmc fooclass, foo, eh, i

    i = new 'Integer'
    i = 1

    eh = new 'ExceptionHandler'
    eh.'handle_types'(.EXCEPTION_WRITE_TO_CONSTCLASS)
    set_addr eh, eh_label


    fooclass = newclass 'Foo'
    addattribute fooclass, 'bar'
    foo = new 'Foo'
    setattribute foo, 'bar', i
    make_readonly(foo)
    inc i

    push_eh eh
    setattribute foo, 'bar', i
    pop_eh

    say "no exception caught"
    end

eh_label:
    .get_results($P0)
    say "RO exception caught"
    end
.end
CODE
RO exception caught
OUTPUT

# RT #46821: should this work?
{
    local $TODO = 1;
    pir_output_unlike( $library . <<'CODE', <<'OUTPUT', "ResizablePMCArray -- Recursive" );
.sub main :main
    .local pmc foo
    .local pmc three
    .local pmc tmp

    foo = new 'ResizablePMCArray'
    three = new 'Integer'
    three = 3

    foo = 1
    foo[0] = three

    print "before make_readonly\n"
    make_readonly(foo)
    print "after\n"

    # three = 4 # should fail -- is that what we want
    tmp = foo[0]
    tmp = 4
    print "NOT OKAY\n"
    tmp = foo[0]
    print tmp
.end
CODE
/NOT OKAY/
OUTPUT
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
