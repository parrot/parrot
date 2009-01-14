# Copyright (C) 2007-2008, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/warnings.pm - Warning flags detection

=head1 DESCRIPTION

Automagically detect what warning flags, like -Wall, -Wextra,
-Wchar-subscripts, etc., that the compiler can support.  Directly hacked
from F<config/auto/attributes.pm>.

=head1 SUBROUTINES

=over 4

=cut

package auto::warnings;

use strict;
use warnings;


use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ();
use Parrot::BuildUtil;

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Detect supported compiler warnings};
    $data{result}      = q{};

    # Please keep these sorted by flag name, such that "-Wno-foo" is
    # sorted as "-Wfoo", so we can turn off/on as needed.
    my @potential_warnings = qw(
        -falign-functions=16
        -fvisibility=hidden
        -funit-at-a-time
        -maccumulate-outgoing-args
        -W
        -Wall
        -Waggregate-return
        -Wcast-align
        -Wcast-qual
        -Wchar-subscripts
        -Wcomment
        -Wdisabled-optimization
        -Wendif-labels
        -Wextra
        -Wformat
        -Wformat-extra-args
        -Wformat-nonliteral
        -Wformat-security
        -Wformat-y2k
        -Wimplicit
        -Wimport
        -Winit-self
        -Winline
        -Winvalid-pch
        -Wlogical-op
        -Wmissing-braces
        -Wmissing-field-initializers
        -Wno-missing-format-attribute
        -Wmissing-include-dirs
        -Wpacked
        -Wparentheses
        -Wpointer-arith
        -Wreturn-type
        -Wsequence-point
        -Wno-shadow
        -Wsign-compare
        -Wstrict-aliasing
        -Wstrict-aliasing=2
        -Wswitch
        -Wswitch-default
        -Wtrigraphs
        -Wundef
        -Wunknown-pragmas
        -Wno-unused
        -Wvariadic-macros
        -Wwrite-strings
        -Wnot-a-real-warning
    );
    my @potential_warnings_no_cpp = qw(
        -Wbad-function-cast
        -Wc++-compat
        -Wdeclaration-after-statement
        -Werror=declaration-after-statement
        -Wimplicit-function-declaration
        -Wimplicit-int
        -Wmain
        -Wmissing-declarations
        -Wmissing-prototypes
        -Wnested-externs
        -Wnonnull
        -Wold-style-definition
        -Wstrict-prototypes
    );

    my @cage_warnings = qw(
        -std=c89
        -Werror-implicit-function-declaration
        -Wformat=2
        -Wlarger-than-4096
        -Wlong-long
        -Wmissing-format-attribute
        -Wdeprecated-declarations
        -Wdiv-by-zero
        -Wno-format-extra-args
        -Wno-import
        -Wno-multichar
        -Wno-pointer-sign
        -Wold-style-definition
        -Wunreachable-code
        -Wunused-function
        -Wunused-label
        -Wunused-value
        -Wunused-variable
    );

    my @may_not_even_be_interesting = qw(
        -Wpadded
        -Wredundant-decls
        -Wswitch-enum
        -Wsystem-headers
    );

    my @nice_to_have_but_too_noisy_for_now = qw(
        -pedantic
        -Wconversion
        -Wint-to-pointer-cast
        -Wmissing-noreturn
        -Wshadow
        -Wunused-macros
        -Wunused-parameter
    );

    $data{potential_warnings}        = \@potential_warnings;
    $data{potential_warnings_no_cpp} = \@potential_warnings_no_cpp;
    $data{cage_warnings}             = \@cage_warnings;

    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $verbose = $conf->options->get('verbose');
    print "\n" if $verbose;
    if ( defined $conf->data->get('gccversion') ) {

        # Dirty way of checking if compiling with c++
        my $nocpp = index($conf->data->get('cc'), '++') < 0;

        # add on some extra warnings if requested
        $self->_add_cage_warnings($conf);
        $self->_add_maintainer_warnings($conf);

        # now try out our warnings
        for my $maybe_warning (@{ $self->{potential_warnings} }) {
            $self->try_warning( $conf, $maybe_warning, $verbose );
        }
        if ($nocpp) {
            for my $maybe_warning (@{ $self->{potential_warnings_no_cpp} }) {
                $self->try_warning( $conf, $maybe_warning, $verbose );
            }
        }

        if ($nocpp) {
           $self->set_result("set for gcc");
        }
        else {
           $self->set_result("set for g++");
        }
    }
    else {
        print "Currently we only set warnings if using gcc as C compiler\n"
            if $verbose;
        $self->set_result("skipped");
    }
    return 1;
}

sub _add_cage_warnings {
    my ($self, $conf) = @_;
    push @{ $self->{potential_warnings} }, @{ $self->{cage_warnings} }
        if $conf->options->get('cage');
}

sub _add_maintainer_warnings {
    my ($self, $conf) = @_;
    push @{ $self->{potential_warnings} }, '-Wlarger-than-4096'
        if $conf->options->get('maintainer');
}

=item C<try_warning>

Try a given warning to see if it is supported by the compiler.  The compiler
is determined by the C<cc> value of the C<Parrot::Configure> object passed
in as the first argument to the method (not counting C<$self>.  The warning
to be checked is passed in as the second argument to the method.

Returns true if the warning flag is recognised by the compiler and undef
otherwise.

=cut

sub try_warning {
    my ( $self, $conf, $warning, $verbose ) = @_;

    my $output_file = 'test.cco';

    $verbose and print "trying attribute '$warning'\n";

    my $cc = $conf->option_or_data('cc');
    $conf->cc_gen('config/auto/warnings/test_c.in');

    my $ccflags  = $conf->data->get('ccflags');
    my $tryflags = "$ccflags $warning";

    my $command_line = Parrot::Configure::Utils::_build_compile_command( $cc, $tryflags );
    $verbose and print "  ", $command_line, "\n";

    # Don't use cc_build, because failure is expected.
    my $exit_code = Parrot::Configure::Utils::_run_command(
        $command_line, $output_file, $output_file
    );
    _set_warning($conf, $warning, $exit_code, $verbose);

    $conf->cc_clean();

    if ($exit_code) {
        unlink $output_file or die "Unable to unlink $output_file: $!";
        return;
    }

    my $output = Parrot::BuildUtil::slurp_file($output_file);
    unlink $output_file or die "Unable to unlink $output_file: $!";
    return _set_ccflags($conf, $output, $tryflags, $verbose);
}

sub _set_warning {
    my ($conf, $warning, $exit_code, $verbose) = @_;
    $verbose and print "  exit code: $exit_code\n";
    $conf->data->set( $warning => !$exit_code || 0 );
}

sub _set_ccflags {
    my ($conf, $output, $tryflags, $verbose) = @_;
    $verbose and print "  output: $output\n";

    if ( $output !~ /error|warning|not supported/i ) {
        $conf->data->set( ccflags => $tryflags );
        $verbose and print "  ccflags: ", $conf->data->get("ccflags"), "\n";
        return 1;
    }
    else {
        return 0;
    }
}

=back

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=cut

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
