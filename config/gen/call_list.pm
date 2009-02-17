# Copyright (C) 2008, Parrot Foundation.
# $Id$

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
    my %data;
    $data{description} = q{Generate NCI signature list};
    $data{result} = q{};
    $data{fragment_files} = [ sort glob 'config/gen/call_list/*.in' ];
    return \%data;
}

my $text_file_coda = <<'CODA';
# Local variables:
#   mode: text
#   buffer-read-only: t
# End:
CODA

sub runstep {
    my ( $self, $conf ) = @_;

    my $combined_file  = 'src/call_list.txt';

    open my $combined, '>', $combined_file
        or die "Could not open '$combined_file' for write: $!";

    # add read-only metadata for the generated file
    print {$combined} "# ex: set ro:\n";

    foreach my $fragment_file ( @{ $self->{fragment_files} } ) {
        my $fragment =  _slurp($fragment_file);
           $fragment =~ s/^\s*\n//;
           $fragment =~ s/\s*$/\n\n/;

        print {$combined} $fragment;
    }
    print {$combined} $text_file_coda;

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
