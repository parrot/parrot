package Miniperl;

use Data::Dumper;

use Miniperl::Tokenizer qw(tokenize);
use Miniperl::Parser qw(parse);
use Miniperl::Generator;

sub new {
  my ($class,$file) = @_;
  bless {
    file => $file
  },$class;
}

sub compile {
  my $self = shift;
  $self->{tokens} = tokenize($self->{file});
#print Dumper($self->{tokens});exit;
  my $parser = Miniperl::Parser->new();
  $self->{tree} = $parser->parse($self->{tokens});
print Dumper($self->{tree});exit;
  Miniperl::Generator->new($self->{tree})->generate();
}

1;
