# Copyright (C) 2007-2008, Parrot Foundation.
package Parrot::Configure::Options::Conf::CLI;

use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    %options_components
    @valid_options
    $script
    $parrot_version
);
use lib qw( lib );
use Parrot::Configure::Options::Conf qw(
    $script
    $parrot_version
    print_help
    print_version
);
use Parrot::Configure::Options::Conf::Shared qw(
    @shared_valid_options
);
use Parrot::Configure::Step::List qw( get_steps_list );

our @valid_options = ( 'ask', @shared_valid_options );

my %short_circuits = (
    help    => \&print_help,
    version => \&print_version,
);

our %options_components = (
    'valid_options'  => \@valid_options,
    'script'         => $script,
    'short_circuits' => \%short_circuits,
    'conditionals'   => \&conditional_assignments,
);

sub conditional_assignments {
    my $argsref = shift;
    $argsref->{debugging} = 1
        unless ( ( exists $argsref->{debugging} ) && !$argsref->{debugging} );
    $argsref->{maintainer} = 1
        if defined $argsref->{lex}
            or defined $argsref->{yacc};
    my @steps_list = get_steps_list();
    return ( $argsref, [ @steps_list ] );
}

1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Configure::Options::Conf::CLI - Options processing functionality for
Parrot's standard command-line interface

=head1 SYNOPSIS

    use Parrot::Configure::Options::Conf::CLI qw(
        @valid_options
        $script
        %options_components
        $parrot_version
    );

=head1 DESCRIPTION

This package exports four variables on demand.

    %options_components
    @valid_options
    $script
    $parrot_version

Typically, only one of these -- C<%options_components> -- is directly imported
by Parrot::Configure::Options for use in the case where options are supplied
to F<Configure.pl> on the command-line.  But all five are, in principle,
importable by other packages.

=head2 C<%options_components>

    %options_components = (
        'valid_options'  => \@valid_options,
        'script'         => $script,
        'short_circuits' => \%short_circuits,
        'conditionals'   => \&conditional_assignments,
    );

Hash with four elements keyed as follows:

=over 4

=item * C<valid_options>

Reference to an array holding a list of options are valid when configuring
Parrot via the Configuration-File interface.  The options are documented
when you call C<perl Configure.pl --help>. C<--ask> is excluded because if you
know enough about what options you want to put them in a file, you should be
past the point of needing interactive configuration.

=item * C<script>

Defaults to string 'Configure.pl', but may be overridden for testing purposes.

=item * C<short_circuits>

Reference to a hash with two elements:

=over 4

=item * C<help>

Reference to subroutine C<print_help>, which prints F<Configure.pl>'s help
message.  Since this subroutine is shared with another package, it is
actually imported from Parrot::Configure::Options::Conf.

=item * C<version>

Reference to subroutine C<print_version>, which prints F<Configure.pl>'s
version number.  Since this subroutine is shared with another package, it is
actually imported from Parrot::Configure::Options::Conf.

=back

=item * C<conditionals>

Reference to a subroutine private to this package which:

=over 4

=item *

Sets default values for the C<debugging> and C<maintainer> options under most
situations.

=item *

Fetches the list of configuration steps from the configuration file.

=back

The subroutine takes a single argument:  a reference to a hash holding
elements concerned with configuration, such as the valid options.

The subroutine returns a two-argument list:

=over 4

=item *

An augmented version of the hash reference passed in as an argument.

=item *

Reference to array holding list of configuration steps.

=back

That's probably difficult to understand at first.  So here is an example of
how C<$options_components-E<gt>{conditionals}> is actually used inside
C<Parrot::Configure::Options::process_options()>.

    my $data;
    # $data is hash ref which gets assigned some key-value pairs
    my $steps_list_ref;
    ($data, $steps_list_ref) =
        &{ $options_components->{conditionals} }($data);

=back

=head1 NOTES

The functionality in this package originally appeared in F<Configure.pl>.  It
was transferred here and adapted for configuration by file  by James E Keenan.

=head1 SEE ALSO

F<Configure.pl>. Parrot::Configure::Options.  Parrot::Configure::Options::Conf.
Parrot::Configure::Options::Reconf.  Parrot::Configure::Options::Conf::CLI.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
