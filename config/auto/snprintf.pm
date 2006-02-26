# Copyright: 2001-2003 The Perl Foundation.  All Rights Reserved.
# $Id$

=head1 NAME

config/auto/snprintf.pm - Test for snprintf

=head1 DESCRIPTION

Tests if snprintf is present and if it's C99 compliant.

=cut

package auto::snprintf;

use strict;
use vars qw($description @args);

use base qw(Parrot::Configure::Step::Base);

use Parrot::Configure::Step qw(cc_gen cc_build cc_clean cc_run);

$description = 'Testing snprintf';

@args = qw(verbose);

sub runstep
{
    my ($self, $conf) = @_;

    cc_gen('config/auto/snprintf/test.in');
    cc_build();
    my $res = cc_run() or die "Can't run the snprintf testing program: $!";
    cc_clean();

    if ($res =~ /snprintf/) {
        $conf->data->set(HAS_SNPRINTF => 1);
    }
    if ($res =~ /^C99 snprintf/) {
        $conf->data->set(HAS_C99_SNPRINTF => 1);
    } elsif ($res =~ /^old snprintf/) {
        $conf->data->set(HAS_OLD_SNPRINTF => 1);
    }
    print " ($res) " if $conf->options->get('verbose');

    return $self;
}

1;
