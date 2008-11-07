#!perl
# Copyright (C) 2007 - 2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 3;

=head1 NAME

t/oo/methods.t - Test OO methods

=head1 SYNOPSIS

    % prove t/oo/methods.t

=head1 DESCRIPTION

Tests features related to the creation, addition, and execution of OO methods.

=cut

my $external_lib = "method_library.pir";
my $filehandle;
open $filehandle, '>', "$external_lib" or die "Can't write $external_lib";
print $filehandle <<'EOF';
    .namespace ['Foo']

    .sub 'bar_method' :method
        say 'in bar_method'
    .end
EOF
close $filehandle;

pir_output_is( <<'CODE', <<'OUT', 'loading a set of methods from a file' );
.sub 'main' :main
    $P0 = newclass 'Foo'
    $P1 = new 'Foo'
    $P1.'foo_method'()

    load_bytecode 'method_library.pir'
    $P1 = new 'Foo'
    $P1.'bar_method'()
.end

.namespace ['Foo']
.sub 'foo_method' :method
    say 'in foo_method'
.end
CODE
in foo_method
in bar_method
OUT

unlink $external_lib;

pir_output_is( <<'CODE', <<'OUT', "loading a set of methods from eval'd code" );
.sub 'main' :main
    $P0 = newclass 'Foo'
    $P1 = new 'Foo'
    $P1.'foo_method'()

    $S2 = <<'END'
        .namespace ['Foo']
        .sub 'bar_method' :method
            say 'in bar_method'
        .end
END
    $P2 = compreg 'PIR'
    $P2($S2)

    $P1 = new 'Foo'
    $P1.'bar_method'()
.end

.namespace ['Foo']
.sub 'foo_method' :method
    say 'in foo_method'
.end
CODE
in foo_method
in bar_method
OUT

pir_output_is( <<'CODE', <<'OUT', "overridden find_method() should not eat passed-in args (RT #48134)" );
.sub 'main' :main
    $P0 = newclass 'Obj'
    $P2 = new 'Obj'
    $P2.'some_method'(42)
.end

.namespace ['Obj']

.sub 'meth' :method
    .param pmc a
    say a
.end

.sub 'find_method' :vtable :method
    .param string meth_name

    say meth_name

    .const 'Sub' meth = 'meth'
    .return (meth)
.end
CODE
some_method
42
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
