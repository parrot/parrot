package Miniperl::Tokenizer;

use strict;
use vars qw($VERSION @ISA @EXPORT_OK);

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
    $text .= $_;
  }
  close SOURCE;

  for my $ch (split //,$text) {
    if($ch =~ /[()]/ or
       $ch =~ /[+*]/ or
       $ch eq '/' or
       $ch eq '[' or
       $ch eq ']' or
       $ch eq ';') {
      push @$tokref,$token;
      $token = $ch;
    } elsif($token =~ /^(['"])/ and
            $ch    eq $1) {
      $token .= $ch;
      push @$tokref,$token;
      $token = '';
    } elsif($token =~ /^(['"])/ and
            $ch    ne $1) {
      $token .= $ch;
    } elsif($ch =~ /[\$@%]/) {   # Scalars must start with a '$' sigil
      push @$tokref,$token;
      $token = $ch;
    } elsif($ch    =~ /^[a-zA-Z]/ and # Alpha can be an ident
            $token =~ /^[\$@%]/) {  # But idents are after sigils
      $token .= $ch;
    } elsif($ch    eq '-' and
            $token =~ /^[-]\d+(\.\d+)?[eE]/) { # Dashes could be a neg. expt
      $token .= $ch;
    } elsif($ch    eq '=' and
            $token =~ /^[<>]/) {  # Equal sign can follow '<','>'
      $token .= $ch;
    } elsif($ch eq '.' and
            $token =~ /^\d+$/ or  # Decimal point can follow digits
            $token =~ /^-\d+$/) { # Decimal point can follow a dash
      $token .= $ch;
    } elsif($ch     =~ /\d/ and
            ($token =~ /^[-]/ or  # Digits can follow a dash
             $token =~ /^\./  or  # Digits can follow a decimal point
             $token =~ /^\d/)) {  # Digits can follow other digits
      $token .= $ch;
    } elsif($ch    =~ /[a-zA-Z]/ and
            $token =~ /^\w/) {    # Letters can follow other letters
      $token .= $ch;
    } elsif($ch    =~ /\s/ and
            $token =~ /^\s/) {    # White can follow white
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

Jeffrey Goff, jgoff@speakeasy.net

=head1 SEE ALSO

L<Scheme>, L<Scheme::Parser>, L<Scheme::Generator>

=cut
