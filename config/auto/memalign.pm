# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/memalign.pm - Memory Alignment

=head1 DESCRIPTION

Determines if the C library supports C<memalign()>.

=cut

package auto::memalign;

use strict;
use vars qw($description $result @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description="Determining if your C library supports memalign...";

@args=qw(miniparrot verbose);

sub runstep {
    my ($self, $conf) = (shift, shift);

    my ($miniparrot, $verbose) = @_;

    if ($miniparrot) {
        $conf->data->set(memalign => '');
	print "(skipped) " if $verbose;
	return;
    }

    if (defined $conf->data->get('memalign')) {
		return; # already set; leave it alone
	}
    my $test = 0;

    if ($conf->data->get('i_malloc')) {
	$conf->data->set(malloc_header => 'malloc.h');
    }
    else {
	$conf->data->set(malloc_header => 'stdlib.h');
    }

    if ($conf->data->get('ptrsize') == $conf->data->get('intsize')) {
       $conf->data->set(ptrcast => 'int');
      }
    else {
       $conf->data->set(ptrcast => 'long');
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

    $conf->data->set(malloc_header => undef);

    my $f = $test2 ? 'posix_memalign' :
            $test  ? 'memalign'       : '';
    $conf->data->set(memalign => $f);
    print($test ? " (Yep:$f) " : " (no) ") if $verbose;
    $result = $test ? 'yes' : 'no';
}

1;
