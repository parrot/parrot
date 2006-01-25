# Copyright: 2004-2005 The Perl Foundation.  All Rights Reserved.
# $Id: $

=head1 NAME

Parrot::PIR::Formatter - Given ugly PIR, format it nicely.

=head1 SYNOPSIS

 use Parrot::PIR::Formatter;

=head1 DESCRIPTION

Primarily intended to be used by C<pirtidy.pl>. Given some ugly PIR,
format it nicely.

=head2 Functions

=cut

package Parrot::PIR::Formatter;

use strict;

=head2 Class Methods

=over

=item $self = C<new([code])>

Returns C<$self> as a new instance.

=cut

sub new {
    my $class = shift;
    my $code = shift;

    my $self = {};

    $self->{indent} = " " x2;
    $self->{raw_pir} = [ split /\n/, $code ];

    bless($self,$class);
    return $self;
}

=back

=head2 Instance Methods

=over

=item C<add_pir($code, $code, ...)>

Add more pir to be processed. 

=cut

sub add_pir {
    my ($self, @code) = @_;

    foreach my $chunk (@code) {
      my @lines = split /\n/, $_;
      push @{$self->{raw_pir}}, @lines; 
    }
}

=item C<$code = format()>

Return the nicely formatted code for the raw PIR that's been provided.

=for XXX

Many things to muck with line could be done here:

 o remove extraneous spaces.
 o add in "proper" spacing (after commas, etc.)
 o turn opcode, <OUT>, <IN> into <OUT> = opcode <IN>
 o heredocs could be treated as blocks to set them off visually.
 o could remove explicit declarations of string type when not needed.
 o could add in single quotes wrapping .sub names.
 o could convert double to single quotes when possible.
 o could fixup Pmc vs. .Pmc
 o could convert strings with embedded newlines to heredocs.

Or not. =-)

=cut

my $block_begin = qr{
  (
    ^\.sub
    |
    ^push_eh
  )
}smx;

my $block_end = qr{
  (
    ^\.end$
    |
    ^clear_eh$
  )
}smx;

sub format {
    my ($self) = shift;

    my $level = 0;  
    my $result;

    foreach my $line (@{$self->{raw_pir}}) {
      $line =~ s{^\s+}{};
      $line =~ s{\s+$}{};

      next if $line eq "";

      $level-- if $line =~ $block_end;
      $result.= "\n" if $line =~ $block_begin;

      if ($line =~ m{:$}) {
        # label
        $result .= "\n$line\n";
      } else {
        # code
        $result .=  ($self->{indent} x $level) . $line . "\n";
      }

      $level++ if $line =~ $block_begin;
      $result.= "\n" if $line =~ $block_end;
    }

    return $result;
}

=back

=head1 BUGS

Does not play well with heredocs. No tests. Should arguably be part of IMCC,
which already knows how to parse PIR.

=cut

# vim: expandtab shiftwidth=4:
1;
