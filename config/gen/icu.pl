#! perl -w
# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/gen/icu.pl - ICU

=head1 DESCRIPTION

Configures ICU and add appropriate targets to the Makefile.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Cwd qw(cwd);

$description="Configuring ICU if requested...";

@args=qw(buildicu verbose);

sub runstep {
  my ($buildicu, $verbose) = @_;

#  unless ($buildicu) {
#    print " [Skipped] " if $verbose;
#
#    Configure::Data->set(
#        icu_headers => '',
#        blib_lib_libsicuuc_a => '',
#        blib_lib_libsicudata_a => '',
#						 );
#    return;
#  }

#  print "\n";

  # MS VC++ requires special treatment.
  my ($cc) = Configure::Data->get(qw(cc));
  my $is_msvc = grep { $cc eq $_ } ( qw(cl cl.exe) );
  if ($is_msvc && -e 'icu\source\allinone\allinone.dsw') {
    Configure::Data->set(
      buildicu => 1,
      icu_make => <<'RULES',
###############################################################################
#
# Build ICU:
#
###############################################################################

icu : icu.dummy

icu.dummy :
	msdev icu\source\allinone\allinone.dsw /MAKE "ALL"

RULES
    );
    return;
  }

  # Below we use a configure line suggested by icu/README.parrot
  my $cwd = cwd();

  Configure::Data->set(
    buildicu => 1,
    icu_headers => 'blib/include/unicode/ucnv.h blib/include/unicode/utypes.h blib/include/unicode/uchar.h',
	blib_lib_libsicuuc_a => 'blib/lib/libicuuc$(A)',
    blib_lib_libsicudata_a => 'blib/lib/libicudata$(A)',
    cc_inc => Configure::Data->get(qw(cc_inc)).' -I./blib/include',
    TEMP_icu_make => <<"RULES",
###############################################################################
#
# Build ICU:
#
###############################################################################

icu : icu.dummy

icu.dummy :
	\$(MAKE_C) icu/source

icu.clean :
	\$(MAKE_C) icu/source clean

\$(ICU_H_FILES) : \$(LIBICUCORE)

\$(LIBICUCORE) \$(LIBICUDATA) :
	cd icu/source; ./configure --disable-layout --disable-tests --disable-samples --quiet '--prefix=$cwd/blib' --enable-static --disable-shared --disable-extras '--oldincludedir=$cwd/blib/old' --with-data-packaging=archive
	\$(MAKE_C) icu/source/stubdata install
	\$(MAKE_C) icu/source/common install
	\$(MAKE_C) icu/source/i18n
	\$(MAKE_C) icu/source/tools
	\$(MAKE_C) icu/source/data install ENABLE_STATIC=
	\$(RANLIB) \$(LIBICUCORE)
	\$(RANLIB) \$(LIBICUDATA)

RULES
   );
}

1;
