# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/charset.pl - charset files

=head1 DESCRIPTION

Asks the user to select which charset files to include.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':inter';

$description = 'Determining what charset files should be compiled in...';

@args=qw(ask charset);

sub runstep {
  my @charset=(
    sort
    map  { m{\./charset/(.*)} }
    glob "./charset/*.c"
  );

  my $charset_list = $_[1] || join(' ', grep {defined $_} @charset);

  if($_[0]) {
  print <<"END";


The following charsets are available:
  @charset
END
    {
      $charset_list = prompt('Which charsets would you like?', $charset_list);
    }
  }
  # names of class files for classes/Makefile
  (my $TEMP_charset_o = $charset_list) =~ s/\.c/\$(O)/g;

  my $TEMP_charset_build = <<"E_NOTE";

# the following part of the Makefile was built by 'config/inter/charset.pl'

E_NOTE

  foreach my $charset (split(/\s+/, $charset_list)) {
      $charset =~ s/\.c$//;
      $TEMP_charset_build .= <<END
charset/$charset\$(O): charset/$charset.h charset/ascii.h charset/$charset.c \$(NONGEN_HEADERS)


END
  }

  # build list of libraries for link line in Makefile
  my $slash = Parrot::Configure::Data->get('slash');
  $TEMP_charset_o  =~ s/^| / charset${slash}/g;

  Parrot::Configure::Data->set(
    charset             => $charset_list,
    TEMP_charset_o           => $TEMP_charset_o,
    TEMP_charset_build       => $TEMP_charset_build,
  );
}

1;
