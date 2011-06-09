#!perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;
use lib qw( t . lib ../lib ../../lib );

use Test::More;
use Parrot::Test tests => 2;
use Parrot::Config qw(%PConfig);

=head1 NAME

t/library/pcre.t - testing library/pcre.pir

=head1 SYNOPSIS

    % prove t/library/pcre.t

=head1 DESCRIPTION

This program tests whether the 'pcre.pir' library accesses
the installed PCRE library, and matches patterns successfully.

=cut

# if we keep pcre, we need a config test
my $cmd = ( $^O =~ /MSWin32/ ) ? "pcregrep --version" : "pcre-config --version";
my $has_pcre = !Parrot::Test::run_command( $cmd, STDOUT => File::Spec->devnull ,STDERR => File::Spec->devnull, );
my $pcre_libpath = '';

# It's possible that libpcre is installed in some non-standard path...
if ($has_pcre && ($^O !~ /MSWin32/)) {
    # Extract the library path for non-windows platforms (in case it isn't in
    # the normal lookup locations)
    my $outfile = 'pcre-config.out';
    Parrot::Test::run_command('pcre-config --prefix', STDOUT => $outfile);
    my $out = Parrot::Test::slurp_file($outfile);
    unlink $outfile;
    chomp $out;
    $pcre_libpath = "$out/lib";
}

SKIP: {
    skip( 'no pcre-config', Test::Builder->new()->expected_tests() )
        unless $has_pcre;

    unless ($PConfig{HAS_EXTRA_NCI_THUNKS} || $PConfig{HAS_LIBFFI}) {
        skip( 'Parrot built without libffi or extra NCI thunks',
              Test::Builder->new()->expected_tests() );
    }

## 1
## Check that the library can be loaded and initialized,
## diganose the failure otherwise.
    pir_output_is(<<"CODE", <<'OUT', 'libpcre loading');

.include 'iglobals.pasm'
.include 'libpaths.pasm'

.sub main :main
    .local pmc interp
    getinterp interp

    .local pmc lib_paths
    lib_paths = interp[.IGLOBALS_LIB_PATHS]

    .local pmc dynext_path
    dynext_path = lib_paths[.PARROT_LIB_PATH_DYNEXT]
    unshift dynext_path, '$pcre_libpath'

    load_bytecode 'pcre.pbc'
    .local pmc pcre_init
    .local pmc pcre_lib

    get_global pcre_init, ['PCRE'], 'init'
    if null pcre_init goto NOINIT
    push_eh CATCH
    pcre_lib = pcre_init()
    pop_eh
    if null pcre_lib goto NULLINIT
    unless pcre_lib goto FALSEINIT
    say 'Loaded'
    .return()
CATCH:
    .local pmc exception
    .get_results(exception)
    .local string message
    message = exception['message']
    pop_eh
    say message
    .return()
NOINIT:
   say 'No init function'
    .return()
NULLINIT:
    say 'init returned null value'
    .return()
FALSEINIT:
    say 'init returned false value'
    .return()
.end

CODE
Loaded
OUT

## 2
    my @todo;
    @todo = ( todo => '3..5 fail on Win32' ) if $^O =~ /MSWin32/;
    pir_output_is( <<"CODE", <<'OUT', 'soup to nuts', @todo );

.include 'iglobals.pasm'
.include 'libpaths.pasm'

.sub main :main
    .local pmc interp
    getinterp interp

    .local pmc lib_paths
    lib_paths = interp[.IGLOBALS_LIB_PATHS]

    .local pmc dynext_path
    dynext_path = lib_paths[.PARROT_LIB_PATH_DYNEXT]
    unshift dynext_path, '$pcre_libpath'

    load_bytecode 'pcre.pbc'
    .local pmc func
    .local pmc lib

    get_global func, ['PCRE'], 'init'
    if_null func, NOK1
    branch OK1
NOK1:
    print 'not '
OK1:
    say 'ok 1'

    lib = func()
    if_null lib, NOK2
    branch OK2
NOK2:
    print 'not '
OK2:
    say 'ok 2'


    .local string s
    .local string pat

    s= '--a--'
    pat= 'a'

    .local pmc code
    .local string error
    .local int errptr

    func= get_global ['PCRE'], 'compile'
    ( code, error, errptr )= func( pat, 0 )

    .local int is_code_defined
    is_code_defined= defined code
    if is_code_defined goto OK3
    print 'not '
OK3:
    say 'ok 3'

    .local int ok
    .local pmc result

    func= get_global ['PCRE'], 'match'
    ( ok, result )= func( code, s, 0, 0 )

    unless ok < 0 goto OK4
    print 'not '
OK4:
    say 'ok 4'

    .local int i
    i = 0
    .local string match

    func = get_global ['PCRE'], 'dollar'
    match = func( s, ok, result, i )
    if 'a' == match goto OK5
    print 'not '
OK5:
    say 'ok 5'

.end
CODE
ok 1
ok 2
ok 3
ok 4
ok 5
OUT

}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
