# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/env.pl - System Environment

=head1 DESCRIPTION

Determining if the C library has C<setenv()> and C<unsetenv()>.

=cut

package Configure::Step;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step ':auto';

$description="Determining if your C library has setenv / unsetenv...";
@args=qw(verbose);

sub runstep {
    my $self = shift;
    my ($setenv, $unsetenv) = (0, 0);

    cc_gen('config/auto/env/test_setenv.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
        $setenv = 1;
    }
    cc_clean();
    cc_gen('config/auto/env/test_unsetenv.in');
    eval { cc_build(); };
    unless ($@ || cc_run() !~ /ok/) {
        $unsetenv = 1;
    }
    cc_clean();

    Parrot::Configure::Data->set(
	setenv => $setenv,
	unsetenv => $unsetenv
    );

    if ($setenv && $unsetenv) {
	print " (both) " if $_[0];
        $Configure::Step::result = 'both';
    }
    elsif ($setenv) {
	print " (setenv) " if $_[0];
        $Configure::Step::result = 'setenv';
    }
    elsif ($unsetenv) {
	print " (unsetenv) " if $_[0];
        $Configure::Step::result = 'unsetenv';
    }
    else {
	print " (no) " if $_[0];
        $Configure::Step::result = 'no';
    }
}

1;
