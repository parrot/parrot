package Tokenizer;

use strict;
use vars qw($VERSION);

$VERSION = '0.02';

#------------------------------------------------------------------------------

sub new {
  my $class = shift;
  my $self = { };
  if(defined $_[0]) {
    unless(open FILE,"< $_[0]") {
      print STDERR "Could not open < $_[0]: $!\n";
      return undef;
    }
    $self->{text} = join '',<FILE>;
    close FILE;
  }
  bless $self,$class;
}

#------------------------------------------------------------------------------

sub tokenize {
  my $self = shift;
  $self->{text} = $_[0] || return [];

  my $tokref = [];
  my $in_quote = 0;
  for my $ch (split //,$self->{text}) {
    if($ch =~ /^['"]/) {
      if($in_quote) {
        $tokref->[-1] .= $ch;
        $in_quote = 0 unless $tokref->[-1] =~ /\\['"]$/;
      }
      else {
        push @$tokref,$ch;
        $in_quote = 1;
      }
      next;
    }
    elsif($in_quote) {
      $tokref->[-1] .= $ch;
      next;
    }

    if($ch =~ /^[-+\/\*%]/) {
      if($tokref->[-1] and $tokref->[-1] eq '^') {
        $tokref->[-1] .= $ch;
        next;
      }
    }
    elsif($ch =~ /^[{\[;\$\@\%\]}^]/) {
    }
    elsif($ch eq '=') {
      if($tokref->[-1] =~ /^[-+\/*^%]/) {
        $tokref->[-1] .= $ch;
        next;
      }
    }
    elsif($ch eq '.') {
      if($tokref->[-1] =~ /^-?\d/) {
        $tokref->[-1] .= $ch;
        next;
      }
    }
    elsif($ch =~ /\s/) {
      next;
    }
    elsif($ch =~ /\d/) {
      if(@$tokref and $tokref->[-1] =~ /^\d/) {
        $tokref->[-1] .= $ch;
        next;
      }
    }
    elsif($ch =~ /\w/) {
      if(@$tokref and $tokref->[-1] =~ /^(\w|\$|\@|\%)/) {
        $tokref->[-1] .= $ch;
        next;
      }
    }
    push @$tokref,$ch;
  }
  $tokref;
}

1;
__END__

=head1 NAME

Miniperl::Tokenizer - Miniperl6 tokenizer

=head1 SYNOPSIS

  use Miniperl::Tokenizer;
  my $tok = Miniperl::Tokenizer->new([$file_name]); # Optional file name
  $out_aref = $tok->tokenize([$string]); # Optional string

=head1 DESCRIPTION

The tokenizer takes either a text string (directly in tokenize()) or a file
in the new() member function. This gets broken into perl6 tokens.

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

parrot(1).

=cut
