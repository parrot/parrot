#! perl
# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$

use strict;
use warnings;
use lib qw( . lib ../lib ../../lib );
use Test::More tests => 26;
use File::Spec;


=head1 NAME

t/perl/Parrot_Distribution.t - Parrot::Distribution unit tests

=head1 SYNOPSIS

    % prove t/perl/Parrot_Distribution.t

=head1 DESCRIPTION

=cut


BEGIN { use_ok('Parrot::Distribution') };

die "Run these tests from the distribution root\n" unless -d 't/perl';

# search upwards
chdir 't/perl';
my $d = Parrot::Distribution->new();
isa_ok($d, 'Parrot::Docs::Directory');

ok($d->c_source_file_with_name('pf_items'), 'C source file');
ok( ! $d->c_source_file_with_name('moomoo'), 'C source file not there');

ok($d->c_header_file_with_name('parrot'), 'C header file');
ok( ! $d->c_header_file_with_name('moomoo'), 'C header file not there');

ok($d->pmc_source_file_with_name('parrotinterpreter'), 'PMC code');
ok( ! $d->pmc_source_file_with_name('moomoo'), 'PMC code file not there');

ok($d->yacc_source_file_with_name('imcc'), 'Yacc code');
ok( ! $d->yacc_source_file_with_name('moomoo'), 'Yacc code file not there');

ok($d->lex_source_file_with_name('imcc'), 'Lex code');
ok( ! $d->lex_source_file_with_name('moomoo'), 'Lex code file not there');

ok($d->file_for_perl_module('Parrot::Docs::Section::Parrot'), 'Perl module file');
ok( ! $d->file_for_perl_module('Parrot::Dummy'), 'Perl module file not there');

my %pmc_source_file_directories=map {($_->path => 1)} $d->pmc_source_file_directories;

my @old_directory_list = (
    'compilers/bcg/src/pmc',
    'languages/APL/src/pmc',
    'languages/WMLScript/pmc',
    'languages/amber/lib/kernel/pmc',
    'languages/cardinal/src/pmc',
    'languages/dotnet/pmc',
    'languages/lua/pmc',
    'languages/perl6/src/pmc',
    'languages/pugs/pmc',
    'languages/tcl/src/pmc',
    map { File::Spec->catdir( 'src', $_ ) } qw(dynpmc pmc));

for my $dir (@old_directory_list) {
    my $path = $d->directory_with_name($dir)->path();
    ok( exists $pmc_source_file_directories{$path},
   	    "Directory from hardcoded list $dir found through MANIFEST" );
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
