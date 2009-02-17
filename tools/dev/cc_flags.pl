#! perl
################################################################################
# Copyright (C) 2001-2003, Parrot Foundation.
# $Id$
################################################################################

=head1 NAME

tools/dev/cc_flags.pl - Process compiler flags

=head1 SYNOPSIS

    % perl tools/dev/cc_flags.pl transform compiler flags

=head1 DESCRIPTION

This script is used in a F<Makefile> to process the flags to pass to the
compiler for each C file.

See F<config/gen/makefiles/CFLAGS.in> for the transformation file format.

=head1 SEE ALSO

F<config/gen/cflags/root.in>.

=cut

################################################################################

use strict;
use warnings;

my $return_only;
my $verbose;

if ($ARGV[0] eq '--return-only') {
    $return_only = 1;
    shift;
}

if ($ARGV[0] eq '-v') {
    $verbose = 1;
    shift;
}

my $cflags = shift;

open my $F, '<', $cflags or die "open $cflags: $!\n";

my @options;

while (<$F>) {
    chomp;
    s/#.*//;
    next unless /\S/;

    my $regex;
    if (s/^\{(.*?)\}\s*//) {
        next unless $1;
        $regex = qr/$1/;
    }
    elsif (s/^(\S+)\s*//) {
        $regex = qr/^\Q$1\E$/;
    }
    else {
        die "syntax error in $cflags: line $., $_\n";
    }

    for ( ; ; ) {
        if (s/^([-+])\{(.*?)\}\s*//) {
            next unless $2;
            my ( $sign, $options ) = ( $1, $2 );
            foreach my $option ( split ' ', $options ) {
                push @options, [ $regex, $sign, $option ];
            }
        }
        elsif (s{s(.)(.*?)\1(.*?)\1([imsx]*)\s*}{}) {
            my $mod = "";
            $mod = "(?$4)" if $4;

            push @options, [ $regex, 's', "$mod$2", $3 ];
        }
        elsif (/\S/) {
            die "syntax error in $cflags: line $., $_\n";
        }
        else {
            last;
        }
    }
}

my ($cfile) = grep /\.c$/, @ARGV;

my ( $inject_point, $where );

foreach (@ARGV) {
    last if $_ eq '';
    ++$where;
}
if ($where) {

    # Found a "" - remove it
    splice @ARGV, $where, 1;
    $inject_point = $where;
}
else {
    $inject_point = 1;
}

if ($cfile) {
    foreach my $option (@options) {
        if ( $cfile =~ $option->[0] ) {
            if ( $option->[1] eq '+' ) {
                splice @ARGV, $inject_point, 0, $option->[2];
            }
            elsif ( $option->[1] eq '-' ) {
                @ARGV = grep { $_ ne $option->[2] } @ARGV;
            }
            else {
                foreach my $arg (@ARGV) {
                    $arg =~ s/$option->[2]/$option->[3]/;
                }
            }
        }
    }

    # print "@ARGV\n";

    # Visual C++ already prints the source file name...
    if ( $ARGV[0] =~ /cl(?:\.exe)?/i ) {

        # ...but only the file name, so we print the path
        # to the directory first
        if ( $cfile =~ /(.*[\/\\])/ ) {
            print $1;
        }
    }
    else {
        print "$cfile\n";
    }
}

if ($return_only) {
    print join ' ', @ARGV;
    exit;
}

if ($verbose) {
    print join ' ', @ARGV;
}

exit system(@ARGV) / 256;

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
