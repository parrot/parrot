# Copyright: 2001-2004 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/gmp.pl - Test for GNU MP (GMP) Math library

=head1 DESCRIPTION

Determines whether the platform supports GMP.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your platform supports GMP...";

@args=qw(verbose);

sub runstep {
    my ($verbose) = @_;

    my $cc = Parrot::Configure::Data->get('cc');
    my $libs = Parrot::Configure::Data->get('libs');
    my $linkflags = Parrot::Configure::Data->get('linkflags');
    my $ccflags = Parrot::Configure::Data->get('ccflags');
    if ($^O =~ /mswin32/i) {
        if ($cc =~ /^gcc/i) {
            Parrot::Configure::Data->add(' ', 'libs', '-lgmp');
        } else {
            Parrot::Configure::Data->add(' ', 'libs', 'gmp.lib');
        }
    } else {
        Parrot::Configure::Data->add(' ', 'libs', '-lgmp');
    }

    my $archname = $Config{archname};
    my ($cpuarch, $osname) = split('-', $archname);
    if(!defined $osname) {
        ($osname, $cpuarch) = ($cpuarch, "");
    }

    # On OS X check the presence of the gmp header in the standard
    # Fink location. TODO: Need a more generalized way for finding
    # where Fink lives.
    if($osname =~ /darwin/) {
        if( -f "/sw/include/gmp.h") {
            Parrot::Configure::Data->add(' ', 'linkflags', '-L/sw/lib');
            Parrot::Configure::Data->add(' ', 'ldflags', '-L/sw/lib');
            Parrot::Configure::Data->add(' ', 'ccflags', '-I/sw/include');
        }
    }

    cc_gen('config/auto/gmp/gmp.in');
    eval { cc_build(); };
    my $has_gmp = 0;
    if (! $@) {
	my $test = cc_run();
	if ($test eq "6864797660130609714981900799081393217269435300143305409394463459185543183397656052122559640661454554977296311391480858037121987999716643812574028291115057151 0\n") {
            $has_gmp = 1;
	    print " (yes) " if $verbose;
            $Configure::Step::result = 'yes';

	    Parrot::Configure::Data->set(
		gmp     => 'define',
		HAS_GMP => $has_gmp,
	    );
	}
    }
    unless ( $has_gmp ) {
        # The Config::Data settings might have changed for the test
        Parrot::Configure::Data->set('libs', $libs);
        Parrot::Configure::Data->set('ccflags', $ccflags);
        Parrot::Configure::Data->set('linkflags', $linkflags);
        print " (no) " if $verbose;
        $Configure::Step::result = 'no';
    }
}

