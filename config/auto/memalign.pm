# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/memalign.pm - Memory Alignment

=head1 DESCRIPTION

Determines if the C library supports C<memalign()>.

=cut

package Configure::Step;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description="Determining if your C library supports memalign...";

@args=qw(miniparrot verbose);

sub runstep {
    my $self = shift;
    my ($miniparrot, $verbose) = @_;

    if ($miniparrot) {
        Parrot::Configure::Data->set(memalign => '');
	print "(skipped) " if $verbose;
	return;
    }

    if (defined Parrot::Configure::Data->get('memalign')) {
		return; # already set; leave it alone
	}
    my $test = 0;

    if (Parrot::Configure::Data->get('i_malloc')) {
	Parrot::Configure::Data->set('malloc_header', 'malloc.h');
    }
    else {
	Parrot::Configure::Data->set('malloc_header', 'stdlib.h');
    }

    if (Parrot::Configure::Data->get('ptrsize') == Parrot::Configure::Data->get('intsize')) {
       Parrot::Configure::Data->set('ptrcast','int');
      }
    else {
       Parrot::Configure::Data->set('ptrcast','long');
      }

    cc_gen('config/auto/memalign/test_c.in');
    eval { cc_build(); };
    unless ($@ || cc_run_capture() !~ /ok/) {
	$test = 1;
    }
    cc_clean();

    my $test2 = 0;

    cc_gen('config/auto/memalign/test_c2.in');
    eval { cc_build(); };
    unless ($@ || cc_run_capture() !~ /ok/) {
	$test2 = 1;
    }
    cc_clean();

    Parrot::Configure::Data->set('malloc_header', undef);

    my $f = $test2 ? 'posix_memalign' :
            $test  ? 'memalign'       : '';
    Parrot::Configure::Data->set( memalign => $f );
    print($test ? " (Yep:$f) " : " (no) ") if $verbose;
    $result = $test ? 'yes' : 'no';
}

1;
