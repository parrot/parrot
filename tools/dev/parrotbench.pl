#!/usr/bin/perl -w

use strict;
use Config::IniFiles;
use File::Basename;
use File::Find;
use File::Spec;
use FindBin;
use Getopt::Long;
use Pod::Usage;
require POSIX;

=head1 NAME

parrotbench - Parrot benchmark

=head1 SYNOPSIS

parrotbench.pl [options]

 Options:
   -b -benchmarks     use benchmarks matching regexes  (multiple)
   -c -conf           path to configuration file
   -d -directory      path to benchmarks directory
   -h -? -help        display this help and exits
   -list              list available benchmarks and exits
   -m -method         method of time from times()
                      1 $cuser + $csystem from times() (default)
                      2 Real time using POSIX::times()
   -n -nobench        skip benchmarks matching regexes (multiple)
   -time              show times instead of percentage

=head1 DESCRIPTION

Benchmark Parrot against other interpreters.

=head1 CONFIGURATION

You must specify paths to executables in a configuration file.
That file may be placed as parrotbench.conf in the same directory
as parrotbench.pl or otherwise explicitly specified with the
-conf option. You may set any command line option in the file with
the exception of the configuration file name itself.  In the event
you have specified an option both in the configuration file and the
command line, the command line takes precedence.

Here is an example parrotbench.conf:
    [global]
    directory = ../../examples/benchmarks
    list      = 0
    help      = 0
    method    = 2
    time      = 1

    [regexes]
    include   = ^gc 
    include   = ^oo 
    exclude   = header
    exclude   = waves

    [benchmark parrotj]
    exe       = ../../parrot -j
    type      = .pasm
    type      = .imc

    [benchmark perl_585_th]
    exe       = /usr/bin/perl585-th
    type      = .pl

    [benchmark python]
    exe       = /usr/local/bin/python
    type      = .py

    [benchmark ruby]
    exe       = /usr/bin/ruby
    type      = .rb

=head1 BUGS

While every effort was made to ensure this script is portable,
it is likely that it will break somewhere.

If a benchmark has multiple extensions associated with the same
executable, the last one will be used.  For instance, with the
configuration file above, foo.imc would be selected over foo.pasm

=head1 AUTHOR

Joshua Gatcomb, C<Limbic_Region_2000@Yahoo.com>

Originally written by:

Sebastian Riedel, C<sri@oook.de>

=cut

# Create Default Configuration 
my %cfg = (
    config_file  => File::Spec->catdir( $FindBin::Bin , 'parrotbench.conf' ),
    bench_path   => undef,
    list_only    => undef,
    use_times    => undef,
    display_help => undef,
    method       => undef,
    run_bench    => [],
    skip_bench   => [],
);

# Read Command Line Options
GetOptions(
    'conf=s'       => \$cfg{config_file},
    'directory=s'  => \$cfg{bench_path},
    'list'         => \$cfg{list_only},
    'time'         => \$cfg{use_times},
    'help|?'       => \$cfg{display_help},
    'method=s'     => \$cfg{method},
    'benchmarks=s' => $cfg{run_bench},
    'nobench=s'    => $cfg{skip_bench},
);

# Read Configuration File
die
    'Unable to access configuration file ',
    $cfg{config_file} unless -r $cfg{config_file};

my $ini = Config::IniFiles->new( -file => $cfg{config_file} );

# Merge Configuration
if ( ! defined $cfg{bench_path} ) {
    $cfg{bench_path} = $ini->val( global => 'directory' );
}
if ( ! defined $cfg{list_only} ) {
    $cfg{list_only} = $ini->val( global => 'list' );
}
if ( ! defined $cfg{use_times} ) {
    $cfg{use_times} = $ini->val( global => 'time' );
}
if ( ! defined $cfg{display_help} ) {
    $cfg{display_help} = $ini->val( global => 'help' );
}

pod2usage 1 if $cfg{display_help};

if ( ! defined $cfg{method} ) {
    $cfg{method} = $ini->val( global => 'method', 1 );
}

if ( ! @{ $cfg{run_bench} } ) {
    my @regexes = grep defined, $ini->val( regexes => 'include');
    @{ $cfg{run_bench} } = @regexes ? @regexes : '[\d\D]';
}
if ( ! @{ $cfg{skip_bench} } ) {
    my @regexes = grep defined, $ini->val( regexes => 'exclude');
    @{ $cfg{skip_bench} } = @regexes ? @regexes : '[^\d\D]';
}

# Move to the benchmark directory
if ( defined $cfg{bench_path} ) {
    chdir $cfg{bench_path} or die "Unable to cd to $cfg{bench_path}";
}
else {
    chdir $FindBin::Bin or die "Unable to cd to directory of $0";
    chdir File::Spec->catdir(
        File::Spec->updir,
        File::Spec->updir,
        'examples',
        'benchmarks'
    ) or die "Unable to find the benchmark directory";
}

# Frequently Used Variables
my %bench;
my @section = sort $ini->GroupMembers( 'benchmark' );
my @program = map { /^benchmark\s+(.*)$/ } @section;
my %suffix;
$suffix{ $_ } = [ map quotemeta, $ini->val($_, 'type') ] for @section;
my $ticks = POSIX::sysconf( &POSIX::_SC_CLK_TCK );
my %Get_Time = (
    1 => sub { my @times = times();  return $times[2] + $times[3] },
    2 => sub { return ( POSIX::times() )[0] / $ticks },
);

# Find And Build Benchmarks
find sub {
    my $pass;
    for my $regex ( @{ $cfg{run_bench} } ) {
        $pass++ and last if /$regex/;
    }
    return if ! $pass;
    my $fail;
    for my $regex ( @{ $cfg{skip_bench} } ) {
        $fail++ and last if /$regex/;
    }
    return if $fail;
    for my $index ( 0 .. $#section ) {
        my ($name, $p, $ext) = fileparse($_, @{ $suffix{ $section[ $index ] } });
        next if ! $ext;
        $bench{ $name }{ $program[ $index ] } = $ext;
    }
}, File::Spec->curdir();
die "No benchmarks found" if ! keys %bench;

# List Names Of Benchmarks With Pretty Output
if ( $cfg{list_only} ) {
    my @rows;
    push @rows, [ 'Benchmark', @program ];
    for my $name ( sort keys %bench ) {
        push @rows, [ $name, map { $bench{$name}{$_} || '-' } @program ];
    }
    my @max;
    for ( 0 .. @program ) {
        for my $row ( @rows ) {
            Longest( $max[$_] , length $row->[$_] );
        }
    }
    for my $col ( @rows ) {
        print map { sprintf("%-$max[$_]s  ", $col->[$_]) } 0 .. $#$col; 
        print "\n";
    }
    exit;
}

# Run The Benchmarks With Pretty Output
if ( ! $cfg{use_times} && @program < 2 ) {
    print "WARNING: Switching percentage to time - not enough executables\n";
    $cfg{use_times} = 1;
}
if ( $cfg{use_times} ) {
    my $type = $cfg{method} == 1 ? 'CPU' : 'wall-clock';
    print "Times are in $type seconds.  (lower is better\n";
}
else {
    print "Numbers are relative to the first one. (lower is better)\n";
}
print "\n";

open (COPYOUT, ">&STDOUT") or die "Unable to copy STDOUT";
open (STDOUT, '>', File::Spec->devnull) or die "Unable to redirect STDOUT";
select COPYOUT;
$| = 1;

my @max = $cfg{method} == 1 ? (5) x @program : (6) x @program;
Longest( $max[0], length $_ ) for 'Benchmark', keys %bench;
Longest( $max[ $_ + 1 ] , length $program[$_] ) for 0 .. $#program;
printf("%-$max[0]s  ", 'Benchmark');
printf("%-$max[$_ + 1]s  ", $program[$_]) for 0 .. $#program;

for my $name ( sort keys %bench ) {
    my $base = 0;
    printf("\n%-$max[0]s  ", $name);
    for ( 0 .. $#section ) {
        my ($prog, $sect) = ($program[$_], $section[$_]);
        if ( $bench{ $name }{ $prog } ) {
            my $start = $Get_Time{ $cfg{method} }->();
            system(
                $ini->val($sect, 'exe') . " " . $name . $bench{$name}{$prog}
            );
            my $stop = $Get_Time{ $cfg{method} }->();
            my $used = $stop - $start;
            $base ||= $used;
            printf("%-$max[$_ + 1]s  ", $cfg{use_times}
                 ? sprintf("%.3f", $used)
                 : sprintf( "%d%%", $used / ($base / 100) )
            );
        }
        else {
            printf ("%-$max[$_ + 1]s  ", '-');
        }
    }
}

sub Longest {
    $_[0] = $_[1] and return if ! defined $_[0];
    $_[0] = $_[1] if $_[1] > $_[0];
}
