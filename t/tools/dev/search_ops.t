#! perl
# Copyright (C) 2001-2011, Parrot Foundation.

use strict;
use warnings;
use lib qw(lib t/tools/dev/search_ops);

use File::Temp        qw(tempdir);
use Test::More        tests => 10;
use IO::CaptureOutput qw(capture);

use Parrot::SearchOps qw(search_all_ops_files help);
use samples           qw($core $debug $mangled $string);

my %samples;

%samples = (
    core    => { text => $core,      file => q|core.ops|      },
    debug   => { text => $debug,     file => q|debug.ops|     },
    mangled => { text => $mangled,   file => q|mangled.ops|   },
    string  => { text => $string,    file => q|string.ops|    },
);

{
    my ($stdout, $stderr);
    capture(
        \&help,
        \$stdout,
        \$stderr,
    );
    like($stdout,
        qr/^\s*perl\stools\/dev\/search_ops\.pl.*?ops_pattern/s,
        "Got expected start to help message",
    );
    like($stdout,
        qr/Given a valid Perl 5 regex as an argument/s,
        "Got expected line from body of help message",
    );
}

my $wrap_width = 70;
my $opsdir = q{t/tools/dev/search_ops};

{
    my $tdir = tempdir( CLEANUP => 1 );
    foreach my $g (keys %samples) {
        open my $IN, '>', qq{$tdir/$samples{$g}{file}}
            or die "Unable to open $samples{$g}{file} for writing";
        print $IN $samples{$g}{text};
        close $IN or die "Unable to close $samples{$g}{file} after writing";
    }
    my $pattern = q{load};
    my $total_identified;
    my ($stdout, $stderr);
    capture(
        sub { $total_identified = search_all_ops_files(
                $pattern, $wrap_width, $tdir ); },
        \$stdout,
        \$stderr,
    );
    like($stdout,
        qr/pseudo-core\.ops.*?\(2 matches\).*?pseudo-debug\.ops.*?\(1 match\)/s,
        "Got expected output",
    );
    like($stdout,
        qr/load_bytecode.*?loadlib.*?debug_load/s,
        "Got expected output",
    );
    is($total_identified, 3, "Got expected total number of ops for $pattern");
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    foreach my $g (keys %samples) {
        open my $IN, '>', qq{$tdir/$samples{$g}{file}}
            or die "Unable to open $samples{$g}{file} for writing";
        print $IN $samples{$g}{text};
        close $IN or die "Unable to close $samples{$g}{file} after writing";
    }
    my $pattern = q{concat};
    my $total_identified;
    my ($stdout, $stderr);
    capture(
        sub { $total_identified = search_all_ops_files(
                $pattern, $wrap_width, $tdir ); },
        \$stdout,
        \$stderr,
    );
    unlike($stdout, qr/n_concat\(foobar/,
        "Badly formatted entry excluded from display, as expected");
    is($total_identified, 8, "Got expected total number of ops for $pattern");
}

{
    my $tdir = tempdir( CLEANUP => 1 );
    foreach my $g (keys %samples) {
        open my $IN, '>', qq{$tdir/$samples{$g}{file}}
            or die "Unable to open $samples{$g}{file} for writing";
        print $IN $samples{$g}{text};
        close $IN or die "Unable to close $samples{$g}{file} after writing";
    }
    my $pattern = q{chopn};
    my $total_identified;
    my ($stdout, $stderr);
    capture(
        sub { $total_identified = search_all_ops_files(
                $pattern, $wrap_width, $tdir ); },
        \$stdout,
        \$stderr,
    );
    unlike($stdout, qr/NAME/,
        "Badly formatted entry excluded from display, as expected");
    is($total_identified, 2, "Got expected total number of ops for $pattern");
}

# %samples redefined here because we don't want its contents included in --all
%samples = (
    core    => { text => $core,      file => q|core.ops|      },
    debug   => { text => $debug,     file => q|debug.ops|     },
    string  => { text => $string,    file => q|string.ops|    },
);

{
    my $tdir = tempdir( CLEANUP => 1 );
    foreach my $g (keys %samples) {
        open my $IN, '>', qq{$tdir/$samples{$g}{file}}
            or die "Unable to open $samples{$g}{file} for writing";
        print $IN $samples{$g}{text};
        close $IN or die "Unable to close $samples{$g}{file} after writing";
    }
    my $pattern = q{};
    my $total_identified;
    my ($stdout, $stderr);
    capture(
        sub { $total_identified = search_all_ops_files(
                $pattern, $wrap_width, $tdir ); },
        \$stdout,
        \$stderr,
    );
    is($total_identified, 12, "Got expected total number of ops for --all");
}

=head1 NAME

t/tools/dev/search_ops.t - test subroutines used in tools/dev/search_ops.pl

=head1 SYNOPSIS

    % prove t/tools/dev/search_ops.t

=head1 DESCRIPTION

This file includes tests which:

=over 4

=item *

Test the basic operation of Parrot::SearchOps and
demonstrate that it will match patterns in more than one file.

=item *

Demonstrate that a pattern such as C<concat> will pick up both
C<concat> and C<n_concat> functions.  It also demonstrates that an F<.ops> file
with a function header not followed by a description will not print the
header.

=item *

Demonstrate that an F<.ops> file with a C<=head1 NAME> paragraph not
followed by another paragraph will not print the C<NAME> paragraph.

=item *

Demonstrate what happens when the C<--all> option is provided to
F<tools/dev/search_ops.pl>.

=item *

Test the Parrot::SearchOps C<usage()> and C<help()> functions.

=back

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
