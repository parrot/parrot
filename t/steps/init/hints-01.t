#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# init/hints-01.t

use strict;
use warnings;
use Test::More tests => 21;
use Carp;
use Cwd;
use File::Path ();
use File::Spec::Functions qw/catfile/;
use File::Temp qw(tempdir);
use lib qw( lib t/configure/testlib );
use_ok('config::init::hints');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

########## --verbose ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [q{--verbose}],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{init::hints};

$conf->add_steps($pkg);

my $serialized = $conf->pcfreeze();

$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

# need to capture the --verbose output, because the fact that it does not end
# in a newline confuses Test::Harness
{
    my $rv;
    my $stdout;
    capture ( sub {$rv = $step->runstep($conf)}, \$stdout);
    ok( $stdout, "verbose output:  hints were captured" );
    ok( defined $rv, "runstep() returned defined value" );
}

$conf->replenish($serialized);

########## --verbose; local hints directory ##########

($args, $step_list_ref) = process_options(
    {
        argv => [q{--verbose}],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    File::Path::mkpath(qq{$tdir/init/hints})
        or croak "Unable to create directory for local hints";
    my $localhints = qq{$tdir/init/hints/local.pm};
    open my $FH, '>', $localhints
        or croak "Unable to open temp file for writing";
    print $FH <<END;
package init::hints::local;
use strict;
sub runstep {
    return 1;
}
1;
END
    close $FH or croak "Unable to close temp file after writing";
    unshift( @INC, $tdir );

    {
     my $rv;
     my $stdout;
     capture ( sub {$rv = $step->runstep($conf)}, \$stdout);
     ok( $stdout, "verbose output:  hints were captured" );
     ok( defined $rv, "runstep() returned defined value" );
    }
    unlink $localhints or croak "Unable to delete $localhints";
}

$conf->replenish($serialized);

########## --verbose; local hints directory; no runstep() in local hints ##########

($args, $step_list_ref) = process_options(
    {
        argv => [q{--verbose}],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);

$cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    File::Path::mkpath(qq{$tdir/init/hints})
        or croak "Unable to create directory for local hints";
    my $localhints = qq{$tdir/init/hints/local.pm};
    open my $FH, '>', $localhints
        or croak "Unable to open temp file for writing";
    print $FH <<END;
package init::hints::local;
use strict;
1;
END
    close $FH or croak "Unable to close temp file after writing";
    unshift( @INC, $tdir );

    {
     my $rv;
     my $stdout;
     capture ( sub {$rv = $step->runstep($conf)}, \$stdout);
     ok( $stdout, "verbose output:  hints were captured" );
     ok( defined $rv, "runstep() returned defined value" );
    }
    unlink $localhints or croak "Unable to delete $localhints";
}

$conf->replenish($serialized);

########## --verbose; imaginary OS ##########

($args, $step_list_ref) = process_options(
    {
        argv => [ q{--verbose} ],
        mode => q{configure},
    }
);

$conf->options->set( %{$args} );
$step = test_step_constructor_and_description($conf);
{
    my ($stdout, $stderr, $ret);
    $conf->data->set( OSNAME_provisional => q{imaginaryOS} );
    my $osname = lc( $conf->data->get( 'OSNAME_provisional' ) );
    my $hints_file = catfile('config', 'init', 'hints', "$osname.pm");
    capture (
        sub { $ret = $step->runstep($conf); },
        \$stdout,
        \$stderr,
    );
    like(
        $stdout,
        qr/No \Q$hints_file\E found/s,
        "Got expected verbose output when no hints file found"
    );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init/hints-01.t - test init::hints

=head1 SYNOPSIS

    % prove t/steps/init/hints-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test init::hints.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::hints, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
