# Copyright (C) 2001-2011, Parrot Foundation.

package Parrot::Configure::Options;

use strict;
use warnings;
use base qw( Exporter );
our @EXPORT_OK = qw(
    process_options
);
use Carp;
use lib qw( lib );
use Parrot::Configure::Options::Conf::CLI ();
use Parrot::Configure::Options::Conf::File ();
use Parrot::Configure::Options::Reconf ();

sub process_options {
    my $argsref = shift;

    croak "'mode' argument not provided to process_options()"
        unless defined $argsref->{mode};

    my ($options_components, $script);
    ($argsref, $options_components, $script) =
        _process_options_components($argsref);

    my ($data, $short_circuits_seen_ref) =
        _initial_pass($argsref, $options_components, $script);

    if (@{ $short_circuits_seen_ref }) {
        # run all the short circuits
        foreach my $sc (@{ $short_circuits_seen_ref }) {
            &{ $options_components->{short_circuits}{$sc} };
        }
        return;
    }
    else {
        if ($argsref->{mode} eq 'file' or $argsref->{mode} eq 'configure') {
            my $steps_list_ref;
            ($data, $steps_list_ref) =
                &{ $options_components->{conditionals} }($data);
            return ($data, $steps_list_ref);
        }
        else {
            $data = &{ $options_components->{conditionals} }($data);
            return $data;
        }
    }
}

sub _process_options_components {
    my $argsref = shift;
    my %options_components;
    if ( $argsref->{mode} =~ m/^reconfigure$/i ) {
        %options_components =
            %Parrot::Configure::Options::Reconf::options_components;
    }
    elsif ( $argsref->{mode} =~ m/^file$/i ) {
        %options_components =
            %Parrot::Configure::Options::Conf::File::options_components;
    }
    elsif ( $argsref->{mode} =~ m/^configure$/i ) {
        %options_components =
            %Parrot::Configure::Options::Conf::CLI::options_components;
    }
    else {
        croak "Invalid value for 'mode' argument to process_options()";
    }
    $argsref->{argv} = [] unless defined $argsref->{argv};

    my $script =
          $options_components{script}
        ? $options_components{script}
        : croak "Must provide value for 'script'";
    return ($argsref, \%options_components, $script);
}

sub _initial_pass {
    my ($argsref, $options_components, $script) = @_;
    my %valid_opts =
        map { $_, 1 } @{ $options_components->{valid_options} };
    my $data = {};
    my @short_circuits_seen = ();
    for my $el ( @{ $argsref->{argv} } ) {
        my ( $key, $value );
        if ($el =~ m/--([-\w]+)(?:=(.*))?/) {
            ( $key, $value ) = ($1, $2);
        }
        $key   = 'help' unless defined $key;
        $value = 1      unless defined $value;

        unless ( $valid_opts{$key} ) {
            die qq/Invalid option "$key". See "perl $script --help" for valid options\n/;
        }
        if ( $options_components->{short_circuits}{$key} ) {
            push @short_circuits_seen, $key;
        }
        $data->{$key} = $value;
    }
    return ($data, \@short_circuits_seen);
}

1;

#################### DOCUMENTATION ####################

=head1 NAME

Parrot::Configure::Options - Process command-line options to F<Configure.pl>

=head1 SYNOPSIS

    use Parrot::Configure::Options qw( process_options );

    $args = process_options( {
        mode => q{configure},
        argv => [@ARGV],
    } );

=head1 DESCRIPTION

Parrot::Configure::Options exports on demand the subroutine
C<process_options()>, which processes the command-line options provided to
F<Configure.pl> or to F<tools/dev/reconfigure.pl>.

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

    mode    : 'configure', 'reconfigure' or 'file'
    argv    : reference to @ARGV; defaults to []

=item * Return Value

=over 4

=item * C<--version> or C<--help> options

Bare return (C<undef>).

=item * All other options

Reference to a hash of option names and values.

=back

=item * Comment

The C<mode> element in the argument to C<process_options()> should be set
according to the following rules:

=over 4

=item *  C<configure>

Command-Line Interface:  Initial Parrot configuration with zero or more
command-line options (other than the C<--file> option).  This is the most
typical case.  See F<Configure.pl> or any test file simulating the
functionality of F<Configure.pl> in the F<t/configure/> or F<t/steps/>
directories.

=item * C<file>

Configuration-File Interface:  Initial Parrot configuration where the options
are stored in a configuration file whose location is the value of the sole
command-line option C<--file>.

=item * C<reconfigure>

After F<Configure.pl> has completed, some Parrot developers need to rerun a
particular configuration step (typically, C<gen::makefiles>) to debug
revisions.  F<tools/dev/reconfigure.pl> with the F<--step=step::class> option
does this and internally calls C<process_options()> in C<reconfigure> mode.

=back

=back

=head1 NOTES

The functionality in this package originally appeared in F<Configure.pl>.  It
was transferred here and refactored by James E Keenan.

=head1 SEE ALSO

F<Configure.pl>. Parrot::Configure::Options::Conf.
Parrot::Configure::Options::Reconf.  Parrot::Configure::Options::Conf::CLI.
Parrot::Configure::Options::Conf::File.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
