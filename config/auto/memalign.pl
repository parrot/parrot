# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/memalign.pl - Memory Alignment

=head1 DESCRIPTION

Determines if the C library supports C<memalign()>.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);
use Parrot::Configure::Step ':auto';

$description="Determining if your C library supports memalign...";

@args=qw(miniparrot verbose);

sub runstep {
    my ($miniparrot, $verbose) = @_;

    if ($miniparrot) {
        Configure::Data->set(memalign => '');
	print "(skipped) " if $verbose;
	return;
    }

    my $test = 0;

    if (Configure::Data->get('i_malloc')) {
	Configure::Data->set('malloc_header', 'malloc.h');
    }
    else {
	Configure::Data->set('malloc_header', 'stdlib.h');
    }

    cc_gen('config/auto/memalign/test_c.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
	$test = 1;
    }
    cc_clean();

    my $test2 = 0;

    cc_gen('config/auto/memalign/test_c2.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
	$test2 = 1;
    }
    cc_clean();

    Configure::Data->set('malloc_header', undef);

    my $f = $test2 ? 'posix_memalign' :
            $test  ? 'memalign'       : '';
    Configure::Data->set( memalign => $f );
    print($test ? " (Yep:$f) " : " (no) ") if $verbose;
}

1;
