package Miniperl;

use Data::Dumper;

use Miniperl::Tokenizer;
use Miniperl::Parser;
use Miniperl::Generator;

sub new {
  my ($class,$file) = @_;
  my $self = { file => $file };
  bless $self,$class;
}

sub compile {
  my $self = shift;
  my $tokenizer = Tokenizer->new();
  my $parser    = Parser->new();
  my $generator = Generator->new();

  my $tokenized = $tokenizer->tokenize('$a = 5');
  my $parsed    = $parser->parse($tokenized);
  $self->{code} = $generator->generate($parsed);
  $self->emit;
}

sub emit {
  my $self = shift;
  my $code = $self->{code};

  for(@$code) {
    my $label = shift @$_;
    print "$label: " if $label ne '';
    my $inst = shift @$_;
    print "$inst ";
    print join ", ", @$_;
    print "\n";
  }
}

1;
