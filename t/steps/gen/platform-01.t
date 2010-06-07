#! perl
# Copyright (C) 2007-2008, Parrot Foundation.
# $Id$
# gen/platform-01.t

use strict;
use warnings;
use Test::More tests => 12;
use Carp;
use Cwd;
use File::Copy;
use File::Path qw( mkpath );
use File::Temp qw( tempdir );
use File::Spec;
use lib qw( lib );
use_ok('config::gen::platform');
use Parrot::Configure::Options qw( process_options );
use Parrot::Configure::Step::Test;
use Parrot::Configure::Test qw(
    test_step_constructor_and_description
);
use Parrot::Configure::Utils qw( _slurp );
use IO::CaptureOutput qw( capture );

########## regular ##########

my ($args, $step_list_ref) = process_options(
    {
        argv => [ ],
        mode => q{configure},
    }
);

my $conf = Parrot::Configure::Step::Test->new;
$conf->include_config_results( $args );

my $pkg = q{gen::platform};
$conf->add_steps($pkg);
$conf->options->set( %{$args} );
my $step = test_step_constructor_and_description($conf);

my $platform_orig = $conf->data->get('osname');
my $archname_orig = $conf->data->get('archname');
$conf->data->set( archname => 'foo-bar' );

########## _get_generated() ##########

my $TEMP_generated_orig = $conf->data->get('TEMP_generated');
{
    $conf->options->set(verbose => 1);
    my ($stdout, $stderr, $rv);
    my $expected = q{foo};
    $conf->data->set( TEMP_generated => $expected );
    capture(
        sub { $rv = $step->_get_generated( $conf ) },
        \$stdout,
        \$stderr,
    );
    is( $rv, $expected, "Got expected generated");
    like( $stdout, qr/\($expected\)/, "Got expected verbose output");
}
$conf->data->set( TEMP_generated => undef );
$conf->options->set(verbose => 0);
is( $step->_get_generated( $conf ), q{},
    "Got expected generated");

# re-set to original values
$conf->data->set( TEMP_generated => $TEMP_generated_orig );

########## _handle_asm() ##########

my $platform_asm_orig = $conf->data->get('platform_asm');
my $cwd = cwd();
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    $conf->data->set( platform_asm => 1 );
    my $platform = 'aix';
    $conf->data->set( platform => $platform );
    mkpath( 'src', { mode => 0755 } ) or croak "Unable to make testing directory";
    my $asmfile = File::Spec->catfile( 'src', 'platform_asm.s' );
    open my $FH, '>', $asmfile or croak "Unable to open handle for writing";
    print $FH "Hello asm\n";
    close $FH or croak "Unable to close handle after writing";
    $step->_handle_asm($conf);
    my $text = _slurp( $asmfile );
    like($text, qr/Hello asm/s, "File unchanged, as expected");

    chdir $cwd or croak "Unable to change back to starting directory";
}
# re-set to original values
$conf->data->set( platform_asm => $platform_asm_orig );
$conf->data->set( platform     => $platform_orig );

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    $conf->data->set( platform_asm => 1 );
    my $platform = 'aix';
    $conf->data->set( platform => $platform );

    mkpath( 'src', { mode => 0755 } )
        or croak "Unable to make testing directory";

    my $asmfile = File::Spec->catfile( 'src', 'platform_asm.s' );
    open my $FH, '>', $asmfile or croak "Unable to open handle for writing";
    print $FH "Hello asm\n";
    close $FH or croak "Unable to close handle after writing";

    my $path = File::Spec->catdir( 'config', 'gen', 'platform', $platform );
    mkpath( $path, { mode => 0755 } )
        or croak "Unable to make testing directory";

    my $configfile = File::Spec->catfile( $path, 'asm.s' );
    open my $FH2, '>', $configfile or croak "Unable to open handle for writing";
    print $FH2 "Goodbye world\n";
    close $FH2 or croak "Unable to close handle after writing";

    $step->_handle_asm($conf);

    my $text = _slurp( $asmfile );
    like($text, qr/Goodbye world/s, "File changed, as expected");

    chdir $cwd or croak "Unable to change back to starting directory";
}
# re-set to original values
$conf->data->set( platform_asm => $platform_asm_orig );
$conf->data->set( platform     => $platform_orig );

########## _handle_begin_c() ##########
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $platform = 'darwin';
    $conf->data->set( platform => $platform );

    my $path = File::Spec->catdir( 'config', 'gen', 'platform', $platform );
    mkpath( $path, { mode => 0755 } ) or croak "Unable to make testing directory";
    copy qq{$cwd/config/gen/platform/$platform/begin.c},
        qq{$path/begin.c}
            or croak "Unable to copy file for testing";

    mkpath( 'src', { mode => 0755 } ) or croak "Unable to make testing directory";
    my $plat_c = q{src/platform.c};
    open my $PLATFORM_C, '>', $plat_c
        or croak "Unable to open handle for writing";
    $step->_handle_begin_c($platform, $PLATFORM_C);
    close $PLATFORM_C or croak "Unable to close handle after writing";

    my $text = _slurp( $plat_c );
    like($text, qr/#undef environ.*#undef bool/s,
        "Got expected text in header file");
    unlike($text, qr/Local variables/s, "Coda stripped, as desired");

    chdir $cwd or croak "Unable to change back to starting directory";
}

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

gen/platform-01.t - test gen::platform

=head1 SYNOPSIS

    % prove t/steps/gen/platform-01.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test gen::platform.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

config::gen::platform, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
