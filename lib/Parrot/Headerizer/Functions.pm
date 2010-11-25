# Copyright (C) 2004-2010, Parrot Foundation.
# $Id$

package Parrot::Headerizer::Functions;
use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    process_argv
    read_file
    write_file
    qualify_sourcefile
    asserts_from_args
    api_first_then_alpha
);

=head1 NAME

Parrot::Headerizer::Functions - Functions used in headerizer programs

=head1 SYNOPSIS

    use Parrot::Headerizer::Functions qw(
        print_headerizer_warnings
        read_file
        write_file
        qualify_sourcefile
        asserts_from_args
        api_first_then_alpha
    );

=head1 DESCRIPTION

This package holds (non-object-oriented) functions used in
F<tools/dev/headerizer.pl>.

=head1 SUBROUTINES

=head2 C<process_argv>

=over 4

=item * Purpose

Validate list of object files provided as arguments.

=item * Arguments

    @ofiles = process_argv(@ARGV);

List of files specified on the command-line.

=item * Return Value

Validated list of object files.

=item * Comment

=back

=cut

sub process_argv {
    my @argv = @_;
    die 'No files specified.' unless @argv;
    my %ofiles;
    ++$ofiles{$_} for @argv;
    my @ofiles = sort keys %ofiles;
    for (@ofiles) {
        print "$_ is specified more than once.\n" if $ofiles{$_} > 1;
    }
    return @ofiles;
}


=head2 C<read_file()>

=over 4

=item * Purpose

Read a file into a string.

=item * Arguments

String holding name of file to be read.

=item * Return Value

String holding the file's content.

=item * Comment

We can't alias this to C<Parrot::BuildUtil::slurp_file()> because that function
changes DOS line endings to Unix, which we don't necessarily want here.

=back

=cut


sub read_file {
    my $filename = shift;

    open my $fh, '<', $filename or die "couldn't read '$filename': $!";
    my $text = do { local $/ = undef; <$fh> };
    close $fh;

    return $text;
}

=head2 C<write_file()>

=over 4

=item * Purpose

Write a file.

=item * Arguments

List of two scalars: string holding name of file to be written; text to be
written to the file.

=item * Return Value

Implicitly returns true upon success.

=back

=cut

sub write_file {
    my $filename = shift;
    my $text     = shift;

    open my $fh, '>', $filename or die "couldn't write '$filename': $!";
    print {$fh} $text;
    close $fh;
}

=head2 C<qualify_sourcefile()>

=over 4

=item * Purpose

Given the name of a C object file, derive the name of its C<.c> or C<.pmc>
source code file, verify that file's existence, read in its source code, and
verify the existence of the corresponding C<.h> file.

=item * Arguments

    my ($sourcefile, $source_code, $hfile) =
        qualify_sourcefile( {
            ofile           => $ofile,
            PConfig         => \%PConfig,
            is_yacc         => $is_yacc,
        } );

Reference to hash with 3 key-value pairs:

=over 4

=item * C<ofile>

String holding name of C or yacc object file.

=item * C<PConfig>

Reference to Parrot configuration hash.

=item * C<is_yacc>

Boolean reporting whether the source code file is a yacc file or not.

=back

=item * Return Value

List of 3 scalars: String holding source code file, string holding the ssource
code, string holding header file (or C<none> if no header file is found).

=item * Comment

The subroutine will die if the value provided for C<ofile> does not have a
corresponding C<.c> file or if it is a yacc file.  The subroutine will also
die if it cannot locate an C<HEADERIZER HFILE> directive in the source code
file.  The subroutine will also die if any header file referenced from the
source code cannot be located.

=back

=cut

sub qualify_sourcefile {
    my $args = shift;
    my $cfile = $args->{ofile};
    $cfile =~ s/\Q$args->{PConfig}->{o}\E$/.c/ or $args->{is_yacc}
        or die "$cfile doesn't look like an object file";

    my $pmcfile = $args->{ofile};
    $pmcfile =~ s/\Q$args->{PConfig}->{o}\E$/.pmc/;

    my $from_pmc = -f $pmcfile && !$args->{is_yacc};

    my $sourcefile = $from_pmc ? $pmcfile : $cfile;

    my $source_code = read_file( $sourcefile );
    die qq{can't find HEADERIZER HFILE directive in "$sourcefile"}
        unless $source_code =~
            m{ /\* \s+ HEADERIZER\ HFILE: \s+ ([^*]+?) \s+ \*/ }sx;

    my $hfile = $1;
    if ( ( $hfile ne 'none' ) && ( not -f $hfile ) ) {
        die qq{"$hfile" not found (referenced from "$sourcefile")};
    }

    return ($sourcefile, $source_code, $hfile);
}

sub asserts_from_args {
    my @args = @_;
    my @asserts;

    for my $arg (@args) {
        if ( $arg =~ m{(ARGIN|ARGOUT|ARGMOD|ARGFREE_NOTNULL|NOTNULL)\((.+)\)} ) {
            my $var = $2;
            if($var =~ /\(*\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*\)\s*\(/) {
                # argument is a function pointer
                $var = $1;
            }
            else {
                # try to isolate the variable's name;
                # strip off everything before the final space or asterisk.
                $var =~ s{.+[* ]([^* ]+)$}{$1};
                # strip off a trailing "[]", if any.
                $var =~ s{\[\]$}{};
            }
            push( @asserts, "PARROT_ASSERT_ARG($var)" );
        }
        if( $arg eq 'PARROT_INTERP' ) {
            push( @asserts, "PARROT_ASSERT_ARG(interp)" );
        }
    }

    return (@asserts);
}


sub api_first_then_alpha {
    return ( ( $b->{is_api} || 0 ) <=> ( $a->{is_api} || 0 ) )
        || ( lc ($a->{name} || '') cmp lc ($b->{name} || '') );
}
1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
