#! perl
# Copyright (C) 2006-2009, Parrot Foundation.

use strict;
use warnings;

use lib qw( . lib ../lib ../../lib );
use Test::More tests => 5;
use Parrot::Distribution;

=head1 NAME

t/codingstd/c_header_guards.t - checks for rules related to guards in C header files

=head1 SYNOPSIS

    # test all files
    % prove t/codingstd/c_header_guards.t

    # test specific files
    % perl t/codingstd/c_header_guards.t include/parrot/bar.h

=head1 DESCRIPTION

Checks that all C language header files have an
#ifndef PARROT_WHATEVER_H_GUARD definition, then they
#define PARROT_WHATEVER_H_GUARD and add an
#endif /* PARROT_WHATEVER_H_GUARD */ at the end, of the file as specified
in PDD07.

=head1 AUTHOR

Mark Glines <mark at glines dot org>

=head1 SEE ALSO

L<docs/pdds/pdd07_codingstd.pod>

=cut

my $DIST = Parrot::Distribution->new();
my @files;
if (@ARGV) {
    @files = <@ARGV>;
}
else {
    my %files = map { $_->path() => 1 } $DIST->c_header_files();
    my $href  = $DIST->generated_files();

    foreach my $file ( keys %$href ) {
        if ( $file =~ /\.h$/ ) {
            $files{$file} = 1 if -f $file;
        }
    }

    # not all files should be subject to the coding standards
    foreach my $file ( keys %files ) {
        delete $files{$file} if $DIST->is_c_exemption($file);
    }

    @files = sort keys %files;
}

check_header_guards(@files);

exit;

sub check_header_guards {
    my ( %guardnames, %redundants, %collisions, %missing_guard, %missing_define, %missing_comment );

F: foreach my $file (@_) {
        open my $fh, '<', $file
            or die "Cannot open '$file' for reading!\n";
        my @source = <$fh>;
        close $fh;
        chomp @source;

        my ( $ifndef, $define, $endif );
    L: foreach my $line (@source) {
            $line =~ s/\s+/ /;
            $line =~ s/^ //;

            # skip Bison parser files
            next F if $line =~ /A Bison parser/;

            # skip the non-preprocessor lines
            next L unless substr( $line, 0, 1 ) eq '#';

            # skip the "#", and any leading whitespace
            $line = substr( $line, 1 );
            $line =~ s/^ //;

            if ( $line =~ m{ifndef (PARROT_.+_GUARD)$} ) {

                # check for multiple guards in the same file
                $redundants{$file} = $1 if defined $ifndef;

                # check for the same guard-name in multiple files
                if ( exists( $guardnames{$1} ) ) {
                    if ( !duplicate_files( $file, $guardnames{$1} ) ) {
                        $collisions{$file} = $guardnames{$1};
                    }
                }

                $ifndef         = $1;
                $guardnames{$1} = $file;
            }

            if ( $line =~ m{define (PARROT_.+_GUARD)$} ) {
                $define = $1
                    if ( defined($ifndef) && $ifndef eq $1 );
            }

            if ( $line =~ m{endif /\* (PARROT_.+_GUARD) \*/$} ) {
                $endif = $1
                    if ( defined($ifndef) && $ifndef eq $1 );
            }
        }

        $missing_guard{$file}   = 1 unless defined $ifndef;
        $missing_define{$file}  = 1 unless defined $define;
        $missing_comment{$file} = 1 unless defined $endif;
    }

    ok( !%collisions, "identical PARROT_*_GUARD macro names used in headers" )
        or diag( "collisions: \n" . join( ", \n", %collisions ) );

    ok( !%redundants, "multiple PARROT_*_GUARD macros found in headers" )
        or diag( "redundants: \n" . join( ", \n", keys %redundants ) );

    ok( !%missing_guard,
        "missing or misspelled PARROT_*_GUARD ifndef in headers" )
        or diag(     "missing guard: \n"
            . join( ", \n", sort keys %missing_guard )
            . "\nyou need to add a line like:\n"
            . "  #ifndef PARROT_*_GUARD\n"
            . "at the top of the header." );

    ok( !%missing_define,
        "missing or misspelled PARROT_*_GUARD define in headers" )
        or diag(     "missing define: \n"
            . join( ", \n", sort keys %missing_define )
            . "\nyou need to add a line like:\n"
            . "  #define PARROT_*_GUARD\n"
            . "at the top of the header." );

    ok( !%missing_comment, "missing or misspelled PARROT_*_GUARD "
        . "comment after the endif in headers" )
        or diag(     "missing endif comment: \n"
            . join( ", \n", sort keys %missing_comment )
            . "\nyou need to add a line like:\n"
            . "  #endif /* PARROT_*_GUARD */\n"
            . "at the end of the header." );

    return 0;
}

sub duplicate_files {
    my ( $file1, $file2 ) = @_;
    open my $fh1, '<', $file1
        or die "Cannot open '$file1' for reading!\n";
    open my $fh2, '<', $file2
        or die "Cannot open '$file2' for reading!\n";
    local $/;
    $file1 = <$fh1>;
    $file2 = <$fh2>;
    return $file1 eq $file2;
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
