# Copyright (C) 2007, The Perl Foundation.
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
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';
use Parrot::BuildUtil;

$description = 'Detecting compiler attributes (-DHASATTRIBUTE_xxx)';

@args = qw( cc verbose define );

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
    HASATTRIBUTE_NEVER_WORKS
);

our $verbose;


sub runstep {
    my ( $self, $conf ) = @_;

    $verbose = $conf->options->get( 'verbose' );
    print $/ if $verbose;

    for my $maybe_attr ( @potential_attributes ) {
        $self->try_attr( $conf, $maybe_attr );
    }
    return $self;
}

sub try_attr {
    my ( $self, $conf, $attr ) = @_;

    my $output_file = 'test.cco';

    $verbose and print "trying attribute '$attr'$/";

    my $cc = $conf->option_or_data( 'cc' );
    cc_gen('config/auto/attributes/test_c.in');

    my $disable_warnings = '';
    # work around msvc warning for unused variable
    if ( defined $conf->option_or_data( 'msvcversion' ) ) {
        $disable_warnings = '-wd4101';
    }

    my $ccflags = $conf->data->get( 'ccflags' );
    my $tryflags = "$ccflags -D$attr $disable_warnings";

    my $command_line = Parrot::Configure::Step::_build_compile_command( $cc, $tryflags );
    $verbose and print "  ", $command_line, $/;

    # Don't use cc_build, because failure is expected.
    my $exit_code = Parrot::Configure::Step::_run_command(
        $command_line, $output_file, $output_file );
    $verbose and print "  exit code: $exit_code$/";

    $conf->data->set( $attr => !$exit_code | 0 );

    return if $exit_code;

    my $output = Parrot::BuildUtil::slurp_file( $output_file );
    $verbose and print "  output: $output$/";

    if ( $output !~ /error|warning/i ) {
        $conf->data->set( ccflags => $tryflags );
        my $ccflags = $conf->data->get( "ccflags" );
        $verbose and print "  ccflags: $ccflags$/";
    }

    return;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
