#!/usr/bin/perl -w
#so we get -w

#Configre.pl, written by Brent Dax

use strict;
use Config;

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
	iv => ($Config{ivtype}||'long'),
	nv => ($Config{nvtype}||'long double')
);

#inquire about numeric sizes
prompt("How big would you like integers to be?", 'iv');
prompt("How about your floats?", 'nv');


print <<"END";

Okay.  Now I'm gonna probe Perl 5's configuration to see
what headers you have around.  This could take a bit on slow 
machines...
END

#set up HAS_HEADER_
foreach(grep {/^i_/} keys %Config) {
	$c{headers}.=defineifdef((/^i_(.*)$/));
}

#now let's assemble the config.h file
my $config_h;
{
	local $/;
	open(CONFIG_HT, "<config.h.in") or die $!;
	$config_h=<CONFIG_HT>;
	close CONFIG_HT;
}

# ${field} is replaced with $c{field}
$config_h =~ s/\$\{(\w+)\}/$c{$1}/g;

#write out the config.h file
open(CONFIG_H, ">config.h");
print CONFIG_H $config_h;
close CONFIG_H;

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

