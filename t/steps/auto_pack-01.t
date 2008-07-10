#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# auto_pack-01.t

use strict;
use warnings;
use Test::More tests => 31;
use Carp;
use lib qw( lib t/configure/testlib );
use_ok('config::init::defaults');
use_ok('config::auto::pack');
use Parrot::BuildUtil;
use Parrot::Configure;
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Test qw( test_step_thru_runstep);
use IO::CaptureOutput qw( capture );

my $args = process_options( {
    argv            => [],
    mode            => q{configure},
} );

my $conf = Parrot::Configure->new();

test_step_thru_runstep($conf, q{init::defaults}, $args);

my ($task, $step_name, $step, $ret);
my $pkg = q{auto::pack};

$conf->add_steps($pkg);
$conf->options->set(%{$args});

$task = $conf->steps->[-1];
$step_name   = $task->step;

$step = $step_name->new();
ok(defined $step, "$step_name constructor returned defined value");
isa_ok($step, $step_name);
ok($step->description(), "$step_name has description");

my $longsize_orig = $conf->data->get_p5('longsize');
my $use64bitint_orig = $conf->data->get_p5('use64bitint');

##### _set_format() #####

{
    my $type = q{intvalsize};
    my $size = 8;
    my $longsize = 8;
    $conf->data->set_p5( longsize => 8 );
    my $format = auto::pack::_set_format( $conf, $type, $size, $longsize );
    is( $format, q{l!}, "Got expected format size: $format" );
    $conf->data->set_p5( longsize => $longsize_orig );
}

{
    my $type = q{intvalsize};
    my $size = 4;
    my $longsize = 8;
    $conf->data->set_p5( longsize => 8 );
    my $format = auto::pack::_set_format( $conf, $type, $size, $longsize );
    is( $format, q{l}, "Got expected format size: $format" );
    $conf->data->set_p5( longsize => $longsize_orig );
}

{
    my $type = q{intvalsize};
    my $size = 8;
    my $longsize = 16;
    $conf->data->set_p5( longsize => 16 );
    my $format = auto::pack::_set_format( $conf, $type, $size, $longsize );
    is( $format, q{q}, "Got expected format size: $format" );
    $conf->data->set_p5( longsize => $longsize_orig );
}

{
    my $type = q{intvalsize};
    my $size = 16;
    my $longsize = 8;
    $conf->data->set_p5( longsize => undef );
    $conf->data->set_p5( use64bitint => 'define');
    my $format = auto::pack::_set_format( $conf, $type, $size, $longsize );
    is( $format, q{q}, "Got expected format size: $format" );
    $conf->data->set_p5( longsize => $longsize_orig );
    $conf->data->set_p5( use64bitint => $use64bitint_orig );
}

{
    my ($stdout, $stderr);
    my $type = q{intvalsize};
    my $size = 23;
    my $longsize = 8;
    my $format;
    capture(
        sub { $format =
            auto::pack::_set_format( $conf, $type, $size, $longsize ); },
        \$stdout,
        \$stderr,
    );
    ok( ! defined $format, "Format size undef, as expected");
    like($stderr,
        qr/Configure\.pl:  Unable to find a suitable packtype for $type/,
        "Got expected warning re format size"
    );
}

##### _pack_test() #####

{
    my $format = q{Y};
    my $type = q{intvalsize};
    my $size = 4;
    my $test;
    my ($stdout, $stderr);
    capture(
        sub { $format =
            auto::pack::_pack_test( $format, $type, $size, $test ); },
        \$stdout,
        \$stderr,
    );
    like($stderr,
        qr/Configure\.pl:  Unable to find a functional packtype for $type/,
        "Got expected warning from _pack_test()"
    );
}

{
    my $format = q{l!};
    my $type = q{intvalsize};
    my $size = 4;
    my $test = q{abcd};
    my ($stdout, $stderr, $ret);
    capture(
        sub { $ret = auto::pack::_pack_test( $format, $type, $size, $test ) },
        \$stdout,
        \$stderr,
    );
    is( $ret, $format, "Got expected format" );
    ok(! $stderr, "Nothing on STDERR, as expected" );
}

{
    my $format = q{l!};
    my $type = q{intvalsize};
    my $size = 4;
    my $test = q{abcde};
    my ($stdout, $stderr, $ret);
    capture(
        sub { $ret = auto::pack::_pack_test( $format, $type, $size, $test ) },
        \$stdout,
        \$stderr,
    );
    like($stderr,
        qr/Configure\.pl:  Unable to find a functional packtype for $type/,
        "Got expected warning in _pack_test()."
    );
}

{
    my $format = q{l!};
    my $type = q{intvalsize};
    my $size = 4;
    my $test = q{};
    my ($stdout, $stderr, $ret);
    capture(
        sub { $ret = auto::pack::_pack_test( $format, $type, $size, $test ) },
        \$stdout,
        \$stderr,
    );
    is( $ret, q{?}, "Got expected format" );
    ok(! $stderr, "Nothing on STDERR, as expected" );
}

##### _set_packtypes() #####

{
    my $current_numvalsize = $conf->data->get('numvalsize');
    $conf->data->set( numvalsize => 12 );
    auto::pack::_set_packtypes($conf);
    is($conf->data->get('packtype_b'), 'C',
        "Got expected value for packtype_b");
    is($conf->data->get('packtype_n'), 'D',
        "Got expected value for packtype_n");

    # prepare for next test
    $conf->data->set( numvalsize => $current_numvalsize );
    $conf->data->set( packtype_b => undef );
    $conf->data->set( packtype_n => undef );
}

{
    my $current_numvalsize = $conf->data->get('numvalsize');
    $conf->data->set( numvalsize => 72 );
    auto::pack::_set_packtypes($conf);
    is($conf->data->get('packtype_b'), 'C',
        "Got expected value for packtype_b");
    is($conf->data->get('packtype_n'), 'd',
        "Got expected value for packtype_n");

    # prepare for next test
    $conf->data->set( numvalsize => $current_numvalsize );
    $conf->data->set( packtype_b => undef );
    $conf->data->set( packtype_n => undef );
}

##### _set_ptrconst() #####

{
    my ($ptrsize, $intsize, $longsize);
    $ptrsize = $intsize = 2;
    $longsize = 4;
    auto::pack::_set_ptrconst($conf, $ptrsize, $intsize, $longsize);
    is($conf->data->get( 'ptrconst' ), "u",
        "Got expected value for ptrconst" );
}

{
    my ($ptrsize, $intsize, $longsize);
    $intsize = 2;
    $ptrsize = $longsize = 4;
    auto::pack::_set_ptrconst($conf, $ptrsize, $intsize, $longsize);
    is($conf->data->get( 'ptrconst' ), "ul",
        "Got expected value for ptrconst" );
    $conf->data->set( 'ptrconst' => undef ); # prepare for next test
}

{
    my ($ptrsize, $intsize, $longsize);
    $intsize = 2;
    $ptrsize = 4;
    $longsize = 8;
    my ($stdout, $stderr);
    capture(
        sub { auto::pack::_set_ptrconst($conf, $ptrsize, $intsize, $longsize); },
        \$stdout,
        \$stderr,
    );
    ok(! defined $conf->data->get( 'ptrconst' ),
        "ptrconst not set, as expected");
    ok(! $stdout, "As expected, nothing on STDOUT");
    like($stderr, qr/Unable to find an integer type/,
        "Got expected warning");
    $conf->data->set( 'ptrconst' => undef ); # prepare for next test
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

auto_pack-01.t - test config::auto::pack

=head1 SYNOPSIS

    % prove t/steps/auto_pack-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test auto::pack internal subroutines C<_set_packtypes()>
and C<_set_ptrcons()>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::auto::pack, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
