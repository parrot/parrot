#!/usr/bin/perl -w
#so we get -w

#Configure.pl, written by Brent Dax

use strict;
use Config;
use Getopt::Long;
use ExtUtils::Manifest qw(manicheck);
use File::Copy;

my($opt_debugging, $opt_defaults, $opt_version, $opt_help) = (0, 0, 0, 0);
my(%opt_defines);
my $result = GetOptions(
	'debugging!' => \$opt_debugging,
	'defaults!'  => \$opt_defaults,
	'version'    => \$opt_version,
	'help'       => \$opt_help,
	'define=s'   => \%opt_defines,
);

if($opt_version) {
	print '$Id$' . "\n";
	exit;
}

if($opt_help) {
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
	iv =>			($Config{ivtype}   ||'long'),
	intvalsize =>       undef,

	nv =>			($Config{nvtype}   ||'double'),
	numvalsize =>       undef,

	opcode_t =>		($Config{ivtype}   ||'long'),
	longsize =>		undef,

	cc =>			$Config{cc},
	#ADD C COMPILER FLAGS HERE
	ccflags =>		$Config{ccflags},
	libs =>			$Config{libs},
	cc_debug =>		'-g',
	o =>			'.o',		# object files extension
	exe =>			$Config{_exe},

	ld =>			$Config{ld},
	ld_out =>		'-o ',		# ld output file
	ld_debug =>     '',			# include debug info in executable

  	perl =>			$^X,
	debugging =>	$opt_debugging,
	rm_f =>		'rm -f',
	stacklow =>	'(~0xfff)',
	intlow =>	'(~0xfff)',
	numlow =>	'(~0xfff)',
	strlow =>	'(~0xfff)',
	pmclow =>	'(~0xfff)',
	make=>          $Config{make},
	
	platform =>	$^O,
	cp =>		'cp',
	slash =>	'/',
);

#copy the things from --define foo=bar
@c{keys %opt_defines}=values %opt_defines;

# set up default values
my $hints = "hints/" . lc($^O) . ".pl";
if(-f $hints) {
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
prompt("What is your native opcode type?", 'opcode_t');

# Copy the appropriate platform-specific file over
if (-e "platforms/$c{platform}.h") {
    copy("platforms/$c{platform}.h", "include/parrot/platform.h");
    copy("platforms/$c{platform}.c", "platform.c");
}
else {
    copy("platforms/generic.h", "include/parrot/platform.h");
    copy("platforms/generic.c", "platform.c");
}

unless( $c{debugging} ) {
	$c{ld_debug} = ' ';
	$c{cc_debug} = ' ';
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

Alright, now I'm gonna check some stuff by compiling and running
a small C program.  This could take a bit...
END

{
	my %newc;

	buildfile("test_c");
	compiletestc();
	%newc=eval(runtestc()) or die "Can't run the test program: $!";

	@c{keys %newc}=values %newc;

	unlink('test.c', "test_siz$c{exe}", "test$c{o}");
}

print <<"END";

Done. Now I'm figuring out what formats to pass to pack() for the
various Parrot internal types.
END


# Alas perl5.7.2 doesn't have an INTVAL flag for pack().
# The ! modifier only works for perl 5.6.x or greater.
foreach ('intvalsize', 'opcode_t_size') {
    my $which = $_ eq 'intvalsize' ? 'packtype_i' : 'packtype_op';
    if (($] >= 5.006) && ($c{$_} == $c{longsize}) ) {
	$c{$which} = 'l!';
    }
    elsif ($c{$_} == 4) {
	$c{$which} = 'l';
    }
    elsif ($c{$_} == 8) {
	$c{$which} = 'q';
    }
    else {
	die "Configure.pl:  Unable to find a suitable packtype for $_.\n";
    }
}

$c{packtype_n} = 'd';

print <<"END";

Okay, that's finished.  I'm now going to write your very
own Makefile, config.h, Parrot::Types, and Parrot::Config to disk.
END

# now let's assemble the config.h file
buildfile("config_h", "include/parrot");
# and the makefile
buildfile("Makefile");
buildfile("classes/Makefile");
buildfile("languages/Makefile");
buildfile("languages/jako/Makefile");
# and Parrot::Config
buildconfigpm();
# and the types file
buildfile("Types_pm", "Parrot");

# and now we figure out how big our things are
print <<"END";

Alright, now I'm gonna check some stuff by compiling and running
another small C program.  This could take a bit...
END

{
	my %newc;

       open NEEDED, ">include/parrot/vtable.h";
       close NEEDED;
	buildfile("testparrotsizes_c");
	compiletestc("testparrotsizes");
	%newc=eval(runtestc()) or die "Can't run the test program: $!";

	@c{keys %newc}=values %newc;

	@c{qw(stacklow intlow numlow strlow pmclow)} = lowbitmask(@c{qw(stackchunk iregchunk nregchunk sregchunk pregchunk)});

	unlink('testparrotsizes.c', "test_siz$c{exe}", "test$c{o}");
       unlink("include/parrot/vtable.h");
}

# rewrite the config file with the updated info
buildfile("config_h", "include/parrot");

print <<"END";

Okay, we're done!
You can now use `make parrot' (or your platform's equivalent to `make')
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

	open(OUT, ">Parrot/Config.pm") or die "Can't open file Parrot/Config.pm: $!";
	print OUT $text;
	close(OUT) or die "Can't close file Parrot/Config.pm: $!";
}

sub check_manifest {
	print "\n";

	my(@missing)=manicheck();

	if(@missing) {
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

sub compiletestc {
    my $name;
    $name = shift;
    $name = "test" unless $name;
    system("$c{cc} $c{ccflags} -I./include -o test_siz$c{exe} $name.c") and die "C compiler died!";
}

sub runtestc {
	`./test_siz$c{exe}`
}

# Find the bitmask for the low bits of any passed-in size
sub lowbitmask {
    my @returns;
    foreach (@_) {
	my $vector = unpack("b*", pack("V", $_));
	my $offset = rindex($vector, "1")+1;
	my $mask = 2**$offset - 1;
	push @returns, "(~0x".sprintf("%x", $mask).")";
    }
    return @returns;
}
