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

@args=qw(buildicu verbose icudatadir icuplatform icuconfigureargs
         icushared icuheaders);

sub runstep {
  my ($buildicu, $verbose, $icudatadir, $icuplatform, $icuconfigureargs,
           $icushared, $icuheaders) = @_;
  my $icu_configure_command;
  my @icu_headers = qw(ucnv.h utypes.h uchar.h);

  if (defined($icushared) && defined($icuheaders)) {
    $icuheaders =~ s![\\/]$!!;
    my $c_libs = Configure::Data->get('libs');
    $c_libs .= " $icushared";
    Configure::Data->set(
        icu_headers => join(' ', map {"$icuheaders/unicode/$_"} @icu_headers),
        blib_lib_libsicuuc_a => '',
        blib_lib_libsicudata_a => '',
	libs => $c_libs,
        cc_inc => Configure::Data->get(qw(cc_inc))." -I$icuheaders",
	icudatadir => '',
	TEMP_icu_make => ''
    );
    return;
  }

  if( !defined $icudatadir )
  {
      # XXX Hack:  We need some way to tell parrot where to find the
      # ICU data files, perhaps with a command-line option something
      # like perl's -I option.  In the absence of any such option,
      # this absolute setting at least allows you to run parrot from
      # within various subdirectories, such as ./t or ./languages,
      # without having to set any environment variables.
      # If parrot is ever able to be installed, this will have to change!
      my $cwd = cwd();
      $icudatadir = "$cwd/blib/lib/icu/2.6.1";
  }

  if( defined $icuplatform )
  {
	  $icu_configure_command = "./runConfigureICU $icuplatform";
  }
  else
  {
	# Try to build ICU with the same compiler as parrot.
	# Also respect Configure.pl command-line arguments for c++.
	$icu_configure_command = "./configure";
	my $cc = Configure::Data->get('cc');
	if ($cc ne '') {
	  $icu_configure_command = "CC=$cc $icu_configure_command";
	}
	my $cxx = Configure::Data->get('cxx');
	if ($cxx ne '') {
	  $icu_configure_command = "CXX=$cxx $icu_configure_command";
	}
  }

  Configure::Data->set( icudatadir => $icudatadir );

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

  # MS VC++ and Intel C++ (on Windows) require special treatment.
  my ($cc) = Configure::Data->get(qw(cc));
  my $is_msvc = grep { $cc eq $_ } ( qw(cl cl.exe icl icl.exe) );
  if ($is_msvc && -e 'icu\source\allinone\allinone.dsw') {
    # We build from MS VC++ Project Files. If these do not have Win32 line endings, it will
    # not accept them. Thus we need to ensure they do.
    my @dspfiles = ('icu\source\allinone\all\all.dsp', 'icu\source\common\common.dsp',
                    'icu\source\tools\ctestfw\ctestfw.dsp', 'icu\source\tools\gencmn\decmn.dsp',
                    'icu\source\tools\gencmn\gencmn.dsp', 'icu\source\tools\genrb\derb.dsp',
                    'icu\source\tools\genrb\genrb.dsp', 'icu\source\tools\genbrk\genbrk.dsp',
                    'icu\source\tools\genccode\genccode.dsp', 'icu\source\tools\gencnval\gencnval.dsp',
                    'icu\source\tools\genidna\genidna.dsp', 'icu\source\tools\gennames\gennames.dsp',
                    'icu\source\tools\gennorm\gennorm.dsp', 'icu\source\tools\genpname\genpname.dsp',
                    'icu\source\tools\genprops\genprops.dsp', 'icu\source\tools\gentest\gentest.dsp',
                    'icu\source\tools\gentz\gentz.dsp', 'icu\source\tools\genuca\genuca.dsp',
                    'icu\source\tools\makeconv\makeconv.dsp', 'icu\source\tools\pkgdata\pkgdata.dsp',
                    'icu\source\tools\toolutil\toolutil.dsp', 'icu\source\i18n\i18n.dsp',
                    'icu\source\stubdata\stubdata.dsp', 'icu\source\data\makedata.dsp');
    foreach (@dspfiles) {
        open DSPFILE, "< $_" or die "Cannot open $_: $!\n";
        my $file = join('', <DSPFILE>);
        close DSPFILE;
        $file =~ s/([^\r])\n/$1\r\n/g;
        open DSPFILE, "> $_" or die "Cannot open $_: $!\n";;
        print DSPFILE $file;
        close DSPFILE;
    }
    
    # Set up makefile entries.
    Configure::Data->set(
      buildicu => 1,
      icu_headers => 'blib\include\unicode\ucnv.h blib\include\unicode\utypes.h blib\include\unicode\uchar.h',
      blib_lib_libsicuuc_a => 'blib\lib\libicuuc$(A)',
      blib_lib_libsicudata_a => 'blib\lib\libicudata$(A)',
      cc_inc => Configure::Data->get(qw(cc_inc)).' -I.\blib\include',
      TEMP_icu_make => <<'RULES',
###############################################################################
#
# Build ICU:
#
###############################################################################

icu : icu.dummy

icu.dummy :

icu.clean :
	msdev icu\source\allinone\allinone.dsw /MAKE "ALL" /CLEAN

$(ICU_H_FILES) : $(LIBICUCORE)

$(LIBICUCORE) $(LIBICUDATA) :
	msdev icu\source\allinone\allinone.dsw /MAKE "stubdata - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "common - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "i18n - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "ctestfw - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "decmn - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "gencmn - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "derb - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "genrb - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "genbrk - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "genccode - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "gencnval - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "genidna - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "gennames - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "gennorm - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "genpname - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "genprops - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "gentest - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "gentz - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "genuca - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "makeconv - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "pkgdata - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "toolutil - Win32 Debug"
	msdev icu\source\allinone\allinone.dsw /MAKE "makedata - Win32 Debug"
	mkdir blib
	mkdir blib\lib
	copy icu\lib\icuucd$(A) $(LIBICUCORE)
	copy icu\lib\icudata$(A) $(LIBICUDATA)
	mkdir blib\include
	mkdir blib\include\unicode
	copy icu\include\unicode\*.h blib\include\unicode
	copy icu\bin\icuuc26d.dll .
	copy icu\bin\*.dll .
	mkdir blib\lib\icu
	mkdir blib\lib\icu\2.6.1
	copy icu\source\data\out\*.dat blib\lib\icu\2.6.1
RULES
    );
    return;
  }

  if( !defined $icuconfigureargs )
  {
  my $cwd = cwd();

      # Default to a configure line suggested by icu/README.parrot
	  $icuconfigureargs = "--disable-layout --disable-tests --disable-samples --quiet '--prefix=$cwd/blib' --enable-static --disable-shared --disable-extras '--oldincludedir=$cwd/blib/old' --with-data-packaging=archive";
  }
  
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
	cd icu/source; $icu_configure_command $icuconfigureargs
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
