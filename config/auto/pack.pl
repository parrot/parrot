# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/file - Packing

=head1 DESCRIPTION

Figures out how to C<pack()> Parrot's types.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step;
use Config;

$description="Figuring out how to pack() Parrot's types...";

@args=();

sub runstep {
  #
  # Alas perl5.7.2 doesn't have an INTVAL flag for pack().
  # The ! modifier only works for perl 5.6.x or greater.
  #

  my $intsize=Configure::Data->get('intsize');
  my $longsize=Configure::Data->get('longsize');
  my $ptrsize=Configure::Data->get('ptrsize');

  foreach ('intvalsize', 'opcode_t_size') {
    my $which = $_ eq 'intvalsize' ? 'packtype_i' : 'packtype_op';
    my $size=Configure::Data->get($_);
    my $format;
    if (($] >= 5.006) && ($size == $longsize) && ($size == $Config{longsize}) ) {
        $format = 'l!';
    }
    elsif ($size == 4) {
        $format = 'l';
    }
    elsif ($size == 8 || $Config{use64bitint} eq 'define') {
         # pp_pack is annoying, and this won't work unless sizeof(UV) >= 8
        $format = 'q';
    }
    warn "Configure.pl:  Unable to find a suitable packtype for $_.\n"
        unless $format;

    my $test = eval {pack $format, 0};
    unless (defined $test) {
        warn <<"AARGH"
Configure.pl:  Unable to find a functional packtype for $_.
               '$format' failed: $@
AARGH
    }
    if ($test) {
	unless (length $test == $size) {
	    warn sprintf <<"AARGH", $size, length $test;
Configure.pl:  Unable to find a functional packtype for $_.
               Need a format for %d bytes, but '$format' gave %d bytes.
AARGH
	}
    }
    else {
	$format = '?';
    }

    Configure::Data->set($which => $format);
  }

  Configure::Data->set(
    packtype_b => 'C',
    packtype_n => (Configure::Data->get('numvalsize') == 12 ? 'D' : 'd')
  );

  #
  # Find out what integer constant type we can use
  # for pointers.
  #

  if ($intsize == $ptrsize) {
    Configure::Data->set(ptrconst => "u");
  } elsif ($longsize == $ptrsize) {
    Configure::Data->set(ptrconst => "ul");
  } else {
    warn <<"AARGH";
Configure.pl:  Unable to find an integer type that fits a pointer.
AARGH
  }
}

1;
