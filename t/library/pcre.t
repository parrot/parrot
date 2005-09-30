#! perl -w
# Copyright (C) 2001-2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

t/library/pcre.t - testing library/pcre.imc

=head1 SYNOPSIS

    % perl -Ilib t/library/pcre.t

=head1 DESCRIPTION

This program tests whether the 'pcre.imc' library accesses
the installed PCRE library, and matches patterns successfully.

=cut

use strict;

use Parrot::Test tests => 1;

# if we keep pcre, we need a config test
my $cmd = ($^O =~ /MSWin32/) ? "pcregrep --version" : "pcre-config --version";
my $has_pcre = Parrot::Test::run_command($cmd, STDERR => '/dev/null') == 0;

SKIP: {
    skip("no pcre-config", Test::Builder->new()->expected_tests())
        unless $has_pcre;

## 1
pir_output_is( <<'CODE', <<'OUT', 'soup to nuts' );


.sub main @MAIN
    load_bytecode "library/pcre.imc"
    .local pmc func
    .local pmc lib


    find_global func, 'PCRE', 'init'
    isnull func, NOK1
    branch OK1
NOK1:
    print 'not '
OK1:
    print "ok 1\n"

    lib= func()
    isnull lib, NOK2
    branch OK2
NOK2:
    print 'not '
OK2:
    print "ok 2\n"


    .local string s
    .local string pat

    s= '--a--'
    pat= 'a'

    .local pmc code
    .local string error
    .local int errptr

    func= find_global 'PCRE', 'compile'
    ( code, error, errptr )= func( pat, 0 )

    .local int is_code_defined
    is_code_defined= defined code
    if is_code_defined goto OK3
    print 'not '
OK3:
    print "ok 3\n"

    .local int ok
    .local pmc result

    func= find_global 'PCRE', 'match'
    ( ok, result )= func( code, s, 0, 0 )

    unless ok < 0 goto OK4
    print 'not '
OK4:
    print "ok 4\n"

    .local int i
    i= 0
    .local string match

    func= find_global 'PCRE', 'dollar'
    match= func( s, ok, result, i )
    if 'a' == match goto OK5
    print 'not '
OK5:
    print "ok 5\n"

.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUT

}
