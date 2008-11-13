#! perl
# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );
use Test::More;
use Parrot::Test tests => 20;

=head1 NAME

t/library/File-Spec.t - test File::Spec module

=head1 SYNOPSIS

    % prove t/library/File-Spec.t

=head1 DESCRIPTION

Tests file specifications.

=cut

##############################
# File::Spec

my $PRE = <<'PRE';
.sub 'main' :main
        load_bytecode 'library/File/Spec.pir'

        .local int classtype
        .local pmc spec

        spec = new 'File::Spec'

PRE
my $POST = <<'POST';
        goto OK
NOK:
        print "not "
OK:
        print "ok"
END:
        print "\n"
.end
POST

## 1
pir_output_is( <<'CODE'. $POST, <<'OUT', "load_bytecode" );
.sub 'main' :main
        load_bytecode 'File/Spec.pir'
CODE
ok
OUT

pir_output_is( $PRE . <<'CODE'. $POST, <<'OUT', "new" );
CODE
ok
OUT

my @meths = (
    qw/
        __isa VERSION devnull tmpdir case_tolerant file_name_is_absolute catfile
        catdir path canonpath splitpath splitdir catpath abs2rel rel2abs
        /
);
pir_output_is( $PRE . <<"CODE". $POST, <<'OUT', "can ($_)" ) for @meths;
        .local pmc meth
        \$I0 = can spec, "$_"
        unless \$I0, NOK
CODE
ok
OUT

pir_output_like( $PRE . <<'CODE'. $POST, <<'OUT', "isa" );
        .local pmc class
        class= new 'String'

        class= spec.'__isa'()
        print class
        print "\n"
CODE
/^File::Spec::.+/
OUT

pir_output_is( $PRE . <<'CODE'. $POST, <<'OUT', "version" );
        .local pmc version
        version= spec.'VERSION'()
        print version
        goto END
CODE
0.1
OUT

## testing private subs
pir_output_is( $PRE . <<'CODE'. $POST, <<'OUT', "_get_module" );
        .local string module
        .local pmc get_module
        get_module = get_hll_global [ 'File::Spec' ], '_get_module'
        module= get_module( 'MSWin32' )
        print module
        print "\n"
        module= get_module( 'foobar' )
        print module
        goto END
CODE
Win32
Unix
OUT

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
