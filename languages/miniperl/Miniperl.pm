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
  my $tokenizer = Tokenizer->new($self->{file});
  my $parser    = Parser->new();
  my $generator = Generator->new();

  my $tokenized = $tokenizer->tokenize();
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
    my $str = join ", ", @$_;
    $str =~ s/, #/ #/;
    print $str;
    print "\n";
  }
}

1;
