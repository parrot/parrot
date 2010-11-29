#! perl
# Copyright (C) 2010, Parrot Foundation.
# $Id$
# 02_methods.t

use strict;
use warnings;
use Carp;
use Cwd;
use File::Copy;
use File::Path qw( mkpath );
use File::Spec;
use File::Temp qw( tempdir );
use Test::More qw(no_plan); # tests => 46;
use lib qw( lib );
use Parrot::Headerizer::Functions qw( read_file );
use Parrot::Headerizer::Object;
use IO::CaptureOutput qw| capture |;

my $cwd = cwd();
my $self;
eval { $self = Parrot::Headerizer::Object->new([]); };
like($@, qr/Argument to Parrot::Headerizer::Object must be hashref/,
    "Got expected error message for bad argument to constructor" );

$self = Parrot::Headerizer::Object->new({ macro_match => 1});
isa_ok( $self, 'Parrot::Headerizer::Object' );

$self = Parrot::Headerizer::Object->new();
isa_ok( $self, 'Parrot::Headerizer::Object' );
ok( $self->valid_macro( 'PARROT_EXPORT' ),
    "valid_macro() confirmed validity of macro" );
ok(! $self->valid_macro( 'PARROT_FOOBAR' ),
    "valid_macro() confirmed invalidity of macro" );
my @valid_macros = $self->valid_macros;
ok( @valid_macros,
    "Headerizer object contains list of valid macros" );
ok(! defined $self->{macro_match}, "macro_match undefined" );

# print_final_message()
my $msg = 'message';
$self->{message} = $msg;
{
    my ($stdout, $stderr);
    capture(
        sub { $self->print_final_message(); },
        \$stdout,
        \$stderr,
    );
    like($stdout, qr/$msg/s, "Got expected final message");
}
$msg = '';
$self->{message} = $msg;
{
    my ($stdout, $stderr);
    capture(
        sub { $self->print_final_message(); },
        \$stdout,
        \$stderr,
    );
    chomp($stdout);
    ok(! $stdout, "No final message");
}

# print_warnings()
my $warnings = {
    'file1' => {
        'func_alpha'    => [
            'alpha warning 1',
            'alpha warning 2',
            'alpha warning 3',
        ],
        'func_beta'      => [
            'beta warning 1',
            'beta warning 2',
        ],
    },
    'file2' => {
        'func_gamma'    => [
            'gamma warning 1',
            'gamma warning 2',
            'gamma warning 3',
        ],
    },
};
$self->{warnings} = $warnings;
{
    my ($stdout, $stderr);
    capture(
        sub { $self->print_warnings(); },
        \$stdout,
        \$stderr,
    );
    for my $func( qw| alpha gamma | ) {
        for (1..3) {
            like( $stdout, qr/func_alpha: alpha warning $_/s,
                "Got expected output" );
        }
    }
    for (1..2) {
        like( $stdout, qr/func_beta: beta warning $_/s,
            "Got expected output" );
    }
    like( $stdout, qr/8 warnings in 3 funcs in 2 C files/,
        "Got expected summary of headerizer warnings" );
}

# squawk()
$self->{warnings} = {};
{
    my ($stdout, $stderr);
    capture(
        sub { $self->print_warnings(); },
        \$stdout,
        \$stderr,
    );
    ok(! $stdout, "No warnings, hence no warnings printed" );
}
my ($file, $func, @error);
$file = 'file 4';
$func = 'func_delta';
$error[0] = 'delta warning 4';
$self->squawk($file, $func, $error[0]);
$error[1] = 'delta warning 5';
$self->squawk($file, $func, $error[1]);
{
    my ($stdout, $stderr);
    capture(
        sub { $self->print_warnings(); },
        \$stdout,
        \$stderr,
    );
    for (0..1) {
        like($stdout, qr/$error[$_]/s, "Got expected squawk message");
    }
}

# skip files in src/ops/
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to chdir during testing";

    my $srcdir    = File::Spec->catpath( $tdir, 'src' );
    my $srcopsdir = File::Spec->catpath( $tdir, 'src', 'ops' );
    mkpath( $srcopsdir, 0, 0777 );
    my $srcopso   = File::Spec->catfile( $srcopsdir, 'ops.o' );
    touchfile($srcopso);
    $self = Parrot::Headerizer::Object->new();
    isa_ok( $self, 'Parrot::Headerizer::Object' );
    $self->get_sources($srcopso);
    ok( ! keys %{$self->{sourcefiles}},
        "Skipped file in src/ops/ -> no sourcefiles" );
    ok( ! keys %{$self->{sourcefiles_with_statics}},
        "Skipped file in src/ops/ -> no sourcefiles_with_statics" );
    ok( ! keys %{$self->{api}},
        "Skipped file in src/ops/ -> no api" );

    chdir $cwd or croak "Unable to chdir back after testing";
}

# missing source file
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to chdir during testing";

    my $srcdir    = File::Spec->catpath( $tdir, 'src' );
    mkpath( $srcdir, 0, 0777 );
    my $srco   = File::Spec->catfile( $srcdir, 'other.o' );
    touchfile($srco);
    my $srcs   = File::Spec->catfile( $srcdir, 'other.s' );
    touchfile($srcs);
    $self = Parrot::Headerizer::Object->new();
    isa_ok( $self, 'Parrot::Headerizer::Object' );
    $self->get_sources($srco);
    ok( ! keys %{$self->{sourcefiles}},
        "Skipped file in src/ -> no sourcefiles" );
    ok( ! keys %{$self->{sourcefiles_with_statics}},
        "Skipped file in src/ -> no sourcefiles_with_statics" );
    ok( ! keys %{$self->{api}},
        "Skipped file in src/ -> no api" );

    chdir $cwd or croak "Unable to chdir back after testing";
}

# regular .c source file
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to chdir during testing";

    my $stub = 'list';
    my $srcdir    = File::Spec->catpath( $tdir, 'src' );
    mkpath( $srcdir, 0, 0777 );
    my $srco      = File::Spec->catfile( $srcdir, "$stub.o" );
    touchfile($srco);
    my $srcc      = File::Spec->catfile( $srcdir, "$stub.c" );
    copy "$cwd/t/tools/dev/headerizer/testlib/list.in" => $srcc
        or croak "Unable to copy";
    my $incdir    = File::Spec->catpath( $tdir, 'include', 'parrot' );
    mkpath( $incdir, 0, 0777 );
    my $inch      = File::Spec->catfile( $incdir, "$stub.h" );
    copy "$cwd/t/tools/dev/headerizer/testlib/list_h.in" => $inch
        or croak "Unable to copy";

    $self = Parrot::Headerizer::Object->new();
    isa_ok( $self, 'Parrot::Headerizer::Object' );
    $self->get_sources($srco);
    ok( keys %{$self->{sourcefiles}},
        "sourcefiles" );
    ok( ! keys %{$self->{sourcefiles_with_statics}},
        "no sourcefiles_with_statics" );
    ok( ! keys %{$self->{api}},
        "no api" );

    $self->process_sources();
    {
        my ($stdout, $stderr);
        capture(
            sub { $self->print_final_message; },
            \$stdout,
            \$stderr,
        );
        like($stdout, qr/Headerization complete/,
            "Got expected final message" );
    }
    chdir $cwd or croak "Unable to chdir back after testing";
}

# macro_match command-line option
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to chdir during testing";

    my $stub = 'list';
    my $srcdir    = File::Spec->catpath( $tdir, 'src' );
    mkpath( $srcdir, 0, 0777 );
    my $srco      = File::Spec->catfile( $srcdir, "$stub.o" );
    touchfile($srco);
    my $srcc      = File::Spec->catfile( $srcdir, "$stub.c" );
    copy "$cwd/t/tools/dev/headerizer/testlib/list.in" => $srcc
        or croak "Unable to copy";
    my $incdir    = File::Spec->catpath( $tdir, 'include', 'parrot' );
    mkpath( $incdir, 0, 0777 );
    my $inch      = File::Spec->catfile( $incdir, "$stub.h" );
    copy "$cwd/t/tools/dev/headerizer/testlib/list_h.in" => $inch
        or croak "Unable to copy";

    my $macro = 'PARROT_CAN_RETURN_NULL';
    $self = Parrot::Headerizer::Object->new( {
        macro_match => $macro,
    } );
    isa_ok( $self, 'Parrot::Headerizer::Object' );
    $self->get_sources($srco);
    ok( keys %{$self->{sourcefiles}},
        "sourcefiles" );
    ok( ! keys %{$self->{sourcefiles_with_statics}},
        "no sourcefiles_with_statics" );
    ok( keys %{$self->{api}},
        "api" );

    {
        my ($stdout, $stderr);
        capture(
            sub { $self->process_sources(); },
            \$stdout,
            \$stderr,
        );
        like($stdout, qr/src\/list\.c\s+Parrot_list_pop\s+Parrot_list_remove/s,
            "Got expected list of functions matching requested macro" );
    }
    {
        my ($stdout, $stderr);
        capture(
            sub { $self->print_final_message; },
            \$stdout,
            \$stderr,
        );
        like($stdout, qr/2 $macro functions/s,
            "Got expected final message" );
    }
    chdir $cwd or croak "Unable to chdir back after testing";
}

# .pmc source file; sourcefiles_with_statics
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to chdir during testing";

    my $stub = 'fixedbooleanarray';
    my $srcdir    = File::Spec->catpath( $tdir, 'src', 'pmc' );
    mkpath( $srcdir, 0, 0777 );
    my $srco      = File::Spec->catfile( $srcdir, "$stub.o" );
    touchfile($srco);
    my $srcc      = File::Spec->catfile( $srcdir, "$stub.c" );
    copy "$cwd/t/tools/dev/headerizer/testlib/${stub}_pmc.in" => $srcc
        or croak "Unable to copy";

    $self = Parrot::Headerizer::Object->new();
    isa_ok( $self, 'Parrot::Headerizer::Object' );
    $self->get_sources($srco);
    ok( ! keys %{$self->{sourcefiles}},
        "no sourcefiles" );
    ok( keys %{$self->{sourcefiles_with_statics}},
        "sourcefiles_with_statics" );
    ok( ! keys %{$self->{api}},
        "no api" );

    $self->process_sources();
    {
        my ($stdout, $stderr);
        capture(
            sub { $self->print_final_message; },
            \$stdout,
            \$stderr,
        );
        like($stdout, qr/Headerization complete/,
            "Got expected final message" );
    }
    chdir $cwd or croak "Unable to chdir back after testing";
}

# is_ignorable
{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to chdir during testing";

    my $stub = 'nci';
    my $srcdir    = File::Spec->catpath( $tdir, 'src', 'pmc' );
    mkpath( $srcdir, 0, 0777 );
    my $srco      = File::Spec->catfile( $srcdir, "$stub.o" );
    touchfile($srco);
    my $srcc      = File::Spec->catfile( $srcdir, "$stub.c" );
    copy "$cwd/t/tools/dev/headerizer/testlib/${stub}_pmc.in" => $srcc
        or croak "Unable to copy";

    $self = Parrot::Headerizer::Object->new();
    isa_ok( $self, 'Parrot::Headerizer::Object' );
    $self->get_sources($srco);
    ok( ! keys %{$self->{sourcefiles}},
        "no sourcefiles" );
    ok( keys %{$self->{sourcefiles_with_statics}},
        "sourcefiles_with_statics" );
    ok( ! keys %{$self->{api}},
        "no api" );

    $self->process_sources();
    {
        my ($stdout, $stderr);
        capture(
            sub { $self->print_final_message; },
            \$stdout,
            \$stderr,
        );
        like($stdout, qr/Headerization complete/,
            "Got expected final message" );
    }
    my $text = read_file($srcc);
    like( $text, qr/alt void/,
        "Got expected result for 'is_ignorable'" );
    chdir $cwd or croak "Unable to chdir back after testing";
}

pass("Completed all tests in $0");

sub touchfile {
    my $filename = shift;
    open my $IN, '>', $filename or croak "Unable to open for writing";
    print $IN "\n";
    close $IN or croak "Unable to close after writing";
    return 1;
}

################### DOCUMENTATION ###################

=head1 NAME

02_methods.t - Test functions in Parrot::Headerizer::Object.

=head1 SYNOPSIS

    % prove t/tools/dev/headerizer/02_methods.t

=head1 DESCRIPTION

The files in this directory test the publicly callable subroutines found in 
F<lib/Parrot/Headerizer.pm>.  By doing so, they help test the functionality
of the F<tools/dev/headerizer.pl> utility.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

F<tools/dev/headerizer.pl>; F<lib/Parrot/Headerizer.pm>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
