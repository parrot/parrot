#!/usr/bin/perl -w

use strict;
use Getopt::Long;

use vars qw($VERSION);

require 5.005;

$VERSION = sprintf "%d.%d", q$Revision$ =~ /(\d+)/g; # jhi@iki.fi

my $nm_opt = '';
my $nm_try = qx(nm -V 2>&1);
my $nm_gnu;
my $nm_ro; # can tell apart read-only (const) data sections

my ($Code, $Data, $Init, $Uninit, $Const, $Mutable,
    $Global, $Local, $Undef, $Def, $File,
    $FileName, $Type, $LongType, $Help, $Version);

sub help {
print <<__EOF__;
$0: Usage: $0 [options] [ foo.o ... | bar.a | other_library_format ]
Portable frontend for nm(1); by default lists the code and data symbols
of the object or archive files.
Options:
--code		only code/text symbols (Tt)
--data		only data symbols (Dd, Bb)
--init		only initialised data symbols (Dd)
--uninit	only uninitialised data symbols (Bb)
--const		only const (read-only) data symbols (Rr) [1]
--mutable	only modifiable (read-write) data symbols (Dd, Bb) [1]
--undef		only undefined symbols (Uu)
--def		only defined symbols (not Uu)
--file		only file(name) symbols (Ff)

If more than one of all the above options are given, they are ANDed.
They can also be negated with a "no", for example --noconst.
[1] Not all platforms support this, a warning will be given if not.

--filename	prepend the object filename before the symbol name
--t		append the short BSD-style type (in parentheses above)
--type=long	append a long type (e.g. "global_const_init_data" cf. "R")
--type=terse	same as --t
--help		show this help
--version	show version

All the options can be shortened to their unique prefixes,
and one leading dash ("-") can be used instead of two ("--").
__EOF__
    exit(1);
}

if ($^O eq 'solaris'      && $nm_try =~ /Solaris/) {
    $nm_opt = '-p';
} elsif ($^O eq 'hpux'    && $nm_try =~ /linker command|HP-UX/) { 
    $nm_opt = '-p';
} elsif ($^O eq 'aix'     && $nm_try =~ /illegal option/) {
    $nm_opt = '-B';
} elsif ($^O eq 'irix'    && $nm_try =~ /C Development Set/) {
    $nm_opt = '-B';
    $nm_ro = 1;
} elsif ($^O eq 'dec_osf' && $nm_try =~ /Alpha/) { # aka Tru64 aka DEC OSF/1
    $nm_opt = '-B';
    $nm_ro  = 1;
} elsif ($^O eq 'darwin'  && $nm_try =~ /invalid argument/) {
    $nm_opt = '';
} elsif ($nm_try =~ /GNU nm/) {
    $nm_opt = '';
    $nm_gnu = 1;
    $nm_ro  = 1;
} else {
    # Hope for BSD-style nm output.
}

help()
    unless
      GetOptions('code!'      => \$Code,
                 'data!'      => \$Data,
                 'init!'      => \$Init,
                 'uninit!'    => \$Uninit,
                 'const!'     => \$Const,
                 'mutable!'   => \$Mutable,
                 'global!'    => \$Global,
                 'local!'     => \$Local,
                 'undef!'     => \$Undef,
                 'def!'       => \$Def,
                 'file!'      => \$File,
                 'filename'   => \$FileName,
                 't'          => \$Type,
                 'type:s'     => \$Type,
                 'help'       => \$Help,
                 'version'    => \$Version,
                 );

if ($Const && !$nm_ro) {
    warn "$0: the native nm cannot tell apart const data sections\n";
}

help() if $Help;

if ($Version) {
    print "$0: $VERSION\n";
    exit(0);
}

sub warnboth {
    my ($a, $b, $sa, $sb) = @_;
    if (defined $a && defined $b && $a == $b) {
	warn "$0: both --$sa and --$sb used\n";
    }
}

warnboth($Code,   $Data,    'code',   'data' );
warnboth($Global, $Local,   'global', 'local');
warnboth($Init,   $Uninit,  'init',   'uninit');
warnboth($Const,  $Mutable, 'const',  'mutable');
warnboth($Def,    $Undef,   'def',    'undef');

$Const ||= !$Mutable if defined $Mutable && !defined $Const;
$Undef ||= !$Def     if defined $Def     && !defined $Undef;
my %Type; @Type{qw(terse long)} = ();
$Type = 'terse' if $Type eq '1'; # So they used --t.
die "$0: --type=$Type unknown\n"
    if defined $Type && $Type ne '' && !exists $Type{$Type};

my $TypeLong = defined $Type && $Type eq 'long';

for my $f (@ARGV) {
    unless (-f $f) {
	warn "$0: No such file: $f\n";
	next;
    }
    if (open(NM, "nm $nm_opt $f |")) {
	my $o = "?";
	$o = $f if $f =~ /\.o$/;
	my $file;
	while(<NM>) {
	    chomp;
	    if (m/^(.+\.o):$/ || m/\[(.+\.o)\]:$/ || m/\((.+\.o)\):$/) {
		$o = $1;
	    } elsif (/ ([A-Za-z]) \.?(\w+)$/) {
		# Especially text symbols are sometimes prefixed by a ".".
		my ($type, $name) = ($1, $2);
		my $absolute = ($type =~ /^[Aa]$/  ) ? 1 : 0;
		my $uninit   = ($type =~ /^[BbCc]$/) ? 1 : 0;
		my $init     = ($type =~ /^[DdGg]$/) ? 1 : 0;
		my $file     = ($type =~ /^[Ff]$/  ) ? 1 : 0;
		my $small    = ($type =~ /^[Gg]$/  ) ? 1 : 0;
		my $code     = ($type =~ /^[Tt]$/  ) ? 1 : 0;
		my $undef    = ($type =~ /^[Uu]$/  ) ? 1 : 0;
		my $zeroed   = 0;
		my $const    = 0;
		my $local    = $type eq lc $type ? 1 : 0;
		my $other    = 0;
		if (($^O eq 'irix' || $^O eq 'dec_osf') &&
		    $type =~ /^[BbSs]$/) {
		    if ($type =~ /^[Ss]$/) {
			$small  = 1;
			$uninit = 1;
		    }
		    $zeroed = 1;
		}
		if ($^O eq 'irix' && $type =~ /^[Rr]$/) {
		    $const = 1;
		    $init  = 1;
		}
		if ($^O eq 'dec_osf') {
		    if ($type eq 'E') {
			$small = 1;
		    } elsif ($type =~ /^[RrQq]$/) {
			$const = 1;
			$init  = 1;
		    }
		}
		if ($^O eq 'darwin') {
		    $other = 1;
		}
		if ($nm_gnu) {
		    if ($type =~ /^[Rr]$/) {
			$const = 1;
			$init  = 1;
		    } elsif ($type =~ /^[Ss]$/) {
			$small  = 1;
			$uninit = 1;
		    }
		}
		if ($type =~ /^[ABCDFGQRSTU]$/i) {
		    unless ($undef || $code || $other || $absolute) {
			if ($init && $uninit) {
			    warn "$.:$_: both init and uninit?\n";
			} elsif (!$init && !$uninit) {
			    warn "$.:$_: neither init and uninit?\n";
			}
		    }
		}
		my $data = $uninit || $init;
		my $global = !$local;
		my $show = 1;
		sub wantshow {
		    my ($show, $Got, $got) = @_;
		    if (defined $Got) {
			if ($Got == $got) {
			    $$show++;
			} else {
			    $$show = 0;
			}
		    }
		}
		wantshow(\$show, $Code,   $code  ) if $show;
		wantshow(\$show, $Data,   $data  ) if $show;
		wantshow(\$show, $Init,   $init  ) if $show;
		wantshow(\$show, $Uninit, $uninit) if $show;
		wantshow(\$show, $Const,  $const ) if $show;
		wantshow(\$show, $Global, $global) if $show;
		wantshow(\$show, $Local,  $local ) if $show;
		wantshow(\$show, $Undef,  $undef ) if $show;
		wantshow(\$show, $File,   $file  ) if $show;
		if ($show) {
		    $show = $FileName ? "$o\t$name" : $name;
		    if (defined $Type) {
			$show .= "\t";
			my $symbol;
			if ($code) {
			    $symbol = $TypeLong ? "code" : "T";
			} elsif ($data) {
			    if ($const) {
				$symbol = $TypeLong ? "const_init" : "R";
			    } elsif ($init) {
				$symbol = $TypeLong ? "init" : "D";
			    } elsif ($uninit) {
				$symbol = $TypeLong ? "uninit" : "B";
			    } else {
				$symbol = $TypeLong ? "unknown" : "D?";
			    }
			    $symbol .= "_data" if $TypeLong;
			} elsif ($undef) {
			    $symbol = $TypeLong ? "undef" : "U";
			} else {
			    $symbol = $TypeLong ? "unknown" : "?";
			}
			if ($TypeLong) {
			    $show .= $global ?
				"global_$symbol" : "local_$symbol";
			} else {
			    $show .= $global ?
				$symbol : lc $symbol;
			}
		    }
		    print $show, "\n";
		}
	    }
	}
	close(NM);
    } else {
	warn "$0: 'nm $nm_opt $f' failed: $!\n";
    }
}

exit(0);
