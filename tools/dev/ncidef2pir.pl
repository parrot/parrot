#! perl

# Copyright (C) 2003-2011, Parrot Foundation.

=head1 NAME

tools/dev/ncidef2pir.pl - Turn an NCI library definition file into PIR

=head1 SYNOPSIS

    perl tools/dev/ncidef2pir.pl path/to/from_file [ path/to/to_file ]

=head1 DESCRIPTION

This program takes an NCI library definition file and creates a PIR file
which loads the described library.

An NCI library definition file provides the information needed to
generate a parrot wrapper for the named library (or libraries). Its
format is simple, and looks like:

  [package]
  ncurses

  [lib]
  libform.so

  [defs]
  p new_field i i i i i i

  [lib]
  libncurses.so

  [defs]
  i is_term_resized i i

Note that the assembly file is generated in the order you specify, so
if there are library dependencies, make sure you have them in the
correct order.

=head2 package

Declares the package that all subsequent sub PMCs will be put
into. Double colon is used to to delimit namespaces.

=head2 lib

The name of the library to be loaded. Should be as qualified as
necessary for your platform--generally the full filename is required,
though the directory generally isn't.

You may load multiple libraries here, but only the last one loaded
will be exposed to subsequent defs.

=head2 defs

This section holds the definitions of functions. Each function is
assumed to be in the immediate preceding library. The definition of
the function is:

  return_type name [param [param [param ...]]]

The param and return_type parameters use the NCI standard, which for
reference is:

=over 4

=item p

Parameter is a void pointer, taken from the PMC's data pointer. PMC is
assumed to be an unmanagedstruct or child class.

Taken from a P register

=item c

Parameter is a character.

Taken from an I register

=item s

Parameter is a short

Taken from an I register

=item i

Parameter is an int

Taken from an I register

=item l

Parameter is a long

Taken from an I register

=item f

Parameter is a float

Taken from an N register.

=item d

Parameter is a double.

Taken from an N register.

=item t

Parameter is a char *, presumably a C string

Taken from an S register

=item v

Void. Only valid as a return type, noting that the function returns no data.

=item I

Interpreter pointer. The current interpreter pointer is passed in

=item P

PMC.

=item 2

Pointer to short.

Taken from an I register.

=item 3

Pointer to int.

Taken from an I register

=item 4

Pointer to long

Taken from an I register

=back

=cut

use strict;
use warnings;

my ( $from_file, $to_file ) = @ARGV;

# If there is no destination file, strip off the extension of the
# source file and add a .pasm to it
if ( !defined $to_file ) {
    $to_file = $from_file;
    $to_file =~ s/\.[^.]*$//;
    $to_file .= ".pir";
}

open my $INPUT,  '<', "$from_file" or die "Can't open up $from_file, error $!";
open my $OUTPUT, '>', "$to_file"   or die "Can't open up $to_file, error $!";

# Have the library initialized on load
print $OUTPUT <<EOR;
.sub '' :anon :load
  .local pmc lib, nci
EOR

my @libs;
my ( $cur_package, $line, $cur_section );

# Our dispatch table
my (%dispatch) = (
    package => \&package_line,
    lib     => \&lib_line,
    defs    => \&def_line,
);

while ( $line = <$INPUT> ) {

    # Throw away trailing newlines, comments, and whitespace. If the
    # line's empty, then off to the next line
    chomp $line;
    $line =~ s/#.*//;
    $line =~ s/\s*$//;
    next unless $line;

    # Is it a section line? If so, extract the section and set it.
    if ( $line =~ /\[(\w+)\]/ ) {
        $cur_section = $1;
        next;
    }

    # Everything else goes to the handler
    $dispatch{$cur_section}->($line);

}

# Put the registers back and end
print $OUTPUT ".end\n";
close $OUTPUT;

sub package_line {
    my $line = shift;

    # Trim leading and trailing spaces
    $line =~ s/^\s*//;
    $line =~ s/\s*$//;

    # Set the global current package
    $cur_package = [ split /::/, $line ];
}

sub lib_line {
    my $line = shift;
    print $OUTPUT "  loadlib lib, '$line'\n";
}

sub def_line {
    my $line = shift;
    my ( $return_type, $name, @params ) = split ' ', $line;
    unshift @params, $return_type;
    my $signature = join( "", @params );
    print $OUTPUT "  dlfunc nci, lib, '$name', '$signature'\n";
    print $OUTPUT "  set_global " .
                    "[" . (join ";", (map {"'$_'"} @$cur_package)) . "]" .
                    ", '${name}', nci\n";
}

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
