# $Id$

package Scheme;

use strict;

use Data::Dumper;

use Scheme::Tokenizer();
use Scheme::Parser();
use Scheme::Generator();
use Scheme::Builtins;

=head1 SUBROUTINES

=head2 new

A constructor

=cut

sub new {
  my ($class, $file) = @_;

  bless { file => $file },$class;
}


=head2 link_functions

Generate PASM.

=cut

sub link_functions {
  my ( $main ) = @_;

  my @function = ( $main );
  my @missing = @{$main->{functions}};
  my @provides = keys %{$main->{scope}};

  my $code = $main->{code};
  my $header = << 'END_HEADER';
# Header information
    # new_pad 0
END_HEADER

  while (@missing) {
    my $miss = shift @missing;

    my $link = Scheme::Builtins->generate($miss);
    $header .= << "END";
        newsub P16, .Sub, ${miss}_ENTRY
        store_lex 0, "$miss", P16
END

    push @function, $miss;

    if ($link->{functions}) {
      push @missing, $link->{functions};
    }

    # XXX: Move Generator::_format_columns to own class
    Scheme::Generator::_format_columns($link);
    $code .= $link->{code};
  }

  return $header . $code;
}


=head2 compile

This is called in schemec.

=cut

sub compile {
  my $self = shift;

  $self->{tokens} = Scheme::Tokenizer::tokenize($self->{file});
  $self->{tree}   = Scheme::Parser::parse($self->{tokens});
  $self->{code}   = link_functions(Scheme::Generator::generate($self->{tree}));

  return $self->{code};
}

1;
