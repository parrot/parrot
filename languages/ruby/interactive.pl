#! perl -w

use strict;
use lib '.';
use Data::Dumper;
use Term::ReadLine;
use Parse::RecDescent;
use Ruby;

my $grammar = Parse::RecDescent->new($Ruby::grammar);
my $term = Term::ReadLine->new('foo');
my $prompt = "> ";
my $text;
while(defined($text = $term->readline($prompt))) {
  exit if $text =~ /^q(uit)?/;
  if($text eq 'trace on') {
    $::RD_TRACE = 1;
    print "Trace on\n";
  }
  elsif($text eq 'trace off') {
    $::RD_TRACE = 0;
    print "Trace off\n";
  }
  elsif($text =~ /^<(.*)/) {
      my ($fh, $file_data);
      open $fh, $text;
      local $/;
      $file_data = <$fh>;
#      $file_data =~ s/\cJ/ /g;
#      $file_data =~ s/\cM/ /g;
      print $file_data, "\n";
      my $return = Data::Dumper->Dump($grammar->program($file_data));
      print $return;
  }
  else {
    my $return = Data::Dumper->Dump($grammar->program($text));
    print $return;
  }
}
