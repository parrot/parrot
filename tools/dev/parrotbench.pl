#!/usr/bin/perl -w

use strict;
use FindBin;
use Getopt::Long;
use Pod::Usage;
use IO::File;
use File::Find;
use File::Spec;

$|++;

=head1 NAME

parrotbench - Parrot benchmark

=head1 SYNOPSIS

parrotbench [options]

 Options:
   -b -benchmarks     only use benchmarks matching regex
   -c -conf           path to configuration file
   -d -directory      path to benchmarks directory
   -e -executables    only use executables matching regex
   -h -? -help        display this help and exits
   -l -list           list available benchmarks and exits
   -t -time           show times instead of percentage

=head1 DESCRIPTION

Benchmark Parrot against other interpreters.

=head1 CONFIGURATION

You must specify pathes to executables in a configuration file.
That file may be placed as parrotbench.conf in the same directory
as parrotbench.pl or otherwise explicitly specified with the
-conf option.

Here is an example parrotbench.conf:

  parrot: ./parrot:	.pasm .imc
  parrotj: ./parrot -j:	.pasm .imc
  parrotC: ./parrot -C:	.pasm .imc
  perl: /usr/bin/perl58-th:	.pl
  python: /usr/local/bin/python:	.py
  ruby: /usr/local/bin/ruby:	.rb

=cut

my $benchmarks  = '.*';
my $conf        = "$FindBin::Bin/parrotbench.conf";
my $directory   = "$FindBin::Bin/../../examples/benchmarks";
my $executables = '.*';
my $help        = 0;
my $list        = 0;
my $time        = 0;

GetOptions
  'benchmarks=s'  => \$benchmarks,
  'conf=s'        => \$conf,
  'directory=s'   => \$directory,
  'executables=s' => \$executables,
  'help|?'        => \$help,
  'list'          => \$list,
  'time'          => \$time;

pod2usage 1 if $help;

# Parse configuration file
die "Configuration file \"$conf\" does not exist" unless -e $conf;
my $file = new IO::File("< $conf")
  or die "Unable to open configuration file \"$conf\"";
my ( @names, %pathes, %suffixes, @suffixes );
my $i = 0;
while (<$file>) {
    if (/^\s*(.*):\s*(.*):\s*(.*)$/) {
        my $name     = $1;
        my $path     = $2;
        my $suffixes = $3;
        if ( $name =~ /$executables/ ) {
            push @names, $name;
            foreach my $suffix ( $suffixes =~ /\.(\w*)/g ) {
                $pathes{$name} = $path;
                push @{ $suffixes{$suffix} }, $name;
                push @{ $suffixes[$i] }, $suffix;
            }
            $i++;
        }
    }
}
$file->close;

# Build lists
my ( %list, %tree );
find sub {
    foreach my $suffix ( keys %suffixes ) {
        if (/(\w*)\.$suffix/) {
            my $benchmark = $1;
            if ( $benchmark =~ /$benchmarks/ ) {
                $list{$benchmark}++;
                foreach my $name ( @{ $suffixes{$suffix} } ) {
                    $tree{$name}{$suffix}{$benchmark}++;
                }
            }
        }
    }
}, $directory;
die "No benchmarks found" unless keys %list;

# Print list
if ($list) {
    foreach my $benchmark ( sort keys %list ) {
        print "$benchmark";
        foreach my $name ( keys %tree ) {
            foreach my $suffix ( keys %{ $tree{$name} } ) {
                print ", $name($suffix)" if $tree{$name}{$suffix}{$benchmark};
            }
        }
        print "\n";
    }
    exit;
}

# Benchmark
print "WARNING: Falling back to results in cpu seconds,"
  . " specify more executables!\n"
  and $time++ unless $#names;
$time
  ? print "Numbers are cpu times in seconds. (lower is better)\n"
  : print "Numbers are relative to the first one. (lower is better)\n";
foreach my $i ( 0 .. $#names ) {
    print "\t$names[$i]";
}
print "\n";
my $null = File::Spec->devnull;
foreach my $benchmark ( sort keys %list ) {
    print "$benchmark";
    my $base = 0;
    foreach my $i ( 0 .. $#names ) {
        my $found = 0;
        foreach my $j ( 0 .. $#{ $suffixes[$i] } ) {
            if (   $tree{ $names[$i] }{ $suffixes[$i][$j] }{$benchmark}
                && $pathes{ $names[$i] } )
            {
                my ( $scuser, $scsys ) = (times)[ 2, 3 ];
                system "$pathes{$names[$i]} $directory/"
                  . "$benchmark.$suffixes[$i][$j] > $null";
                my ( $ecuser, $ecsys ) = (times)[ 2, 3 ];
                my $used = ( $ecuser - $scuser ) + ( $ecsys - $scsys );
                $base ||= $used;
                if ($time) {
                    printf "\t%.3fs", $used;
                }
                else {
                    printf "\t%d%%", $used / ( $base / 100 );
                }
                $found++;
                last;
            }
        }
        print "\t-" unless $found;
    }
    print "\n";
}

=head1 AUTHOR

Sebastian Riedel, C<sri@oook.de>

=cut

1;
