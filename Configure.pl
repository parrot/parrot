#!/usr/bin/perl -w
#so we get -w

#Configure.pl, written by Brent Dax

use strict;
use Config;

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

Rules are the same as Perl 5's Configure--defaults are in 
square brackets, and you can hit enter to accept them.
END

#Some versions don't seem to have ivtype or nvtype--provide 
#defaults for them.
#XXX Figure out better defaults
my(%c)=(
	iv =>		($Config{ivtype}||'long'),
	nv =>		($Config{nvtype}||'long double'),
	cc =>		$Config{cc},
	ccflags =>	'-Wall -o $@',
	libs =>		$Config{libs}
);

#ask questions
prompt("What C compiler do you want to use?", 'cc');
prompt("What flags would you like passed to your C compiler?", 'ccflags');
prompt("Which libraries would you like your C compiler to include?", 'libs');
prompt("How big would you like integers to be?", 'iv');
prompt("How about your floats?", 'nv');


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
buildfile("config_h");
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
	my($message, $field)=(@_);
	my($input);
	print "$message [$c{$field}] ";
	chomp($input=<STDIN>);
	$c{$field}=$input||$c{$field};
}

sub buildfile {
	my($filename)=shift;

	local $/;
	open(IN, "<$filename.in") or die "Can't open $filename.in: $!";
	my $text=<IN>;
	close(IN) or die "Can't close $filename.in: $!";

	$text =~ s/\$\{(\w+)\}/$c{$1}/g;
	$filename =~ s/_/./;	#config_h => config.h

	open(OUT, ">$filename") or die "Can't open $filename: $!";
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

	mkdir("Parrot") or ( $! =~ /File exists/i or die "Can't make directory ./Parrot: $!");
	open(OUT, ">Parrot/Config.pm") or die "Can't open file Parrot/Config.pm: $!";
	print OUT $text;
	close(OUT) or die "Can't close file Parrot/Config.pm: $!";
}
