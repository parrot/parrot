#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/encoding.pl - encoding files

=head1 DESCRIPTION

Asks the user to select which encoding files to include.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':inter';

$description = 'Determining what encoding files should be compiled in...';

@args=qw(ask encoding);

sub runstep {
  my @encoding=(
    sort
    map  { m{\./encodings/(.*)} }
    glob "./encodings/*.c"
  );

  my $encoding_list = $_[1] || join(' ', grep {defined $_} @encoding);

  if($_[0]) {
  print <<"END";


The following encodings are available:
  @encoding
END
    {
      $encoding_list = prompt('Which encodings would you like?', $encoding_list);
    }
  }
  # names of class files for classes/Makefile
  (my $TEMP_encoding_o = $encoding_list) =~ s/\.c/\$(O)/g;

  my $TEMP_encoding_build = <<"E_NOTE";

# the following part of the Makefile was built by 'config/inter/encoding.pl'

E_NOTE

  foreach my $encoding (split(/\s+/, $encoding_list)) {
      $encoding =~ s/\.c$//;
      $TEMP_encoding_build .= <<END
encodings/$encoding\$(O): encodings/$encoding.h encodings/$encoding.c \$(NONGEN_HEADERS)


END
  }

  # build list of libraries for link line in Makefile
  my $slash = Configure::Data->get('slash');
  $TEMP_encoding_o  =~ s/^| / encodings${slash}/g;

  Configure::Data->set(
    encoding             => $encoding_list,
    TEMP_encoding_o           => $TEMP_encoding_o,
    TEMP_encoding_build       => $TEMP_encoding_build,
  );
}

1;
