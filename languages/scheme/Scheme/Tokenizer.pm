package Scheme::Tokenizer;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS);

$VERSION   = '0.01';
@ISA       = qw(Exporter);
@EXPORT_OK = qw(tokenize);

use Data::Dumper;

sub tokenize {
  my $file = shift;
  my $text;
  my $tokref;
  my $token = '';

  open SOURCE,"<$file";
  while(<SOURCE>) {
    next if /^\s*;/;
    s/;.*$//;
    $text .= $_;
  }
  close SOURCE;

  for my $ch (split //,$text) {
    if($ch eq '(' or
       $ch eq ')') {
      push @$tokref,$token;
      $token = $ch;
    } elsif($ch eq '-' and
            ($token =~ /^[a-z]/ or               # Dashes can be in an ident
             $token =~ /^[-]\d+(\.\d+)?[eE]/)) { # Dashes could be a neg. expt
      $token .= $ch;
    } elsif($ch eq '?' and
            $token =~ /^[a-z]/) { # Question marks can follow an identifier
      $token .= $ch;
    } elsif($ch eq '!' and
            $token =~ /^[a-z]/) { # Exclamation marks can follow an identifier
      $token .= $ch;
    } elsif($ch eq '=' and
            $token =~ /^[<>]/) {  # Equal sign can follow '<','>'
      $token .= $ch;
    } elsif($ch eq '.' and
            $token =~ /^\d+$/) {  # Equal sign can follow '<','>'
      $token .= $ch;
    } elsif($ch =~ /\d/ and
            ($token =~ /^[-]/ or  # Digits can follow a dash
             $token =~ /^\./  or  # Digits can follow a decimal point
             $token =~ /^\d/)) {  # Digits can follow other digits
      $token .= $ch;
    } elsif($ch =~ /[a-zA-Z]/ and
            $token =~ /^\w/) {    # Letters can follow other letters
      $token .= $ch;
    } elsif($ch =~ /\s/ and
            $token =~ /^\s/) {    # White can follow white
      $token .= $ch;
    } elsif($ch =~ /@/ and
	    $token =~ /^,$/) {    # token ,@
      $token .= $ch;
    } else {
      push @$tokref,$token;
      $token = $ch;
    }
  }
  return [grep { /\S/ } @$tokref];
}

1;
__END__

=head1 NAME

Scheme::Tokenizer - The Scheme tokenizer

=head1 SYNOPSIS

  use Scheme:Tokenizer;

  my @code = Scheme::Tokenizer->new($file_name)->tokenize();

=head1 DESCRIPTION

The tokenizer takes a file and splits it into tokens.

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

L<Scheme>, L<Scheme::Parser>, L<Scheme::Generator>

=cut
