package Scheme;

use Data::Dumper;

use Scheme::Tokenizer qw(tokenize);
use Scheme::Parser qw(parse);
use Scheme::Generator;

sub new {
  my ($class,$file) = @_;
  bless { file => $file },$class;
}

sub compile {
  my $self = shift;
  $self->{tokens} = tokenize($self->{file});
  $self->{tree}   = parse($self->{tokens});
  Scheme::Generator->new($self->{tree})->generate();
}

1;
