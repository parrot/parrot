#!/usr/bin/perl -w

use strict;
use FindBin;
use Getopt::Long;
use Pod::Usage;
use IO::File;
use File::Find;

$|++;

my %pathes   = ( parrot => '',     perl => '',   python => '',   ruby => '' );
my %suffixes = ( parrot => 'pasm',
                 parrot => 'imc',
		 perl => 'pl', python => 'py', ruby => 'rb' );
my $benchmarks = "$FindBin::Bin/../../examples/benchmarks";

=head1 NAME

parrotbench - Parrot benchmark

=head1 SYNOPSIS

parrotbench [options]

 Options:
   -benchmarks    path to benchmarks
   -conf          path to configuration file
   -help          display this help and exits
   -list          list available tests and exits
   -parrot        path to parrot
   -perl          path to perl
   -python        path to python
   -ruby          path to ruby
   -regex         only use benchmarks matching regex
   -time          show times instead of percentage

=head1 DESCRIPTION

Benchmark Parrot against other interpreters.

=head1 CONFIGURATION

You may specify pathes to executables in a configuration file.
That file may be placed as parrotbench.conf in the same directory
as parrotbench.pl or otherwise explicitly specified with the
-conf option.

Settings from the configuration file can be overridden by command
line options like -parrot.

Here is an example parrotbench.conf:

    parrot: /home/sri/parrot/parrot
    perl: /usr/bin/perl -w
    python: /usr/local/bin/python
    ruby: /opt/ruby/bin/ruby

=cut

my $conf  = "$FindBin::Bin/parrotbench.conf";
my $help  = 0;
my $list  = 0;
my $regex = '.*';
my $time  = 0;

GetOptions
  'conf=s'     => \$conf,
  'benchmarks' => \$benchmarks,
  'help|?'     => \$help,
  'list'       => \$list,
  'parrot=s'   => \$pathes{parrot},
  'perl=s'     => \$pathes{perl},
  'python=s'   => \$pathes{python},
  'ruby=s'     => \$pathes{ruby},
  'regex=s'    => \$regex,
  'time'       => \$time;

pod2usage 1 if $help;

# Check conf file
if ( -e $conf ) {
    my $file = new IO::File;
    $file->open("< $conf");
    while (<$file>) {
        if (/^\s*(\w*):\s*(.*)$/) {
            $pathes{$1} ||= $2;
        }
    }
    $file->close;
}

# Build lists
my ( %list, %tree );
find sub {
    foreach my $bin ( keys %suffixes ) {
        if (/(\w*).$suffixes{$bin}/) {
            my $benchmark = $1;
            if ( $benchmark =~ /$regex/ ) {
                $list{$benchmark}++;
                $tree{$bin}{$benchmark}++;
                next;
            }
        }
    }
}, $benchmarks;

# Print list
if ($list) {
    foreach my $benchmark ( keys %list ) {
        print "$benchmark";
        foreach my $bin ( keys %suffixes ) {
            print ", $bin" if $tree{$bin}{$benchmark};
        }
        print "\n";
    }
    exit;
}

# Benchmark
foreach my $bin ( sort keys %suffixes ) { print "\t$bin" }
print "\n";
foreach my $benchmark ( sort keys %list ) {
    next if !$time && $list{$benchmark} == 1;
    print "$benchmark";
    my $base = 0;
    foreach my $bin ( sort keys %suffixes ) {
        if ( $tree{$bin}{$benchmark} && $pathes{$bin} ) {
            my ( $suser, $ssys, $scuser, $scsys ) = times;
            system "$pathes{$bin} $benchmarks/$benchmark.$suffixes{$bin}"
              . '>/dev/null';
            my ( $euser, $esys, $ecuser, $ecsys ) = times;
            my $used = ( $ecuser - $scuser ) + ( $ecsys - $scsys );
            $base ||= $used;
            if ($time) {
                printf "\t%.3fs", $used;
            }
            else {
                printf "\t%d", $used / ( $base / 100 );
            }
        }
        else {
            print "\t-";
        }
    }
    print "\n";
}

=head1 AUTHOR

Sebastian Riedel, C<sri@cpan.org>

=cut

1;
