# Copyright (C) 2007-2008, Parrot Foundation.
package Parrot::Configure::Options::Conf::File;

use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    @valid_options
    $script
    %options_components
    $parrot_version
);
use File::Spec;
use lib qw( lib );
use Parrot::BuildUtil;
use Parrot::Configure::Options::Conf qw(
    $script
    $parrot_version
    print_help
    print_version
);
use Parrot::Configure::Options::Conf::Shared qw(
    @shared_valid_options
);

our @valid_options = qw{
    help
    file
    test
    version
};

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
    my $data = shift;
    $data->{debugging} = 1;
    $data->{maintainer} = undef;
    my %valid_step_options = map {$_ => 1} @shared_valid_options;
    my $file_str = Parrot::BuildUtil::slurp_file($data->{file});
    my $steps_list_ref;
    if ($file_str =~ m/=variables\s*?\n
        (.*?)
        \s*\n
        =general\s*?\n
        (.*?)
        \s*\n
        =steps\s*?\n
        (.*?)
        \s*\n
        =cut
        /sx ) {
        my ($variables, $general, $steps) = ($1,$2,$3);
        my $substitutions = _get_substitutions($variables);
        $data = _set_general($data, $substitutions, $general,
            \%valid_step_options);
        ($data, $steps_list_ref) =
            _set_steps($data, $steps, \%valid_step_options);
    }
    else {
        die "Configuration file $data->{file} did not parse correctly: $!";
    }
    return ($data, $steps_list_ref);
}

sub _get_substitutions {
    my $variables = shift;
    my @variables = split /\n/, $variables;
    my %substitutions;
    foreach my $v (@variables) {
        next unless $v =~ m/^(\w+)=([^=]+)$/;
        my ($k, $v) = ($1, $2);
        $substitutions{$k} = $v;
    }
    return \%substitutions;
}

sub _set_general {
    my ($data, $substitutions, $general, $optsref) = @_;
    my @general = split /\n/, $general;
    foreach my $g (@general) {
        next unless $g =~ m/^([-\w]+)(?:=(\$?[^\s\$]+))?$/;
        my ($k, $v, $prov, $var);
        if ($2) {
            ($k, $prov) = ($1, $2);
            if ($prov =~ m/^\$(.+)/) {
                $var = $1;
                if ($substitutions->{$var}) {
                    $v = $substitutions->{$var};
                }
                else {
                    die "Bad variable substitution in $data->{file}: $!";
                }
            }
            else {
                $v = $prov;
            }
        }
        else {
            $k = $1;
            $v = 1;
        }
        if (! $optsref->{$k}) {
            die "Invalid general option $k in $data->{file}: $!";
        }
        else {
            $data->{$k} = $v;
        }
    }
    return $data;
}

sub _set_steps {
    my ($data, $steps, $optsref) = @_;
    my @steplines = split /\n/, $steps;
    my @steps_list = ();
    LINE: foreach my $line (@steplines) {
        next unless ($line =~ /^(\w+::\w+)(?:\s+([-=\w]+\s+)*([-=\w]+))?$/);
        my $step = $1;
        push @steps_list, $step;
        next LINE unless $3;
        my $opts_string = $2 ? qq{$2$3} : $3;
        my @opts = split /\s+/, $opts_string;
        foreach my $el (@opts) {
            my ( $key, $value ) = $el =~ m/([-\w]+)(?:=(.*))?/;
            unless ( $optsref->{$key} ) {
                die qq/Invalid option "$key". See "perl Configure.pl --help" for options valid within a configuration file\n/;
            }
            # This will have to be fixed to allow for possibility that >1 step
            # might be declared a verbose-step or a fatal-step.
            $value = $step if $key eq 'verbose-step';
            $value = $step if $key eq 'fatal-step';
            $value = 1 unless defined $value;
            $data->{$key} = $value;
        }
    }
    return ($data, \@steps_list);
}

1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Configure::Options::Conf::File - Options processing functionality for
Parrot's configuration-file interface

=head1 SYNOPSIS

    use Parrot::Configure::Options::Conf::File qw(
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
Parrot via the traditional Command-Line interface.  The options are documented
when you call C<perl Configure.pl --help> and include C<--ask> to request
interactive configuration.

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

Fetches the list of configuration steps from Parrot::Configure::Step::List.
When you configure with the Command-Line Interface, you use the canonical list
of configuration steps provided by that package.

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
was transferred here and refactored by James E Keenan.

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
