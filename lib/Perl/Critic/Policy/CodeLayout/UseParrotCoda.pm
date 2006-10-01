# $Id#
package Perl::Critic::Policy::CodeLayout::UseParrotCoda;

use strict;
use warnings;
use Perl::Critic::Utils;
use Perl::Critic::Violation;
use base 'Perl::Critic::Policy';

our $VERSION = '0.1';
$VERSION = eval $VERSION;    ## no critic

my $desc = q{Missing properly located perl coda for parrot source};
my $expl = q{According to PDD07, all perl source in parrot must contain a comment coda};

#----------------------------------------------------------------------------

sub default_severity { return $SEVERITY_LOW }
sub applies_to       { return 'PPI::Document' }

#----------------------------------------------------------------------------

# The actual coda we're looking for:

our $CODA = <<'END_CODA';
# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
END_CODA

#----------------------------------------------------------------------------

sub violates {
    my ( $self, $elem, $doc ) = @_;

    my @elements = $doc->children();

    my $last_node = pop @elements;

    # Skip (optional) __END__ || __DATA blocks...
    while ( ref $last_node eq 'PPI::Statement::End' || ref $last_node eq 'PPI::Statement::Data' ) {
        $last_node = pop @elements;
    }

    # Skip any (optional) terminating whitespace...
    while ( ref $last_node eq "PPI::Token::Whitespace" ) {
        $last_node = pop @elements;
    }

    # Put back the node we peeked at.
    push @elements, $last_node;

    my @coda_lines = split /\n/, $CODA;

    while (@coda_lines) {
        my $last_coda_line = pop @coda_lines;
        $last_node = pop @elements;
        my $last_actual_line = $last_node->content;
        chomp $last_actual_line;
        if ( $last_coda_line ne $last_actual_line ) {
            my $sev = $self->get_severity();

            return Perl::Critic::Violation->new( $desc, $expl, $last_node, $sev );
        }
    }

    # We made it through all the coda lines, it must be ok.
    return;
}

1;

# How meta! We ourselves must have this coda to be a valid perl file in the
# parrot repository...

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:

__END__

=head1 NAME

Perl::Critic::Policy::CodeLayout::UseParrotCoda

=head1 DESCRIPTION

The pumpking has declared that all parrot source code must include a series of
comments at the end of the source. These comments may be followed by optional
whitespace and a C<__END__> or C<__DATA__> blocks.

=cut
