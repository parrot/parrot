#! perl
# Copyright (C) 2007, The Perl Foundation.
# $Id$
# 001-options.t

use strict;
use warnings;

BEGIN {
    use FindBin qw($Bin);
    use Cwd qw(cwd realpath);
    our $topdir = realpath($Bin) . "/../..";
    unshift @INC, qq{$topdir/lib};
}
use Test::More tests => 37;
use Carp;
use_ok(
    'Parrot::Configure::Options', qw|
        process_options
        |
);
use_ok(
    "Parrot::Configure::Options::Conf", qw|
        @valid_options
        |
);
use_ok("Parrot::IO::Capture::Mini");

my %valid;
my $badoption = q{samsonanddelilah};

no warnings 'once';
%valid = map { $_, 1 } @Parrot::Configure::Options::Conf::valid_options;
use warnings;
ok( scalar keys %valid,          "non-zero quantity of valid options found" );
ok( defined $valid{debugging},   "debugging option found" );
ok( defined $valid{maintainer},  "maintainer option found" );
ok( defined $valid{help},        "help option found" );
ok( defined $valid{version},     "version option found" );
ok( defined $valid{verbose},     "verbose option found" );
ok( !defined $valid{$badoption}, "invalid option not found" );
ok( !defined $valid{step},       "invalid 'step' option not found" );
ok( !defined $valid{target},     "invalid 'target' option not found" );

open my $FH, '<', "$main::topdir/Configure.pl"
    or croak "Unable to open handle to $main::topdir/Configure.pl:  $!";
my $bigstr;
{
    local $/ = undef;
    $bigstr = <$FH>;
}
close $FH or croak "Unable to close handle to Configure.pl:  $!";

# Ignore any POD I have moved to an __END__ block.
$bigstr =~ s/__END__.*//s;
my ( @lines, @possible_methods );
@lines = grep { /^=item/ } ( split /\n/, $bigstr );
foreach my $l (@lines) {
    my $method;
    if ( $l =~ /^=item C<--([-_\w]+)(?:[=>])/ ) {
        $method = $1;
        push @possible_methods, $method;
    }
}
my $invalid = 0;
foreach my $m (@possible_methods) {
    unless ( defined $valid{$m} ) {
        carp "Possibly invalid method: $m";
        $invalid++;
    }
}
ok( !$invalid, "No invalid methods described in POD" );

my $args;
$args = process_options(
    {
        argv => [],
        mode => q{configure},
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

$args = process_options(
    {
        mode => q{configure},
        ,
    }
);
ok( defined $args,
    "process_options() returned successfully even though no explicit 'argv' key was provided" );

my $CC = "/usr/bin/gcc-3.3";
my $CX = "/usr/bin/g++-3.3";
$args = process_options(
    {
        argv => [
            q{--cc=$CC},      q{--cxx=$CX}, q{--link=$CX}, q{--ld=$CX},
            q{--without-icu}, q{--without-gmp},
        ],
        mode => q{configure},
    }
);
ok( defined $args, "process_options() returned successfully when options were specified" );

eval { $args = process_options( { argv => [qq<--${badoption}=72>], mode => q{configure}, } ); };
like(
    $@,
    qr/^Invalid option.*$badoption/,
    "process_options() failed due to bad option '$badoption'"
);

$badoption = q{step};
eval { $args = process_options( { argv => [qq<--${badoption}>], mode => q{configure}, } ); };
like(
    $@,
    qr/^Invalid option.*$badoption/,
    "process_options() failed due to bad option '$badoption'"
);

$badoption = q{target};
eval { $args = process_options( { argv => [qq<--${badoption}>], mode => q{configure}, } ); };
like(
    $@,
    qr/^Invalid option.*$badoption/,
    "process_options() failed due to bad option '$badoption'"
);

{
    my ( $tie, $rv, $msg );
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $args = process_options(
        {
            argv => [q{--help}],
            mode => q{configure},
        }
    );
    ok( !defined $args, "process_options() returned undef after 'help' option" );
    $msg = $tie->READLINE;
    like( $msg, qr/--help/i, "got correct message after 'help' option" );
}
untie *STDOUT;

{
    my ( $tie, $rv, $msg );
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $args = process_options(
        {
            argv => [q{--}],
            mode => q{configure},
        }
    );
    ok( !defined $args,
        "process_options() returned undef after '--' option triggered help message" );
    $msg = $tie->READLINE;
    like( $msg, qr/--help/i, "got help message as expected" );
}
untie *STDOUT;

{
    my ( $tie, $rv, $msg );
    $tie = tie *STDOUT, "Parrot::IO::Capture::Mini"
        or croak "Unable to tie";
    $args = process_options(
        {
            argv => [q{--version}],
            mode => q{configure},
        }
    );
    ok( !defined $args, "process_options() returned undef after 'version' option" );
    $msg = $tie->READLINE;
    like( $msg, qr/Parrot Version/i, "got correct message after 'version' option" );
}
untie *STDOUT;

$args = process_options(
    {
        argv => [ q{--lex}, ],
        mode => q{configure},
    }
);
ok( defined $args, "process_options() returned successfully after 'lex' option" );
ok( $args->{maintainer}, "'maintainer' attribute is true after 'lex' option" );

$args = process_options(
    {
        argv => [ q{--yacc}, ],
        mode => q{configure},
    }
);
ok( defined $args, "process_options() returned successfully after 'yacc' option" );
ok( $args->{maintainer}, "'maintainer' attribute is true after 'yacc' option" );

$args = process_options(
    {
        argv => [q{--debugging=1}],
        mode => q{configure},
    }
);
ok( defined $args, "process_options() returned successfully" );
ok( $args->{debugging}, "debugging turned on explicitly" );

$args = process_options(
    {
        argv => [q{--debugging=0}],
        mode => q{configure},
    }
);
ok( defined $args, "process_options() returned successfully" );
ok( !$args->{debugging}, "debugging explicitly turned off" );

pass("Completed all tests in $0");

################### DOCUMENTATION ###################

=head1 NAME

001-options.t - test Parrot::Configure::Options as used in Configure.pl

=head1 SYNOPSIS

    % prove t/configure/001-options.t

=head1 DESCRIPTION

The files in this directory test functionality used by F<Configure.pl>.

The tests in this file test subroutines exported by
Parrot::Configure::Options as it is used in F<Configure.pl>, I<i.e.>, with
C<mode => configure>..

=head1 AUTHOR

James E Keenan

=head1 SEE ALSO

Parrot::Configure::Options, Parrot::Configure::Options::Conf, F<Configure.pl>.

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
