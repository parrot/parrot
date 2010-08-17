#! perl
# Copyright (C) 2007, Parrot Foundation.
# $Id$
# 01-options.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    our $topdir = realpath($Bin) . "/../..";
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests => 29;
use Carp;
use_ok(
    'Parrot::Configure::Options', qw|
        process_options
        |
);
use_ok(
    "Parrot::Configure::Options::Reconf", qw|
        @valid_options
        |
);
use IO::CaptureOutput qw | capture |;

my %valid;
my $badoption = q{samsonanddelilah};

no warnings 'once';
%valid = map { $_, 1 } @Parrot::Configure::Options::Reconf::valid_options;
use warnings;
ok( scalar keys %valid,          "non-zero quantity of valid options found" );
ok( defined $valid{debugging},   "debugging option found" );
ok( defined $valid{maintainer},  "maintainer option found" );
ok( defined $valid{help},        "help option found" );
ok( defined $valid{verbose},     "verbose option found" );
ok( !defined $valid{$badoption}, "invalid option not found" );

my $args;
$args = process_options(
    {
        argv => [],
        mode => q{reconfigure},
    }
);
ok( defined $args, "process_options() returned successfully" );
ok( $args->{debugging}, "debugging turned on by default" );

eval { $args = process_options( { argv => [] } ); };
like(
    $@,
    qr/'mode' argument not provided to process_options\(\)/,
    "process_options() failed due to lack of argument 'mode'"
);

eval { $args = process_options( { argv => [], mode => 'foobar' } ); };
like(
    $@,
    qr/Invalid value for 'mode' argument to process_options\(\)/,
    "process_options() failed due to invalid 'mode' argument"
);

$args = process_options( { mode => q{reconfigure}, } );
ok( defined $args,
    "process_options() returned successfully even though no explicit 'argv' key was provided" );

$args = process_options(
    {
        argv => [ q{--ask}, q{--verbose} ],
        mode => q{reconfigure},
    }
);
ok( defined $args, "process_options() returned successfully when options were specified" );

$args = process_options(
    {
        argv => [ q{--step=gen::makefiles}, q{--target=Makefile} ],
        mode => q{reconfigure},
    }
);
ok( defined $args,
    "With 'reconfigure' mode, 'step' and 'target' are valid options to process_options()" );

$badoption = q{cc};
my $CC = "/usr/bin/gcc-3.3";
eval { $args = process_options( { argv => [qq{--$badoption=$CC}], mode => q{reconfigure}, } ); };
like(
    $@,
    qr/^Invalid option "$badoption"/,
    "process_options() failed due to bad option '$badoption'"
);

{
    my ($rv, $stdout);
    capture(
        sub { $args = process_options(
                { argv => [q{--help}], mode => q{reconfigure}, }
            ); },
        \$stdout,
    );
    ok( !defined $args, "process_options() returned undef after 'help' option" );
    like( $stdout, qr/--help/i, "got correct message after 'help' option" );
}

{
    my ($rv, $stdout);
    capture(
        sub { $args = process_options(
                { argv => [q{--}], mode => q{reconfigure}, }
            ); },
        \$stdout,
    );
    like( $stdout, qr/--help/i, "got help message as expected" );
}

$badoption = q{version};
eval { $args = process_options( { argv => [qq{--$badoption}], mode => q{reconfigure}, } ); };
like(
    $@,
    qr/^Invalid option "$badoption"/,
    "process_options() failed due to bad option '$badoption'"
);

$args = process_options(
    {
        argv => [ q{--lex}, ],
        mode => q{reconfigure},
    }
);
ok( defined $args, "process_options() returned successfully after 'lex' option" );
ok( $args->{maintainer}, "'maintainer' attribute is true after 'lex' option" );

$args = process_options(
    {
        argv => [ q{--yacc}, ],
        mode => q{reconfigure},
    }
);
ok( defined $args, "process_options() returned successfully after 'yacc' option" );
ok( $args->{maintainer}, "'maintainer' attribute is true after 'yacc' option" );

$args = process_options(
    {
        argv => [q{--debugging=1}],
        mode => q{reconfigure},
    }
);
ok( defined $args, "process_options() returned successfully" );
ok( $args->{debugging}, "debugging turned on explicitly" );

$args = process_options(
    {
        argv => [q{--debugging=0}],
        mode => q{reconfigure},
    }
);
ok( defined $args, "process_options() returned successfully" );
ok( !$args->{debugging}, "debugging explicitly turned off" );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

01-options.t - test Parrot::Configure::Options as used in F<tools/dev/reconfigure.pl>

=head1 SYNOPSIS

    % prove t/postconfigure/01-options.t

=head1 DESCRIPTION

The files in this directory test functionality used after initial
configuration.

The tests in this file test subroutines exported by Parrot::Configure::Options
as it is used in F<tools/dev/reconfigure.pl>, I<i.e.>, with C<mode =>
reconfigure>.

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure::Options, Parrot::Configure::Options::Reconf, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
