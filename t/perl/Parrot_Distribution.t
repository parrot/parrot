#! perl
# Copyright (C) 2001-2009, Parrot Foundation.
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

BEGIN { use_ok('Parrot::Distribution') }

die "Run these tests from the distribution root\n" unless -d 't/perl';

# search upwards
chdir 't/perl';
my $d = Parrot::Distribution->new();
isa_ok( $d, 'Parrot::Docs::Directory' );
ok( $d == Parrot::Distribution->new(), 'Parrot::Distribution is a singleton' );

ok( $d->c_source_file_with_name('pf_items'), 'C source file' );
ok( !$d->c_source_file_with_name('moomoo'), 'C source file not there' );

ok( $d->c_header_file_with_name('parrot'), 'C header file' );
ok( !$d->c_header_file_with_name('moomoo'), 'C header file not there' );

ok( $d->pmc_source_file_with_name('parrotinterpreter'), 'PMC code' );
ok( !$d->pmc_source_file_with_name('moomoo'), 'PMC code file not there' );

ok( $d->yacc_source_file_with_name('imcc'), 'Yacc code' );
ok( !$d->yacc_source_file_with_name('moomoo'), 'Yacc code file not there' );

ok( $d->lex_source_file_with_name('imcc'), 'Lex code' );
ok( !$d->lex_source_file_with_name('moomoo'), 'Lex code file not there' );

ok( $d->file_for_perl_module('Parrot::Docs::Section::Parrot'), 'Perl module file' );
ok( !$d->file_for_perl_module('Parrot::Dummy'), 'Perl module file not there' );

my %pmc_source_file_directories = map { $_->path => 1 } $d->pmc_source_file_directories();

my @old_directory_list = (
    map { File::Spec->catdir( 'src', $_ ) } qw(dynpmc pmc)
);

for my $dir (@old_directory_list) {
    my $path = $d->directory_with_name($dir)->path();
    ok( exists $pmc_source_file_directories{$path},
        "Directory from hardcoded list $dir found through MANIFEST" )
        or diag( "Missing $dir\n" );
}

## perl files and exemptions
{
    my @perl_files = $d->get_perl_language_files();
    ok( @perl_files, 'Got some perl files' );

    ok( $d->perl_source_file_with_name('ops2c.pl'),        'Perl source file (.pl)' );
    ok( $d->perl_source_file_with_name('Distribution.pm'), 'Perl source file (.pm)' );
    ok( $d->perl_source_file_with_name('perlcritic.t'),    'Perl source file (.t)' );
    ok( !$d->perl_source_file_with_name('p5rx.t'),         'Not a Perl source file (.t)' );

    my $perl_exemption_regexp = $d->get_perl_exemption_regexp();
    ok( $perl_exemption_regexp, 'Got perl exemption regexp' );

    # we are in 't/perl'
    {
        my $dummy_fn = '../../lib/DumbLink.pm';
        my $not_exempted_file = Parrot::IO::File->new($dummy_fn);
        ok( !$d->is_perl_exemption($not_exempted_file), 'DumbLink.pm is not exempted' );
        unlike( $not_exempted_file->path(), $perl_exemption_regexp, 'DumbLink.pm is not matched' );
        unlink $dummy_fn;
    }

    # check that no exemptions turn up in the main file list
    my @exemptions_in_perl_list = grep { $_ =~ $perl_exemption_regexp }
        map { $_->path } @perl_files;

    ok( !@exemptions_in_perl_list, 'No exemptions in Perl source list' );
    foreach (@exemptions_in_perl_list) {
        diag("got exempted perl file: $_");
    }
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
