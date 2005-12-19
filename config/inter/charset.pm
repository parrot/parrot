# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/inter/charset.pm - charset files

=head1 DESCRIPTION

Asks the user to select which charset files to include.

=cut

package inter::charset;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':inter';

$description = 'Determining what charset files should be compiled in...';

@args=qw(ask charset);

sub runstep {
    my ($self, $conf) = (shift, shift);
  my @charset=(
    sort
    map  { m{\./src/charset/(.*)} }
    glob "./src/charset/*.c"
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
  # names of class files for src/classes/Makefile
  (my $TEMP_charset_o = $charset_list) =~ s/\.c/\$(O)/g;

  my $TEMP_charset_build = <<"E_NOTE";

# the following part of the Makefile was built by 'config/inter/charset.pl'

E_NOTE

  foreach my $charset (split(/\s+/, $charset_list)) {
      $charset =~ s/\.c$//;
      $TEMP_charset_build .= <<END
src/charset/$charset\$(O): src/charset/$charset.h src/charset/ascii.h src/charset/$charset.c \$(NONGEN_HEADERS)


END
  }

  # build list of libraries for link line in Makefile
  my $slash = $conf->data->get('slash');
  $TEMP_charset_o  =~ s/^| / src${slash}charset${slash}/g;

  $conf->data->set(
    charset             => $charset_list,
    TEMP_charset_o           => $TEMP_charset_o,
    TEMP_charset_build       => $TEMP_charset_build,
  );
}

1;
