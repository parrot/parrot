package Scheme;

use strict;

use Data::Dumper;

use Scheme::Tokenizer qw(tokenize);
use Scheme::Parser qw(parse);
use Scheme::Generator qw(generate);
use Scheme::Builtins;

sub new {
  my ($class,$file) = @_;
  bless { file => $file },$class;
}

sub link_functions {
  my $main = shift;

  my @function = ( $main );
  my @missing = @{$main->{functions}};
  my @provides = keys %{$main->{scope}};

  my $code = $main->{code};

  while (@missing) {
    my $miss = shift @missing;

    my $link = Scheme::Builtins->generate($miss);

    push @function, $miss;

    if ($link->{functions}) {
      push @missing, $link->{functions};
    }

    # XXX: Move Generator::_format_columns to own class
    Scheme::Generator::_format_columns($link);
    $code .= $link->{code};
  }

  $code;
}

sub compile {
  my $self = shift;
  $self->{tokens} = tokenize($self->{file});
  $self->{tree}   = parse($self->{tokens});
  $self->{code}   = link_functions(generate($self->{tree}));

  print $self->{code};
}

1;
