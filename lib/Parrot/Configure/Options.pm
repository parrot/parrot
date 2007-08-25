# Copyright (C) 2001-2006, The Perl Foundation.
# $Id$
package Parrot::Configure::Options;
use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    process_options
);
use Carp;
use lib qw( lib );
use Parrot::Configure::Options::Conf ();
use Parrot::Configure::Options::Reconf ();

sub process_options {
    my $argsref = shift;
    my %options_components;
    croak "'mode' argument not provided to process_options()"
        unless defined $argsref->{mode};
    if ($argsref->{mode} =~ /^reconfigure$/i) {
        %options_components =
            %Parrot::Configure::Options::Reconf::options_components;
    } elsif ($argsref->{mode} =~ /^configure$/i) {
        %options_components =
            %Parrot::Configure::Options::Conf::options_components;
    } else {
        croak "Invalid value for 'mode' argument to process_options()";
    }
    $argsref->{argv} = [] unless defined $argsref->{argv};

    my $script = $options_components{script}
        ? $options_components{script}
        : croak "Must provide value for 'script'";

    my %valid_opts = map {$_, 1} @{ $options_components{valid_options} };
    my $data = {};
    my @short_circuits_seen = ();
    for ( @{ $argsref->{argv} } ) {
        my ( $key, $value ) = m/--([-\w]+)(?:=(.*))?/;
        $key   = 'help' unless defined $key;
        $value = 1      unless defined $value;

        unless ( $valid_opts{$key} ) {
            die qq/Invalid option "$key". See "perl $script --help" for valid options\n/;
        }
        if ($options_components{short_circuits}{$key}) {
            push @short_circuits_seen, $key;
        }
        $data->{$key} = $value;
    }
    if (@short_circuits_seen) {
        # run all the short circuits
        foreach my $sc (@short_circuits_seen) {
            &{$options_components{short_circuits}{$sc}};
        }
        return;
    } else {
        $data = &{$options_components{conditionals}}($data);
        return $data;
    }
}
1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Configure::Options - Process command-line options to F<Configure.pl>

=head1 SYNOPSIS

    use Parrot::Configure::Options qw( process_options );

    $args = process_options( {
        mode    => q{configure},
    } );

=head1 DESCRIPTION

Parrot::Configure::Options exports on demand two subroutines:
C<process_options()>, which processes the command-line options provided to
F<Configure.pl>; and C<get_valid_options()>, which returns the list of
currently valid options.

If you provide F<Configure.pl> with either C<--help> or C<--version>,
C<process_options()>  will print out the appropriate message and perform a
bare C<return>, I<i.e.>, the return value will be C<undef>.  The calling
script -- whether F<Configure.pl> or a test file -- can then check for the
definedness of C<process_options()>'s return value and proceed appropriately.

An array of valid command-line option names stored internally is consulted;
the program will die if an invalid option is called.

=head1 SUBROUTINES

=head2 C<process_options()>

=over 4

=item * Purpose

Process command-line options provided to F<Configure.pl> and proceed
appropriately.

=item * Arguments

One argument:  Reference to a hash holding the following key-value pairs:

    argv            : reference to @ARGV; defaults to []
    script          : Perl's $0:  the calling program;
                      defaults to 'Configure.pl'
    parrot_version  : string holding Parrot version number
                      (currently supplied by
                      Parrot::BuildUtil::parrot_version())
    svnid           : string holding Subversion Id string

=item * Return Value

=over 4

=item * C<--version> or C<--help>

Bare return (C<undef>).

=item * All other options

Reference to a hash of option names and values.

=back

=item * Comment

=back

=head2 C<get_valid_options()>

=over 4

=item * Purpose

Get a list of options currently valid for F<Configure.pl>.

=item * Arguments

None.

=item * Return Value

List of currently valid options.

=item * Comment

=back

=head1 NOTES

The functionality in this package was transferred from F<Configure.pl> by Jim
Keenan.

=head1 SEE ALSO

F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
