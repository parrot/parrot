#! perl
use strict;
use warnings;

use Fatal qw{open};

# get a list of all the builtins we have.

my @commands = ( ( glob 'src/builtin/*.pir' ), ( glob 'runtime/builtin/*.pir' ) );
my @a = map { my $a = $_; $a =~ s{.*/(.*)[.]pir}{$1}; $a } (@commands);

# Check each of these builtins to see if they are just a stub, and skippable.

my ( @keep, @skip );
foreach my $file (@commands) {
    open my $fh, '<', $file;
    my $line = <$fh>;
    if ( $line =~ /XXX Stub/i ) {
        $file =~ m{.*/(.*)[.]pir$};
        push @skip, $1;
    }
    close $fh;
}

print "SKIPPING @skip\n";

# get a list of all the tests in the harness.

my $teetcl = 't_tcl';

my @b = map { s/.*\/(.*)\.t/$1/; $_ } ( glob("$teetcl/*.t") );

my @keepers = qw( appendComp basic cmdAH cmdIL cmdInfo cmdMZ compile
    config fileName fileSystem main misc parse parseExpr parseOld
    regexpComp utf util );

my %numtests;

foreach my $test (@b) {
    next if grep { $test eq $_ } @skip;
    if ( grep { $_ eq $test } @keepers ) {
        push @keep, $test;
    }
    elsif ( grep { $_ eq $test || "$_-old" eq $test } @a ) {
        push @keep, $test;
    }
    else {
        push @skip, $test;
    }
}

my ( $total_skipped, $clock_skipped, $deprecated );

for my $file (@skip) {
    my $path = "$teetcl/$file.t";
    next unless -f $path;    # Might have a command that doesn't have a test file.
    open my $test_h, '<', $path;
READLINE:
    while ( !eof $test_h ) {
        my $line = <$test_h>;
        $line =~ /^use Parrot::Test tests => (\d+)/;
        my $num_tests = $1;
        next READLINE unless $num_tests;
        $numtests{$file} = $num_tests;
        $total_skipped += $num_tests;
        if ( $file eq 'clock' ) {
            $clock_skipped = $num_tests;
        }
        elsif ( $file eq 'case' ) {
            $deprecated = $num_tests;
        }
        last READLINE;
    }
    close $test_h;
}

my @tests = map { "$teetcl/$_.t" } @keep;
if ( !@tests ) {
    die "Couldn't find any tcl test files to run.\n";
}
my $cmd = "$^X t/harness @tests";
print "$cmd\n";
system $cmd;

print "we are skipping $total_skipped total tests.\n";
print "(-clock ($clock_skipped) -deprecated ($deprecated))\n";

# Local Variables:
#   mode: cperl
#   cperl-indent-level: 4
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4:
