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

    my @coda_lines = split /\n/, $CODA;

    my $last_node = $doc->last_element;

    # need to treat __END__ blocks carefully
    if ( $last_node->isa('PPI::Statement::End') ) {
        # look for a =cut, any amount of whitespace, and then the coda
        return if ($last_node =~ m{=cut\s*\Q$CODA\E\n*\z});
        return $self->violation( $desc, $expl, $last_node );
    }
    else {
	for ($last_node = $doc->last_element;
	     $last_node && @coda_lines;
	     $last_node = $last_node->previous_sibling) {

	    # Skip (optional) __DATA__ block...
	    next if ( $last_node->isa('PPI::Statement::Data') );
	    next if ( $last_node->isa('PPI::Token::Whitespace') );
	    last if ( !$last_node->isa('PPI::Token::Comment') );

	    my $last_coda_line = $coda_lines[-1];
	    my $last_actual_line = $last_node->content;
	    chomp $last_actual_line;
	    last if ( $last_coda_line ne $last_actual_line );
	    pop @coda_lines;
	}
    }

    return if ( !@coda_lines ); # We made it through all the coda lines
    return $self->violation( $desc, $expl, $last_node || $doc );
}

1;

# How meta! We ourselves must have this coda to be a valid perl file in the
# parrot repository...

__END__

=head1 NAME

Perl::Critic::Policy::CodeLayout::UseParrotCoda

=head1 DESCRIPTION

The pumpking has declared that all parrot source code must include a series of
comments at the end of the source. These comments may be followed by optional
whitespace and a C<__DATA__> block.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
