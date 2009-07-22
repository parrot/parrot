# Copyright (C) 2001-2007, Parrot Foundation.
# $Id$

=head1 NAME

config/auto/gc.pm - Garbage Collection

=head1 DESCRIPTION

Sets memory allocator.

Currently, we have only one choice:  the memory allocator in
F<src/gc/alloc_resources.c>.

In the future, we will have a C<--gc> command-line option which will enable
the configurer to choose among the default and:

=over 4

=item C<libc>

Use the C library C<malloc> along with F<src/gc/res_lea.c>.
This doesn't currently work.  See [perl #42774].

=item C<malloc>

Use the malloc in F<src/gc/malloc.c> along with F<src/gc/res_lea.c>.
Since this uses res_lea.c, it doesn't currently work either.  See [perl #42774].

=item C<malloc-trace>

Use the malloc in F<src/gc/malloc-trace.c> with tracing enabled, along
with F<src/gc/res_lea.c>.
Since this uses res_lea.c, it doesn't work currently either.  See [perl #42774].

=back

=cut

package auto::gc;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils ':auto';

sub _init {
    my $self = shift;
    my %data;
    $data{description} = q{Determine allocator to use};
    $data{result}      = q{};
    return \%data;
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $gc = 'gc';

    $conf->data->set(
        TEMP_gc_c => <<"EOF",
\$(SRC_DIR)/gc/alloc_resources\$(O):	\$(GENERAL_H_FILES) \$(SRC_DIR)/gc/alloc_resources.c
EOF
        TEMP_gc_o => "\$(SRC_DIR)/gc/alloc_resources\$(O)",
        gc_flag   => '',
    );
    print(" ($gc) ") if $conf->options->get('verbose');

    return 1;
}

1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
