#! perl
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id$
use warnings;
use strict;
use Carp;

my $srcjit = q{src/jit};
opendir my $DIRH, $srcjit
    or croak "Unable to open $srcjit for reading: $!";
my %jitted_platforms =
    map { $_ => 1 }
    grep { -d qq[$srcjit/$_] and ! m|^\.| and -f qq[$srcjit/$_/core.jit]  }
    readdir $DIRH;
closedir $DIRH or croak "Unable to close $srcjit after reading: $!";

my %ops;
my $opsnum = 'src/ops/ops.num';
open my $OPS, '<',  $opsnum or croak "Cannot open $opsnum for reading: $!";
while (<$OPS>) {
    chomp;
    next if /^\s*#/ or /^\s*$/;
    if ( my ($op) = /(\S+)\s+\d+/ ) {
        $ops{$op}++;
    }
    else {
        croak "Malformed line in $opsnum: $.";
    }
}
close $OPS or croak "Unable to close $opsnum after reading: $!";

croak "Must supply single jitted platform as command-line argument"
    unless ( @ARGV == 1 and $jitted_platforms{$ARGV[0]} );

my $jit = shift(@ARGV);
my $jitfile = qq{$srcjit/$jit/core.jit};
open my $JIT, '<', $jitfile
    or croak "Unable to open $jitfile for reading: $!";
my %jitted;
while (<$JIT>) {
    chomp;
    if ( my ($j) = /^Parrot_(\S+)\s*\{\s*$/ ) {
        $jitted{$j}++;
    }
}
close $JIT or croak "Unable to close $jitfile after reading: $!";

my @not_jitted;
foreach my $op (keys %ops) {
    push @not_jitted, $op unless $jitted{$op};
}

printf "%-9s%9s\n",  ( 'Platform:',   $jit );
printf "%-13s%5d\n", ( 'Not jitted:', scalar @not_jitted );
printf "%-13s%5d\n", ( 'Jitted:'    , scalar keys %jitted );
printf "%-13s%5d\n", ( 'Total ops:' , scalar keys %ops );

=head1 NAME

tools/dev/list_unjitted.pl

=head1 ABSTRACT

For a given platform, report the number of ops JITted or not JITted.

=head1 USAGE

Called from top-level directory of Parrot distribution:

    perl tools/dev/list_unjitted.pl [platform]

... where I<platform> is a directory in F<src/jit> under which there exists a
F<core.jit> file.

Sample output on C<STDOUT>:

    Platform:      ppc
    Not jitted:   1085
    Jitted:        141
    Total ops:    1223

=head1 AUTHOR

Stefan Lidman (April 2004).  Revised and renamed by James E Keenan (April
2008).

=cut

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
