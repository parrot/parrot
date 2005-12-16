#!perl

use strict;
use warnings;

#get a list of all the builtins we have.

my @commands = (glob ('lib/builtins/*.pir'),glob('lib/commands/*.pir'));
my @a = map {$a = $_; $a =~ s/.*\/(.*)\.pir/$1/; $a} (@commands);

# Check each of these builtins to see if they are just a stub.

my (@keep,@skip);
foreach my $file (@commands) {
  open (F,"<",$file);
  my $line = <F>;
  if ($line =~ /XXX Stub/i) {
    $file =~ m/.*\/(.*)\.pir/;
    push @skip, $1;
  }
  close(F);
}

print "SKIPPING @skip\n";

# get a list of all the tests in the harness.

my $teetcl = "t_tcl";

my @b= map {s/.*\/(.*)\.t/$1/; $_} (glob ("$teetcl/*.t"));

my @keepers = qw/appendComp basic cmdAH cmdIL cmdInfo cmdMZ compile config main misc parse parseExpr parseOld regexpComp utf util /;

my %numtests;

foreach my $test (@b) {
  next if grep {$test eq $_} @skip;
  if (grep {$_ eq $test } @keepers) {
    push @keep, $test
  } elsif (grep {$_ eq $test || "$_-old" eq $test } @a) {
    push @keep, $test
  } else {
    push @skip, $test
  }
}

my ($total_skipped, $clock_skipped, $deprecated);

for my $file (@skip) {
  open (T,"<","$teetcl/$file.t");
  READLINE:
  while (!eof(T)) {
    my $line = <T>;
    $line =~ /^use Parrot::Test tests => (\d+)/;
    my $num_tests = $1;
    next READLINE unless $num_tests;
    $numtests{$file} = $num_tests;
    $total_skipped += $num_tests;
    if ($file eq "clock") {
      $clock_skipped = $num_tests;
    } elsif ($file eq "case") {
      $deprecated = $num_tests;
    }
    last READLINE;
  }
  close(T);
}

my @tests = map {"$teetcl/$_.t"} @keep;
my $cmd = "$^X t/harness @tests";
print "$cmd\n";
system($cmd);

print "we are skipping $total_skipped total tests at the moment.\n";
print "(-clock ($clock_skipped) -deprecated ($deprecated))\n";

