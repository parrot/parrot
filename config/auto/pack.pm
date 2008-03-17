# Copyright (C) 2001-2008, The Perl Foundation.
# $Id$

=head1 NAME

config/auto/pack.pm - Packing

=head1 DESCRIPTION

Figures out how to C<pack()> Parrot's types.

=cut

package auto::pack;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

sub _init {
    my $self = shift;

    return { description => q{Figuring out how to pack() Parrot's types},
             result      => q{},
           };
}

sub runstep {
    my ( $self, $conf ) = @_;

    #
    # Alas perl5.7.2 doesn't have an INTVAL flag for pack().
    # The ! modifier only works for perl 5.6.x or greater.
    #

    my $intsize  = $conf->data->get('intsize');
    my $longsize = $conf->data->get('longsize');
    my $ptrsize  = $conf->data->get('ptrsize');

    foreach ( 'intvalsize', 'opcode_t_size' ) {
        my $which = $_ eq 'intvalsize' ? 'packtype_i' : 'packtype_op';
        my $size = $conf->data->get($_);
        my $format;
        if (    $size == $longsize
             && $size == $conf->data->get_p5('longsize')
           ) {
            $format = 'l!';
        }
        elsif ( $size == 4 ) {
            $format = 'l';
        }
        elsif (    $size == 8
                || $conf->data->get_p5('use64bitint') eq 'define'
              ) {
            # pp_pack is annoying, and this won't work unless sizeof(UV) >= 8
            $format = 'q';
        }
        warn "Configure.pl:  Unable to find a suitable packtype for $_.\n"
            unless $format;

        my $test = eval { pack $format, 0 };
        unless ( defined $test ) {
            warn <<"AARGH"
Configure.pl:  Unable to find a functional packtype for $_.
               '$format' failed: $@
AARGH
        }
        if ($test) {
            unless ( length $test == $size ) {
                warn sprintf <<"AARGH", $size, length $test;
Configure.pl:  Unable to find a functional packtype for $_.
               Need a format for %d bytes, but '$format' gave %d bytes.
AARGH
            }
        }
        else {
            $format = '?';
        }

        $conf->data->set( $which => $format );
    }

    _set_packtypes($conf);

    # Find out what integer constant type we can use
    # for pointers.
    _set_ptrconst($conf, $ptrsize, $intsize, $longsize);

    return 1;
}

sub _set_packtypes {
    my $conf = shift;

    $conf->data->set(
        packtype_b => 'C',
        packtype_n => ( $conf->data->get('numvalsize') == 12 ? 'D' : 'd' )
    );
}

sub _set_ptrconst {
    my ($conf, $ptrsize, $intsize, $longsize) = @_;

    if ( $intsize == $ptrsize ) {
        $conf->data->set( ptrconst => "u" );
    }
    elsif ( $longsize == $ptrsize ) {
        $conf->data->set( ptrconst => "ul" );
    }
    else {
        warn <<"AARGH";
Configure.pl:  Unable to find an integer type that fits a pointer.
AARGH
    }
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
