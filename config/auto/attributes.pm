# Copyright (C) 2007-2010, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/attributes.pm - Attributes detection

=head1 DESCRIPTION

Automagically detect what attributes, like HASATTRIBUTE_CONST, that
the compiler can support.

=cut

package auto::attributes;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ();
use Parrot::BuildUtil;

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Detect compiler attributes};
    $data{result}      = q{};
    return \%data;
}

our @potential_attributes = qw(
    HASATTRIBUTE_CONST
    HASATTRIBUTE_DEPRECATED
    HASATTRIBUTE_FORMAT
    HASATTRIBUTE_MALLOC
    HASATTRIBUTE_NONNULL
    HASATTRIBUTE_NORETURN
    HASATTRIBUTE_PURE
    HASATTRIBUTE_UNUSED
    HASATTRIBUTE_WARN_UNUSED_RESULT
    HASATTRIBUTE_HOT
    HASATTRIBUTE_COLD
    HASATTRIBUTE_NEVER_WORKS
);
# HASATTRIBUTE_NEVER_WORKS is at the end just to prove that it's possible to fail.

sub runstep {
    my ( $self, $conf ) = @_;

    $conf->debug("\n");

    for my $maybe_attr (@potential_attributes) {
        $self->try_attr( $conf, $maybe_attr);
    }
    return 1;
}

sub try_attr {
    my ( $self, $conf, $attr ) = @_;

    my $output_file = 'test.cco';

    $conf->debug("trying attribute '$attr'\n");

    my $cc = $conf->option_or_data('cc');
    $conf->cc_gen('config/auto/attributes/test_c.in');

    my $disable_warnings = '';

    # work around msvc warning for unused variable
    if ( defined $conf->option_or_data('msvcversion') ) {
        $disable_warnings = '-wd4101';
    }

    my $ccflags  = $conf->data->get('ccflags');
    my $tryflags = "$ccflags -D$attr $disable_warnings";

    my $command_line = Parrot::Configure::Utils::_build_compile_command( $cc, $tryflags );
    $conf->debug("  ", $command_line, "\n");

    # Don't use cc_build, because failure is expected.
    my $exit_code =
        Parrot::Configure::Utils::_run_command( $command_line, $output_file, $output_file );
    $conf->debug("  exit code: $exit_code\n");

    $conf->cc_clean();
    $conf->data->set( $attr => !$exit_code | 0 );

    if ($exit_code) {
        unlink $output_file or die "Unable to unlink $output_file: $!";
        $conf->debug("Rejecting bogus attribute:  $attr\n");
        return;
    }

    my $output = Parrot::BuildUtil::slurp_file($output_file);
    $conf->debug("  output: $output\n");

    if ( $output !~ /error|warning/i ) {
        $conf->data->set( ccflags => $tryflags );
        my $ccflags = $conf->data->get("ccflags");
        $conf->debug("  ccflags: $ccflags\n");
    }
    unlink $output_file or die "Unable to unlink $output_file: $!";

    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
