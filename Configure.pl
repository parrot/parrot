#!/usr/bin/perl -w
#so we get -w

#Configure.pl, written by Brent Dax

use strict;
use Config;
use Getopt::Long;
 
my( $opt_debugging, $opt_defaults, $opt_version, $opt_help ) = ( 0, 0, 0, 0 );
my( %opt_defines );
my $result = GetOptions( 
	'debugging!' => \$opt_debugging,
	'defaults!'  => \$opt_defaults,
	'version'    => \$opt_version,
	'help'       => \$opt_help,
	'define=s'   => \%opt_defines,
);

if( $opt_version ) {
	print '$Id$' . "\n";
	exit;
}

if( $opt_help ) {
	print <<"EOT";
$0 - Parrot Configure
Options:
   --debugging          Enable debugging
   --defaults           Accept all default values
   --define name=value  Defines value name as value
   --help               This text
   --version            Show assembler version
EOT
	exit;
}

my($DDOK)=undef;
eval {
	require Data::Dumper;
	Data::Dumper->import();
	$DDOK=1;
};

#print the header
print <<"END";
Parrot Configure
Copyright (C) 2001 Yet Another Society

Since you're running this script, you obviously have
Perl 5--I'll be pulling some defaults from its configuration.

First, I'm gonna check the manifest, to make sure you got a 
complete Parrot kit.
END

check_manifest();

#Some versions don't seem to have ivtype or nvtype--provide 
#defaults for them.
#XXX Figure out better defaults
my(%c)=(
	iv =>			($Config{ivtype}||'long'),
	nv =>			($Config{nvtype}||'double'),
	cc =>			$Config{cc},
	#ADD C COMPILER FLAGS HERE
	ccflags =>		$Config{ccflags}." -I./include",
	libs =>			$Config{libs},
  	perl =>			$^X,
	cc_debug =>		'-g',
	o =>			'.o',		# object files extension
	exe =>			$Config{_exe},
	ld =>			$Config{ld},
	ld_out =>		'-o ',		# ld output file
	ld_debug =>     '',			# include debug info in executable
	debugging =>	$opt_debugging,
);

foreach my $i ( keys %opt_defines ) {
	$c{$i} = $opt_defines{$i};
}

# set up default values
my $hints = "hints/" . lc( $^O ) . ".pl";
if( -f $hints ) {
	local($/);
	open HINT, "< $hints" or die "Unable to open hints file '$hints'";
	my $hint = <HINT>;
	close HINT;
	eval $hint or die "Error in hints file $hints: '$@/$!'";
}

#ask questions
prompt("What C compiler do you want to use?", 'cc');
prompt("How about your linker?", 'ld');
prompt("What flags would you like passed to your C compiler?", 'ccflags');
prompt("Which libraries would you like your C compiler to include?", 'libs');
prompt("How big would you like integers to be?", 'iv');
prompt("And your floats?", 'nv');

unless( $c{debugging} ) {
	$c{ld_debug} = ' ';
	$c{cc_denug} = ' ';
}

print <<"END";

Okay.  Now I'm gonna probe Perl 5's configuration to see
what headers you have around.  This could take a bit on slow 
machines...
END

#set up HAS_HEADER_
foreach(grep {/^i_/} keys %Config) {
	$c{$_}=$Config{$_};
	$c{headers}.=defineifdef((/^i_(.*)$/));
}

print <<"END";

Okay, that's finished.  I'm now going to write your very
own Makefile, config.h, and Parrot::Config to disk.
END

#now let's assemble the config.h file
buildfile("config_h", "include/parrot");
#and the makefile
buildfile("Makefile");
#and Parrot::Config
buildconfigpm();

print <<"END";

Okay, we're done!
You can now use `make test_prog' (or your platform's equivalent to `make')
to build your Parrot.

Happy Hacking,
	The Parrot Team
END

#give us the #define we may need for header X
sub defineifdef {
	my $thing=shift;

	if($Config{"i_$thing"}) {
		return "#define HAS_HEADER_\U$thing\E\n";
	}
	else {
		return "#undef HAS_HEADER_\U$thing\E\n"; #XXX do we want this?
	}
}

#prompt for something from the user
sub prompt {
	return if $opt_defaults;

	my($message, $field)=(@_);
	my($input);
	print "$message [$c{$field}] ";
	chomp($input=<STDIN>);
	$c{$field}=$input||$c{$field};
}

sub buildfile {
	my($filename, $path)=@_;
	$path||='.';

	local $/;
	open(IN, "<$filename.in") or die "Can't open $filename.in: $!";
	my $text=<IN>;
	close(IN) or die "Can't close $filename.in: $!";

	$text =~ s/\$\{(\w+)\}/$c{$1}/g;
	$filename =~ s/_/./;	#config_h => config.h

	open(OUT, ">$path/$filename") or die "Can't open $path/$filename: $!";
	print OUT $text;
	close(OUT) or die "Can't close $filename: $!";
}

sub buildconfigpm {
	unless($DDOK) {
		print <<"END";

Your system doesn't have Data::Dumper installed, so I couldn't
build Parrot::Config.  If you want Parrot::Config installed,
use CPAN.pm to install Data::Dumper and run this script again.
END

		return;
	}

	my %C=%c;
	delete $C{headers};
	my $dd=new Data::Dumper([\%C]);
	$dd->Names(['*PConfig']);

	local $/;
	open(IN, "<Config_pm.in") or die "Can't open Config_pm.in: $!";
	my $text=<IN>;
	close(IN) or die "Can't close Config.pm_in: $!";

	$text =~ s/#DUMPER OUTPUT HERE/$dd->Dump()/eg;

	mkdir("Parrot", 0777) or ( $! =~ /File exists/i or die "Can't make directory ./Parrot: $!");
	open(OUT, ">Parrot/Config.pm") or die "Can't open file Parrot/Config.pm: $!";
	print OUT $text;
	close(OUT) or die "Can't close file Parrot/Config.pm: $!";
}

sub check_manifest {
	my $not_ok;
	open(MANIFEST, "MANIFEST");

	while(<MANIFEST>) {
		chomp;
		unless(-e $_) {
			print "File $_ is missing!\n";
			$not_ok=1;
		}
	}

	if($not_ok) {
		print <<"END";

Ack, some files were missing!  I can't continue running
without everything here.  Please try to find the above 
files and then try running Configure again.
END
		exit;
	}
	else {
		print <<"END";

Okay, we found everything.  Next you'll need to answer 
a few questions about your system.  Rules are the same 
as Perl 5's Configure--defaults are in square brackets, 
and you can hit enter to accept them.

END
	}
}
