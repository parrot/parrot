# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/gdbm.pm - Test for GNU dbm (gdbm) library

=head1 DESCRIPTION

Determines whether the platform supports gdbm.
This is needed for the dynamic GDBMHash PMC.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description = "Determining if your platform supports gdbm...";

@args = qw(verbose);

sub runstep {
    my $self = shift;
    my ($verbose) = @_;

    my $cc        = Parrot::Configure::Data->get('cc');
    my $libs      = Parrot::Configure::Data->get('libs');
    my $linkflags = Parrot::Configure::Data->get('linkflags');
    my $ccflags   = Parrot::Configure::Data->get('ccflags');
    
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
            Parrot::Configure::Data->add(' ', 'linkflags', '-L/sw/lib');
            Parrot::Configure::Data->add(' ', 'ldflags', '-L/sw/lib');
            Parrot::Configure::Data->add(' ', 'ccflags', '-I/sw/include');
        }
    }

    cc_gen('config/auto/gdbm/gdbm.in');
    if ($^O =~ /mswin32/i) {
        if ($cc =~ /^gcc/i) {
            eval { cc_build('', '-llibgdbm'); };
        } else {
            eval { cc_build('', 'gdbm.lib'); };
        }
    } else { 
        eval { cc_build('', '-lgdbm'); };
    }
    my $has_gdbm = 0;
    if (! $@) {
	my $test = cc_run();
        unlink "gdbm_test_db";
	if ($test eq "gdbm is working.\n") {
            $has_gdbm = 1;
	    print " (yes) " if $verbose;
            $result = 'yes';
	}
    }
    unless ($has_gdbm) {
        # The Config::Data settings might have changed for the test 
        Parrot::Configure::Data->set( libs      => $libs );
        Parrot::Configure::Data->set( ccflags   => $ccflags );
        Parrot::Configure::Data->set( linkflags => $linkflags );
        print " (no) " if $verbose;
        $result = 'no';
    }
    Parrot::Configure::Data->set( has_gdbm => $has_gdbm ); # for gdbmhash.t and dynclasses.in
}
