#! perl
# Copyright (C) 2001-2010, Parrot Foundation.

use strict;
use warnings;

use Getopt::Long;
use lib qw( lib );
use Parrot::Headerizer;
use Parrot::Headerizer::Functions qw(
    process_argv
);

=head1 NAME

tools/dev/headerizer.pl - Generates the function header parts of .h
files from .c files

=head1 SYNOPSIS

  $ perl tools/dev/headerizer.pl [object files]

Generates C function declarations based on the function definitions in
the C source code.

=head1 DESCRIPTION

The headerizer works off of directives in the source and header files.

One source file's public declarations can only go into one header file.
In other words, headers-to-source is one-to-many.

=over 4

=item C<HEADERIZER BEGIN:> F<source-filename> / C<HEADERIZER END:> F<source-filename>

Marks the beginning and end of a block of declarations in a header file.

    # In file foo.h
    /* HEADERIZER BEGIN: src/foo.c */
    /* HEADERIZER END: src/foo.c */

    /* HEADERIZER BEGIN: src/bar.c */
    /* HEADERIZER END: src/bar.c */

=item C<HEADERIZER HFILE:> F<header-filename>

Tells the headerizer where the declarations for the functions should go

    # In file foo.c
    /* HEADERIZER HFILE: foo.h */

    # In file bar.c
    /* HEADERIZER HFILE: foo.h */

=back

=head1 COMMAND-LINE OPTIONS

=over 4

=item C<--macro=X>

Print a list of all functions that have macro C<X>.  Example:

    $> perl tools/dev/headerizer.pl --macro=PARROT_CAN_RETURN_NULL src/list.o

    src/list.c
        Parrot_list_pop
        Parrot_list_remove
    2 PARROT_CAN_RETURN_NULL functions

=back

=cut

my $macro_match;
GetOptions(
    'macro=s' => \$macro_match,
) or exit(1);

my @ofiles = process_argv(@ARGV);
my $headerizer = Parrot::Headerizer->new( {
    macro_match => $macro_match,
} );

$headerizer->get_sources(@ofiles);
$headerizer->process_sources();
$headerizer->print_final_message();
$headerizer->print_warnings();


=head1 AUTHOR

The original headerizer program was created by Andy Lester in May 2006, with
assistance from Jerry Gay and others.  In the last half of 2010, Most of the
code was refactored into F<lib/Parrot/Headerizer.pm> and
F<lib/Parrot/Headerizer/Functions.pm> by James E Keenan.

=cut

# From earlier documentation:
# * Generate docs from funcs
# * Somehow handle static functions in the source file
# * the .c files MUST have a /* HEADERIZER HFILE: foo/bar.h */ directive in them
# * Support for multiple .c files pointing at the same .h file
# * Does NOT remove all blocks in the .h file, so if a .c file
#   disappears, its block is "orphaned" and will remain there.

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
