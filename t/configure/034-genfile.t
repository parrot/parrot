#!perl
# Copyright (C) 2001-2012, Parrot Foundation.

use strict;
use warnings;

use Test::More qw(no_plan); # tests => 15;
use Carp;
use Cwd;
use File::Temp 0.13 qw/ tempdir /;
use lib qw( lib t/configure/testlib );
use Parrot::Configure;
use IO::CaptureOutput qw | capture |;

my $cwd = cwd();
my $conf = Parrot::Configure->new;
$conf->data->set( make => 'make' );

my $nonexistent = 'config/gen/makefiles/foobar';
eval { $conf->genfile(  $nonexistent => 'CFLAGS', comment_type => '#', ); };
like(
    $@, qr/Can't open $nonexistent/,    #'
    "Got expected error message when non-existent file provided as argument to genfile()."
);

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN qq{Hello world\n};
    close $IN or croak "Unable to close temp file";
    ok(
        $conf->genfile(
            $dummy   => 'CFLAGS',
            file_type => 'makefile',
        ),
        "genfile() returned true value with 'file_type' option being set to 'makefile'"
    );
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN qq{Hello world\n};
    close $IN or croak "Unable to close temp file";
    eval { $conf->genfile(  $dummy => 'CFLAGS', file_type => 'makefile', comment_type => q{<!--}, ); };
    like(
        $@,
        qr/^Unknown comment type/,
        "genfile() failed due to unrecognized comment type with expected message"
    );
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN qq{#perl Hello world\n};
    close $IN or croak "Unable to close temp file";
    ok(
        $conf->genfile(
            $dummy       => 'CFLAGS',
            file_type    => 'makefile',
            feature_file => 0,
        ),
        "genfile() returned true value with false value for 'feature_file' option"
    );
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN q{#perl\nuse strict;\n$something = 'something';\n};
    print $IN <<'END_DUMMY';
#perl
if (@verbose@) { sprint "Hello world\n"; }
END_DUMMY
    close $IN or croak "Unable to close temp file";
    my ($stdout, $stderr);
    capture ( sub { eval { $conf->genfile( $dummy => 'CFLAGS', feature_file => 1, ) } },
        \$stdout, \$stderr );
    ok( $stderr, "Error message caught" );
    like( $stderr, qr/sprint/, "Error message had expected content" );
    ok( $@,     "Bad Perl code caught by genfile()" );

    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN q{@foobar@\n};
    close $IN or croak "Unable to close temp file";
    my ($rv, $stdout, $stderr) ;
    capture (
        sub { $rv = $conf->genfile( $dummy => 'CFLAGS' ) },
        \$stdout,
        \$stderr
    );
    ok($rv, "genfile() returned true when warning expected" );
    like( $stderr, qr/value for '\@foobar\@'/, "got expected warning" );

    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN q{This line ends in a slash/}, qq{\n};
    close $IN or croak "Unable to close temp file";
    eval { $conf->genfile(  $dummy => 'CFLAGS', replace_slashes => 1, ); };
    like( $@, qr//,
        "genfile() died as expected with replace_slashes option and line ending in trailing slash"
    );

    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    my $line = q{$(basename   morgan/lefay/abra.ca.dabra src/foo.c              hacks)};
    print $IN $line, "\n";
    close $IN or croak "Unable to close temp file";
    ok(
        $conf->genfile(
            $dummy              => 'CFLAGS',
            expand_gmake_syntax => 1,
        ),
        "genfile() did transformation of 'make' 'basename' as expected"
    );
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    my $line = q{$(notdir morgan/lefay/abra.ca.dabra src/foo.c          hacks)};

    print $IN $line, "\n";
    close $IN or croak "Unable to close temp file";
    ok(
        $conf->genfile(
            $dummy              => 'CFLAGS',
            expand_gmake_syntax => 1,
        ),
        "genfile() did transformation of 'make' 'notdir' as expected"
    );
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    my $line = q{$(addprefix src/,morgan/lefay/abra.ca.dabra foo                bar)};

    print $IN $line, "\n";
    close $IN or croak "Unable to close temp file";
    ok(
        $conf->genfile(
            $dummy              => 'CFLAGS',
            expand_gmake_syntax => 1,
        ),
        "genfile() did transformation of 'make' 'addprefix' as expected"
    );
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    my $line = q{$(wildcard *.c         *.o)};

    print $IN $line, "\n";
    close $IN or croak "Unable to close temp file";
    ok(
        $conf->genfile(
            $dummy              => 'CFLAGS',
            expand_gmake_syntax => 1,
        ),
        "genfile() did transformation of 'make' 'wildcard' as expected"
    );
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    chdir $tdir or croak "Unable to change to temporary directory";
    my $dummy = 'dummy';
    open my $IN, '>', $dummy or croak "Unable to open temp file for writing";
    print $IN qq{Hello world\n};
    close $IN or croak "Unable to close temp file";
    my $file_type = q{foobar};
    eval { $conf->genfile(  $dummy => 'CFLAGS', file_type => $file_type ); };
    like(
        $@,
        qr/^Unknown file_type '$file_type'/,
        "genfile() failed due to unrecognized file type with expected message"
    );
    unlink $dummy or croak "Unable to delete file after testing";
    chdir $cwd    or croak "Unable to change back to starting directory";
}

my $options = {};
my $target;

$target = 'my.makefile';
$options = Parrot::Configure::Compiler::_set_file_type_option($options, $target);
is($options->{file_type}, 'makefile',
    "_set_file_type_option(): Identified makefile");
$options = {};

$target = 'market.mak';
$options = Parrot::Configure::Compiler::_set_file_type_option($options, $target);
is($options->{file_type}, 'makefile',
    "_set_file_type_option(): Identified makefile");
$options = {};

$target = 'perlscript.pl';
$options = Parrot::Configure::Compiler::_set_file_type_option($options, $target);
is($options->{file_type}, 'perl',
    "_set_file_type_option(): Identified perl");
$options = {};

$target = 'MyModule.pm';
$options = Parrot::Configure::Compiler::_set_file_type_option($options, $target);
is($options->{file_type}, 'perl',
    "_set_file_type_option(): Identified perl");
$options = {};

$target = 'heavily_macroized.c';
$options = Parrot::Configure::Compiler::_set_file_type_option($options, $target);
is($options->{file_type}, 'c',
    "_set_file_type_option(): Identified c");
$options = {};

$target = 'heavily_macroized.h';
$options = Parrot::Configure::Compiler::_set_file_type_option($options, $target);
is($options->{file_type}, 'c',
    "_set_file_type_option(): Identified c");
$options = {};

$target = 'parrot_magic_cookie.pmc';
$options = Parrot::Configure::Compiler::_set_file_type_option($options, $target);
is($options->{file_type}, 'pmc',
    "_set_file_type_option(): Identified pmc");
$options = {};

$target = 'parrot_intermediate_representation.pir';
$options = Parrot::Configure::Compiler::_set_file_type_option($options, $target);
is($options->{file_type}, 'pir',
    "_set_file_type_option(): Identified pir");
$options = {};

$options->{file_type} = 'none';
$target = 'foobar';
$options = Parrot::Configure::Compiler::_set_file_type_option($options, $target);
ok(! exists $options->{file_type},
    "_set_file_type_option(): option deleted when it was 'none'");

################### DOCUMENTATION ###################

=head1 NAME

t/configure/034-genfile.t - tests Parrot::Configure::Compiler

=head1 SYNOPSIS

    prove t/configure/034-genfile.t

=head1 DESCRIPTION

Regression tests for the L<Parrot::Configure::Compiler> module.  This file holds
tests for Parrot::Configure::Compiler::genfile().

Thanks to http://start.it.uts.edu.au/w/doc/solaris/gmake/make_8.html for
instruction in using F<gmake> functions.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
