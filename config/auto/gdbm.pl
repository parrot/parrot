# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/gdbm.pl - Test for GNU dbm (gdbm) library

=head1 DESCRIPTION

Determines whether the platform supports gdbm.
This is needed for the dynamic GDBMHash PMC.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your platform supports gdbm...";

@args=qw(verbose);

sub runstep {
    my ($verbose) = @_;

    my $libs = Configure::Data->get('libs');
    my $linkflags = Configure::Data->get('linkflags');
    my $ccflags = Configure::Data->get('ccflags');
    
    my $archname = $Config{archname};
    my ($cpuarch, $osname) = split('-', $archname);
    if(!defined $osname) {
        ($osname, $cpuarch) = ($cpuarch, "");
    }

    # On OS X check the presence of the gdbm header in the standard
    # Fink location. TODO: Need a more generalized way for finding 
    # where Fink lives.
    if($osname =~ /darwin/) {
        if( -f "/sw/include/gdbm.h") {
            Configure::Data->add(' ', 'linkflags', '-L/sw/lib');
            Configure::Data->add(' ', 'ldflags', '-L/sw/lib');
            Configure::Data->add(' ', 'ccflags', '-I/sw/include');
        }
    }

    cc_gen('config/auto/gdbm/gdbm.in');
    eval { cc_build('', '-lgdbm'); };
    my $has_gdbm = 0;
    if (! $@) {
	my $test = cc_run();
        unlink "gdbm_test_db";
	if ($test eq "gdbm is working.\n") {
            $has_gdbm = 1;
	    print " (yes) " if $verbose;
            $Configure::Step::result = 'yes';

	    Configure::Data->set(
		has_gdbm => '1',         # for gdbmhash.t
		gdbmhash => 'gdbmhash',  # for dynclasses.in
	    );
	}
    }
    unless ($has_gdbm) {
        # The Config::Data settings might have changed for the test 
        Configure::Data->set('libs', $libs);
        Configure::Data->set('ccflags', $ccflags);
        Configure::Data->set('linkflags', $linkflags);
        print " (no) " if $verbose;
        $Configure::Step::result = 'no';
    }
}
