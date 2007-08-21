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

    my $ccflags = $conf->option_or_data( 'ccflags');
    my $tryflags = "$ccflags -D$attr";

    my $command_line = Parrot::Configure::Step::_build_compile_command( $cc, $tryflags );
    $verbose and print "  ", $command_line, $/;

    # Don't use cc_build, because failure is expected.
    my $exit_code = Parrot::Configure::Step::_run_command(
        $command_line, $output_file, $output_file );
    $verbose and print "  exit code: $exit_code$/";

    $conf->data->set( $attr => !$exit_code | 0 );

    return if $exit_code;

    my $output = _slurp_file( $output_file );
    $verbose and print "  output: $output$/";

    if ( $output !~ /error|warning/i ) {
        $conf->data->set( ccflags => $tryflags );
    }

    return;
}


# Stolen from Parrot::Test
# Should be put somewhere more central
sub _slurp_file {
    my ($file_name) = @_;

    open( my $SLURP, '<', $file_name ) or die "open '$file_name': $!";
    local $/ = undef;
    my $file = <$SLURP> . '';
    $file =~ s/\cM\cJ/\n/g;
    close $SLURP;

    return $file;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
