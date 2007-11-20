#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 115-auto_warnings.t

use strict;
use warnings;
use Test::More;
use Cwd;
use Carp;
use lib qw( lib );

if ( $^O eq 'MSWin32' ) {
    plan( skip_all => 'Not yet tested on Win32');
}
else {
    plan( tests => 4 );
}

use_ok('Parrot::Configure');
use_ok('Parrot::Configure::Step');
use_ok('config::auto::warnings');

my $step = 'dummy';

my $conf = Parrot::Configure->new;
$conf->data->set('cc', 'cc'); # XXX Cannot assume there iss a compiler 'cc'
$conf->data->set('ccflags', '-I/usr/include'); # XXX Cannot assume this.

my $cwd = cwd();
my $warning;

TODO: {
    # http://rt.perl.org/rt3/Ticket/Display.html?id=47395
    local $TODO = q<Not all compilers support -Wall>;
    $warning = "-Wall"; # XXX Cannot assume all compilers accept -Wall.
    {
        my $verbose = 0;
        my $rv      = auto::warnings::try_warning($step, $conf, $warning);
        is( $rv, 1, "Got expected exit code of 1" );
    }
}

################### DOCUMENTATION ###################

=head1 NAME

115-auto_warnings.t - test config::auto::warnings

=head1 SYNOPSIS

    % prove t/configure/115-auto_warnings.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::auto::warnings.

=head1 AUTHOR

Paul Cochrane <paultcochrane at gmail dot com>

=head1 SEE ALSO

config::auto::warnings, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
