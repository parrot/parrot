# Copyright (C) 2008, The Perl Foundation.
# $Id: $

=head1 NAME

config/gen/call_list.pm - Concatenate call_list.txt (NCI signatures) fragments

=head1 DESCRIPTION

Some portions of F<src/call_list.txt> (the NCI signature list) are generated,
and others should only appear when certain features/libraries are enabled by
Configure in previous steps.  This step simply combines all fragments that
appear in F<config/gen/call_list/> into the single C<src/call_list.txt> used
by the main build.

If a config step wishes to make its fragment optional, that step should only
generate or copy its fragment to F<config/gen/call_list/> when the library is
enabled.

=cut

package gen::call_list;

use strict;
use warnings;

use base qw(Parrot::Configure::Step);

use Parrot::Configure::Utils '_slurp';


sub _init {
    my $self = shift;

    return {
        description  => q{Generating NCI signature list},
        result       => q{},
    }
}

sub runstep {
    my ( $self, $conf ) = @_;

    my $combined_file  = 'src/call_list.txt';
    my @fragment_files = sort glob 'config/gen/call_list/*.in';

    open my $combined, '>', $combined_file
        or die "Could not open '$combined_file' for write: $!";

    foreach my $fragment_file (@fragment_files) {
        my $fragment =  _slurp($fragment_file);
           $fragment =~ s/^\s*\n//;
           $fragment =~ s/\s*$/\n\n/;

        print $combined $fragment;
    }

    $conf->append_configure_log($combined_file);

    return 1;
}


1;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
