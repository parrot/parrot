#! perl
# Copyright (C) 2009, Parrot Foundation.
# init/hints/darwin-01.t

use strict;
use warnings;
use Cwd;
use File::Temp qw( tempdir );
use Test::More;
plan( skip_all => 'only needs testing on Darwin' ) unless $^O =~ /darwin/i;
plan( tests =>  37 );

use lib qw( lib t/configure/testlib );
use_ok('config::init::hints');
use_ok('config::init::hints::darwin');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use IO::CaptureOutput qw | capture |;

my $cwd = cwd();
my ($args, $step_list_ref) = process_options(
    {
        argv => [],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

##### Tests of some internal subroutines #####

##### _precheck() #####

my $problematic_flag = 'ccflags';
my $stored = $conf->data->get($problematic_flag);

{
    $conf->options->set( verbose => undef );
    my ($stdout, $stderr);
    capture(
        sub { init::hints::darwin::_precheck(
            $conf, $problematic_flag, $stored
        ) },
        \$stdout,
        \$stderr,
    );
    ok( ! $stdout, "_precheck():  Non-verbose mode produced no output" );
}

{
    $conf->options->set( verbose => 1 );
    my ($stdout, $stderr);
    capture(
        sub { init::hints::darwin::_precheck(
            $conf, $problematic_flag, $stored
        ) },
        \$stdout,
        \$stderr,
    );
    ok( $stdout, "_precheck():  Verbose mode produced output" );
    like($stdout, qr/Checking\s+$problematic_flag/,
        "_precheck():  Got expected verbose output" );
    like($stdout, qr/Pre-check:\s+$stored/,
        "_precheck():  Got expected verbose output" );
}

{
    $conf->options->set( verbose => 1 );
    my ($stdout, $stderr);
    capture(
        sub { init::hints::darwin::_precheck(
            $conf, $problematic_flag, q{}
        ) },
        \$stdout,
        \$stderr,
    );
    ok( $stdout, "_precheck():  Verbose mode produced output" );
    like($stdout, qr/Checking\s+$problematic_flag/,
        "_precheck():  Got expected verbose output" );
    like($stdout, qr/Pre-check:\s+\(nil\)/,
        "_precheck():  Got expected verbose output" );
    $conf->options->set( verbose => undef );
}

##### _strip_arch_flags_engine #####

{
    my %defaults = (
        architectures   => [ qw( i386 ppc64 ppc x86_64 ) ],
    );
    my $flagsref = {};
    my $stored = q{-someflag  -arch i386 -someotherflag -arch ppc};
    my $flag = q{ccflags};
    $flagsref = init::hints::darwin::_strip_arch_flags_engine(
      $defaults{architectures}, $stored, $flagsref, $flag
    );
    like(
        $flagsref->{$flag},
        qr{-someflag -someotherflag},
        "_strip_arch_flags_engine(): '-arch' flags and extra whitespace removed",
    );


}

##### _postcheck #####

{
    $conf->options->set( verbose => undef );
    my $flag = 'ccflags';
    my $flagsref = { 'ccflags' => 'my ccflag' };
    my ($stdout, $stderr);

    capture(
        sub { init::hints::darwin::_postcheck(
            $conf, $flagsref, $flag
        ) },
        \$stdout,
        \$stderr,
    );
    ok( ! $stdout, "_postcheck():  Non-verbose mode produced no output" );

    $conf->options->set( verbose => 1 );
    capture(
        sub { init::hints::darwin::_postcheck(
            $conf, $flagsref, $flag
        ) },
        \$stdout,
        \$stderr,
    );
    ok( $stdout, "_postcheck():  Verbose mode produced output" );
    like($stdout, qr/Post-check:\s+$flagsref->{$flag}/,
        "_postcheck():  Got expected verbose output" );

    $conf->options->set( verbose => 1 );
    $flagsref = { 'ccflags' => undef };
    capture(
        sub { init::hints::darwin::_postcheck(
            $conf, $flagsref, $flag
        ) },
        \$stdout,
        \$stderr,
    );
    ok( $stdout, "_postcheck():  Verbose mode produced output" );
    like($stdout, qr/Post-check:\s+\(nil\)/,
        "_postcheck():  Got expected verbose output" );
}

##### _strip_arch_flags #####

{
    my %defaults = (
        problem_flags   => [ qw( ccflags ldflags ) ],
        architectures   => [ qw( i386 ppc64 ppc x86_64 ) ],
    );
    my $flagsref = {};
    my $flag = q{ccflags};
    my $oldflag = $conf->data->get( $flag );

    my $stored = q{-someflag  -arch i386 -someotherflag -arch ppc};
    $conf->data->set( $flag => $stored );

    $flagsref = init::hints::darwin::_strip_arch_flags($conf, 0);
    like($flagsref->{$flag},
        qr/-someflag -someotherflag/,
        "_strip_arch_flags(): '-arch' flags and extra whitespace removed",
    );

    $conf->options->set( verbose => 1 );
    my ($stdout, $stderr);
    capture(
        sub {
            $flagsref = init::hints::darwin::_strip_arch_flags($conf);
        },
        \$stdout,
        \$stderr,
    );
    like($flagsref->{$flag},
        qr/-someflag -someotherflag/,
        "_strip_arch_flags(): '-arch' flags and extra whitespace removed",
    );
    like(
        $stdout,
        qr/Stripping -arch flags due to Apple multi-architecture build problems:/,
        "_strip_arch_flags(): Got expected verbose output",
    );

    $flag = q{ccflags};
    $conf->data->set( $flag => undef );
    $flagsref = init::hints::darwin::_strip_arch_flags($conf, 0);
    is( $flagsref->{$flag}, q{},
        "_strip_arch_flags():  Got empty flag when expected" );

    $conf->data->set( $flag => $oldflag );
}

##### _strip_ldl_as_needed #####

{
    my $oldflag = $conf->data->get( 'libs ' );
    my ( $major, $libs );

    $major = '7.99.11';
    local $init::hints::darwin::defaults{uname} = $major;
    $conf->data->set( libs => '-somelib -ldl -someotherlib' );
    $libs = init::hints::darwin::_strip_ldl_as_needed(
        $conf->data->get( 'libs' )
    );
    like( $libs, qr/-somelib\s+-someotherlib/,
        "_strip_ldl_as_needed(): '-ldl' stripped as expected" );

    $major = '6.99.11';
    local $init::hints::darwin::defaults{uname} = $major;
    $conf->data->set( libs => '-somelib -ldl -someotherlib' );
    $libs = init::hints::darwin::_strip_ldl_as_needed(
        $conf->data->get( 'libs' )
    );
    like( $libs, qr/-somelib\s+-ldl\s+-someotherlib/,
        "_strip_ldl_as_needed(): '-ldl' not stripped as expected in older darwin" );

    $conf->data->set( libs => $oldflag );
}

##### _set_deployment_environment() #####

{
    my $predicted = '10.99';
    local $ENV{'MACOSX_DEPLOYMENT_TARGET'} = undef;
    no warnings 'once';
    local $init::hints::darwin::defaults{sw_vers} = qq{$predicted.11};
    use warnings;
    my $deploy_target = init::hints::darwin::_set_deployment_environment();
    is($ENV{'MACOSX_DEPLOYMENT_TARGET'}, $predicted,
        "_set_deployment_environment(): MACOSX_DEPLOYMENT_TARGET set as expected");
    is($deploy_target, '10.99',
        "Got expected return value for _set_deployment_environment");
}

##### _probe_for_fink() #####

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or die "Unable to change to temporary directory: $!";

    local $init::hints::darwin::defaults{fink_conf} = qq{$tdir/fink.conf};
    ok( ! defined( init::hints::darwin::_probe_for_fink( $conf ) ),
        "_probe_for_fink(): returned undefined value for no config file" );
    $conf->options->set( 'verbose' => 1 );
    {
        my ($stdout, $stderr);
        capture(
            sub { init::hints::darwin::_probe_for_fink( $conf ); },
            \$stdout,
            \$stderr,
        );
        like( $stdout, qr/Fink configuration file not located/,
            "Got expected verbose output when Fink config not located" );
    }
    $conf->options->set( 'verbose' => 0 );

    my $fink_conf_file = q{fink.conf};
    open my $CONF, '>', $fink_conf_file
        or die "Unable to open $fink_conf_file for writing: $!";
    print $CONF "Hello, world, but no Fink info\n";
    close $CONF or die "Unable to close $fink_conf_file after writing: $!";
    ok( ! defined( init::hints::darwin::_probe_for_fink( $conf ) ),
        "_probe_for_fink(): returned undefined value for defective config file" );

    $conf->options->set( 'verbose' => 1 );
    {
        my ($stdout, $stderr);
        capture(
            sub { init::hints::darwin::_probe_for_fink( $conf ); },
            \$stdout,
            \$stderr,
        );
        like( $stdout, qr/Fink configuration file defective/,
            "Got expected verbose output when Fink config was defective" );
    }
    $conf->options->set( 'verbose' => 0 );

    my $other = qq{$tdir/other_fink.conf};
    local $init::hints::darwin::defaults{fink_conf} = $other;
    $fink_conf_file = $other;
    open my $OCONF, '>', $fink_conf_file
        or die "Unable to open $fink_conf_file for writing: $!";
    print $OCONF "Basepath:  /tmp/foobar\n";
    close $OCONF or die "Unable to close $fink_conf_file after writing: $!";
    ok( ! defined( init::hints::darwin::_probe_for_fink( $conf ) ),
        "_probe_for_fink(): returned undefined value for missing directories" );

    $conf->options->set( 'verbose' => 1 );
    {
        my ($stdout, $stderr);
        capture(
            sub { init::hints::darwin::_probe_for_fink( $conf ); },
            \$stdout,
            \$stderr,
        );
        like( $stdout, qr/Could not locate Fink directories/,
            "Got expected verbose output when Fink directories were missing" );
    }
    $conf->options->set( 'verbose' => 0 );

    chdir $cwd or die "Unable to change back to starting directory: $!";
}

##### _probe_for_macports() #####

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or die "Unable to change to temporary directory: $!";

    local $init::hints::darwin::defaults{ports_base_dir} = qq{$tdir/foobar};
    ok( ! defined( init::hints::darwin::_probe_for_macports( $conf ) ),
        "_probe_for_macports(): returned undefined value for no config file" );

    $conf->options->set( 'verbose' => 1 );
    {
        my ($stdout, $stderr);
        capture(
            sub { init::hints::darwin::_probe_for_macports( $conf ); },
            \$stdout,
            \$stderr,
        );
        like( $stdout, qr/Could not locate Macports directories/,
            "Got expected verbose output when Macports directories not found" );
    }
    $conf->options->set( 'verbose' => 0 );
}

##### _probe_for_libraries() #####

{
    $conf->options->set( 'darwin_no_fink' => 1 );
    $conf->options->set( 'verbose' => 0 );
    my $lib_dir = $conf->data->get('build_dir') . "/blib/lib";
    my $flagsref = {};
    $flagsref->{ldflags} .= " -L$lib_dir";
    $flagsref->{ccflags} .= " -pipe -fno-common -Wno-long-double ";
    $flagsref->{linkflags} .= " -undefined dynamic_lookup";
    my %state_before = map { $_ => $flagsref->{$_} } keys %{ $flagsref };
    ok( ! defined ( init::hints::darwin::_probe_for_libraries(
        $conf, $flagsref, 'fink')
    ), "_probe_for_libraries() returned undef as expected" );
    is_deeply( $flagsref, { %state_before },
        "No change in flags, as expected" );

    $conf->options->set( 'darwin_no_fink' => 0 );
}

##### _add_to_flags() #####

{
    my ( $addl_flags_ref, $flagsref, $title, $verbose );
    $addl_flags_ref = undef;
    $flagsref = undef;
    $title = 'Fink';
    $conf->options->set( 'verbose' => undef );
    ok( init::hints::darwin::_add_to_flags(
        $conf, $addl_flags_ref, $flagsref, $title
    ), "_add_to_flags(): returned true value when no probes found" );

    $conf->options->set( 'verbose' => 1 );
    {
        my ($stdout, $stderr);
        capture(
            sub { init::hints::darwin::_add_to_flags(
                $conf, $addl_flags_ref, $flagsref, $title
            ); },
            \$stdout,
            \$stderr,
        );
        like( $stdout, qr/Probe for $title unsuccessful/,
            "_add_to_flags(): got expected verbose output when probe unsuccessful" );
    }

    $addl_flags_ref = {
        ldflags   => "-Lfink_lib_dir",
        ccflags   => "-Lfink_include_dir",
        linkflags => "-Lfink_lib_dir",
    };
    my $lib_dir = $conf->data->get('build_dir') . "/blib/lib";
    $flagsref = undef;
    $flagsref->{ldflags} = " -L$lib_dir";
    $flagsref->{ccflags} = " -pipe -fno-common -Wno-long-double ";
    $flagsref->{linkflags} = undef;
    $title = 'Fink';
    $conf->options->set( 'verbose' => undef );
    my $rv = init::hints::darwin::_add_to_flags(
        $conf, $addl_flags_ref, $flagsref, $title
    );
    is( $flagsref->{linkflags}, " $addl_flags_ref->{linkflags}",
        "_add_to_flags():  flag added where not previously populated" );
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

init/hints/darwin-01.t - test init::hints::darwin

=head1 SYNOPSIS

    % prove t/steps/init/hints/darwin-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test init::hints::darwin.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::init::hints::darwin, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
