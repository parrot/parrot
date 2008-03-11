#! perl
# Copyright (C) 2001-2007, The Perl Foundation.
# $Id$

=head1 NAME

t/perl/Parrot_Test.t - Parrot::Test unit tests

=head1 SYNOPSIS

    % prove t/perl/Parrot_Test.t

=head1 DESCRIPTION

These tests cover the basic functionality of C<Parrot::Test>.

=cut

use strict;
use warnings;
use Test::More;

BEGIN {
    eval "use Test::Builder::Tester;";
    if ($@) {
        plan( skip_all => "Test::Builder::Tester not installed\n" );
        exit 0;
    }
    plan( tests => 66 );
}

use lib qw( . lib ../lib ../../lib );

BEGIN {
    my $pre_env = exists $ENV{PARROT_TEST} ? $ENV{PARROT_TEST} : undef;
    use_ok('Parrot::Test') or die;

    my $post_env = exists $ENV{PARROT_TEST} ? $ENV{PARROT_TEST} : undef;
    if ( defined $pre_env ) {
        is( $post_env, $pre_env, 'PARROT_TEST env unchanged' );
    }
    else {
        is( $post_env, 1, 'PARROT_TEST env set' );
    }
}

can_ok( 'Parrot::Test', $_ ) for qw/
    c_output_is                     c_output_isnt
    c_output_like
    example_output_is               example_output_isnt
    example_output_like
    language_error_output_is        language_error_output_isnt
    language_error_output_like
    language_output_is              language_output_isnt
    language_output_like
    pasm_error_output_is            pasm_error_output_isnt
    pasm_error_output_like          pasm_error_output_unlike
    pasm_output_is                  pasm_output_isnt
    pasm_output_like                pasm_output_unlike
    pbc_error_output_is             pbc_error_output_isnt
    pbc_error_output_like           pbc_error_output_unlike
    pbc_output_is                   pbc_output_isnt
    pbc_output_like                 pbc_output_unlike
    pir_error_output_is             pir_error_output_isnt
    pir_error_output_like           pir_error_output_unlike
    pir_output_is                   pir_output_isnt
    pir_output_like                 pir_output_unlike
    pir_2_pasm_is                   pir_2_pasm_isnt
    pir_2_pasm_like                 pir_2_pasm_unlike
    generate_languages_functions
    per_test
    plan
    skip
    slurp_file
    run_command
    write_code_to_file
    /;

# RT#46891 test run_command()

# per_test
is( Parrot::Test::per_test(), undef, 'per_test() no args' );
is( Parrot::Test::per_test( undef, 0 ),     undef, 'per_test() invalid first arg' );
is( Parrot::Test::per_test( 0,     undef ), undef, 'per_test() invalid second arg' );
is( Parrot::Test::per_test( undef, undef ), undef, 'per_test() two invalid args' );

# RT#46893 test write_code_to_file(), plan(), skip(), slurp_file()

# test the test functions from Parrot::Test
# RT#46893: test the untested test functions
my ( $desc, $err, $line );

# PASM
$desc = 'pasm_output_is: success';
test_out("ok 1 - $desc");
pasm_output_is( <<'CODE', <<'OUTPUT', $desc );
    print "ok\n"
    end
CODE
ok
OUTPUT
test_test($desc);

$desc = 'pasm_output_is: failure';
test_out("not ok 1 - $desc");
test_fail(+9);
$err = <<"ERR";
#          got: 'ok
# '
#     expected: 'not ok
# '
ERR
chomp $err;
test_err($err);
pasm_output_is( <<'CODE', <<"OUTPUT", $desc );
    print "ok\n"
    end
CODE
not ok
OUTPUT
test_test($desc);

$desc = 'pasm_output_isnt: success';
test_out("ok 1 - $desc");
pasm_output_isnt( <<'CODE', <<"OUTPUT", $desc );
    print "ok\n"
    end
CODE
not ok
OUTPUT
test_test($desc);

$desc = 'pasm_output_isnt: failure';
test_out("not ok 1 - $desc");
test_fail(+10);
$err = <<"ERR";
#     'ok
# '
#         ne
#     'ok
# '
ERR
chomp $err;
test_err $err;
pasm_output_isnt( <<'CODE', <<'OUTPUT', $desc );
    print "ok\n"
    end
CODE
ok
OUTPUT
test_test($desc);

$desc = 'pasm_output_like: success';
test_out("ok 1 - $desc");
pasm_output_like( <<'CODE', <<'OUTPUT', $desc );
    print "ok\n"
    end
CODE
/ok/
OUTPUT
test_test($desc);

$desc = 'pasm_output_like: failure';
test_out("not ok 1 - $desc");
test_fail(+9);
$err = <<"ERR";
#                   'ok
# '
#     doesn't match '/not ok/
# '
ERR
chomp $err;
test_err($err);
pasm_output_like( <<'CODE', <<"OUTPUT", $desc );
    print "ok\n"
    end
CODE
/not ok/
OUTPUT
test_test($desc);

# PIR
$desc = 'pir_output_is: success';
test_out("ok 1 - $desc");
pir_output_is( <<'CODE', <<'OUTPUT', $desc );
.sub 'test' :main
    print "ok\n"
.end
CODE
ok
OUTPUT
test_test($desc);

$desc = 'pir_output_is: failure';
test_out("not ok 1 - $desc");
test_fail(+9);
$err = <<"ERR";
#          got: 'ok
# '
#     expected: 'not ok
# '
ERR
chomp $err;
test_err($err);
pir_output_is( <<'CODE', <<"OUTPUT", $desc );
.sub 'test' :main
    print "ok\n"
.end
CODE
not ok
OUTPUT
test_test($desc);

$desc = 'pir_output_isnt: success';
test_out("ok 1 - $desc");
pir_output_isnt( <<'CODE', <<"OUTPUT", $desc );
.sub 'test' :main
    print "ok\n"
.end
CODE
not ok
OUTPUT
test_test($desc);

$desc = 'pir_output_isnt: failure';
test_out("not ok 1 - $desc");
test_fail(+10);
$err = <<"ERR";
#     'ok
# '
#         ne
#     'ok
# '
ERR
chomp $err;
test_err($err);
pir_output_isnt( <<'CODE', <<'OUTPUT', $desc );
.sub 'test' :main
    print "ok\n"
.end
CODE
ok
OUTPUT
test_test($desc);

$desc = 'pir_output_like: success';
test_out("ok 1 - $desc");
pir_output_like( <<'CODE', <<'OUTPUT', $desc );
.sub 'test' :main
    print "ok\n"
.end
CODE
/ok/
OUTPUT
test_test($desc);

$desc = 'pir_output_like: failure';
test_out("not ok 1 - $desc");
test_fail(+9);
$err = <<"ERR";
#                   'ok
# '
#     doesn't match '/not ok/
# '
ERR
chomp $err;
test_err($err);
pir_output_like( <<'CODE', <<"OUTPUT", $desc );
.sub 'test' :main
    print "ok\n"
.end
CODE
/not ok/
OUTPUT
test_test($desc);

$desc = 'pir_error_output_like: todo';
$line = line_num(+21);
my $location;
if ($Test::Builder::VERSION <= eval '0.33') {
    $location = "in $0 at line $line";
} else {
    $location = "at $0 line $line";
}
test_out("not ok 1 - $desc # TODO foo");
$err = <<"ERR";
#   Failed (TODO) test '$desc'
#   $location.
# Expected error but exited cleanly
# Received:
# ok
# 
# Expected:
# /not ok/
# 
ERR
chomp $err;
test_err($err);
pir_error_output_like( <<'CODE', <<"OUTPUT", $desc, todo => 'foo' );
.sub 'test' :main
    print "ok\n"
.end
CODE
/not ok/
OUTPUT
test_test($desc);

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
