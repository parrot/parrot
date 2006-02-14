# $Id$

=head1 NAME

scrutinize.pl - check Perl code with Perl::Critic

=DESCRIPTION

This is not below 't', in order to not interfere with regression testing.

=head1 TODO

Find a better name. 'perlcritic' is already taken.

Look at the test scripts as well.

=Author

Bernhard Schmalhofer - <Bernhard.Schmalhofer@gmx.de>

=cut

package main;

use strict;
use warnings;
use 5.008;

use Test::Perl::Critic -profile => 'tools/perlcriticrc';

all_critic_ok();
