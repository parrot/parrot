#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# init_defaults-02.t

use strict;
use warnings;
use Test::More tests =>  11;
use Carp;
use_ok('Cwd');
use_ok('File::Copy');
use_ok( 'File::Temp', qw| tempdir | );
use lib qw( lib );
use_ok('config::init::defaults');
use Parrot::Configure;
use Parrot::Configure::Step;
use Parrot::Configure::Options qw( process_options );
use base qw(Parrot::Configure::Step);

# DEVELOPING non-existence is faked by working in a tempdir which lacks it

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    ok( chdir $tdir, "Changed to temporary directory for testing" );
    ok( copy( "$cwd/VERSION", "$tdir/VERSION" ), "Able to copy VERSION for testing" );

    my $pkg  = q{init::defaults};
    my $args = process_options(
        {
            argv => [],
            mode => q{configure},
        }
    );

    my $conf = Parrot::Configure->new;
    $conf->add_steps($pkg);
    $conf->options->set( %{$args} );

    my $task        = $conf->steps->[0];
    my $step_name   = $task->step;

    my $step = $step_name->new();
    ok( defined $step, "$step_name constructor returned defined value" );
    isa_ok( $step, $step_name );

    my $ret = $step->runstep($conf);
    ok( defined $ret, "$step_name runstep() returned defined value" );

    unlink "$tdir/VERSION"
        or croak "Unable to unlink file from tempdir after testing";
    ok( chdir $cwd, "Able to change back to directory after testing" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init_defaults-02.t - test config::init::defaults

=head1 SYNOPSIS

    % prove t/steps/init_defaults-02.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by config::init::defaults in
the case where file 'DEVELOPING' does not exist, I<i.e.>, in a release version
of Parrot..

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::defaults, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
