#!/usr/bin/perl -w
#
# Configure.pl
#
# $Id$
#
# Author: Brent Dax
#

use strict;

use Config;
use Getopt::Long;
use ExtUtils::Manifest qw(manicheck);
use File::Copy;

use Parrot::BuildUtil;


#
# Read the array and scalar forms of the version.
# from the VERSION file.
#

my $parrot_version = parrot_version();
my @parrot_version = parrot_version();


#
# Handle options:
#

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
    print "Parrot Version $parrot_version Configure\n";
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
   --version            Show version
EOT
        exit;
}

my($DDOK)=undef;
eval {
        require Data::Dumper;
        Data::Dumper->import();
        $DDOK=1;
};

#
# print the header
#

print <<"END";
Parrot Version $parrot_version Configure
Copyright (C) 2001-2002 Yet Another Society

Since you're running this script, you obviously have
Perl 5--I'll be pulling some defaults from its configuration.

Checking the MANIFEST to make sure you have a complete Parrot kit...
END

check_manifest();

#
# Some versions don't seem to have ivtype or nvtype--provide
# defaults for them.
# XXX Figure out better defaults
#

my ($archname,    $cpuarch,    $osname);
my ($jitarchname, $jitcpuarch, $jitosname, $jitcapable);

$archname                 =  $Config{archname};
($cpuarch, $osname)       =  split('-', $archname);

$jitarchname              =  "$cpuarch-$osname";
$jitarchname              =~ s/-(net|free|open)bsd$/-bsd/i;

if (-e "Parrot/Jit/$jitarchname.pm") {
    $jitcapable  = 1;
}
else {
    $jitcapable  = 0;
    $jitarchname = 'i386-nojit';
}

($jitcpuarch, $jitosname) =  split('-', $jitarchname);

my(%c)=(
    iv            => ($Config{ivtype} || 'long'),
    intvalsize    => undef,

    nv            => ($Config{nvtype} || 'double'),
    numvalsize    => undef,

    opcode_t      => ($Config{ivtype} || 'long'),
    longsize      => undef,

    cc            => $Config{cc},

    #
    # ADD C COMPILER FLAGS HERE
    #

    ccflags       => $Config{ccflags},
    cc_inc	  => "-I./include",
    libs          => $Config{libs},
    cc_debug      => '-g',
    cc_warn       => '',
    o             => '.o',                # object files extension
    exe           => $Config{_exe},

    ld            => $Config{ld},
    ld_out        => '-o ',               # ld output file
    ld_debug      => '',                  # include debug info in executable

    perl          => $^X,
    test_prog     => 'test_parrot' . $Config{_exe},
    debugging     => $opt_debugging,
    rm_f          => 'rm -f',
    stacklow      => '(~0xfff)',
    intlow        => '(~0xfff)',
    numlow        => '(~0xfff)',
    strlow        => '(~0xfff)',
    pmclow        => '(~0xfff)',
    make          => $Config{make},
    make_set_make => $Config{make_set_make},
        
    platform      => $^O,

    cpuarch       => $cpuarch,
    osname        => $osname,
    archname      => $archname,

    jitcpuarch    => $jitcpuarch,
    jitosname     => $jitosname,
    jitarchname   => $jitarchname,
    jitcapable    => $jitcapable,
    cc_hasjit     => '',
    jit_h         => '',
    jit_struct_h  => '',
    jit_o         => '',

    cp            => 'cp',
    slash         => '/',

    VERSION =>    $parrot_version,
    MAJOR   =>    $parrot_version[0],
    MINOR   =>    $parrot_version[1],
    PATCH   =>    $parrot_version[2],
);

# What's the platform shell quote character?
if ($^O eq 'VMS' || $^O =~ /MSWin/i) {
    $c{PQ} = '"';
} else {
    $c{PQ} = "'";
}

#
# If using gcc, crank up its warnings as much as possible and make it behave
# ansi-ish.
#
# Some Perl versions put this in Config variable 'ccname', others in 'cc'. We
# prefer the former, but accept the latter.
#

my $ccname = $Config{ccname} || $Config{cc};

# Add the -DHAS_JIT if we're jitcapable
if ($jitcapable) {
    $c{cc_hasjit} = " -DHAS_JIT";
    $c{jit_h} = "\$(INC)/jit.h";
    $c{jit_struct_h} = "\$(INC)/jit_struct.h";
    $c{jit_o} = "jit\$(O)";
}

#
# Copy the things from --define foo=bar
#

@c{keys %opt_defines}=values %opt_defines;


#
# Set up default values
#

my $hints = "hints/" . lc($^O) . ".pl";
if(-f $hints) {
    local($/);
    open HINT, "< $hints" or die "Unable to open hints file '$hints'";
    my $hint = <HINT>;
    close HINT;
    eval $hint or die "Error in hints file $hints: '$@/$!'";
}


#
# Ask questions
#

prompt("What C compiler do you want to use?", 'cc');
prompt("How about your linker?", 'ld');
prompt("What flags would you like passed to your C compiler?", 'ccflags');
prompt("Which libraries would you like your C compiler to include?", 'libs');
prompt("How big would you like integers to be?", 'iv');
prompt("And your floats?", 'nv');
prompt("What is your native opcode type?", 'opcode_t');

print <<"END";

Determining if your C compiler is actually gcc (this could take a while):

END

{
    my %gnuc;

    compiletestc("test_gnuc");
    %gnuc=eval(runtestc()) or die "Can't run the test program: $!";
    unlink("test_siz$c{exe}", "test$c{o}");

    unless (exists $gnuc{__GNUC__}) {
        print << 'END';

The test program didn't give the expected result - assuming your compiler is
not gcc.

END

    } else {
	my $major = $gnuc{__GNUC__};
        my $minor = $gnuc{__GNUC_MINOR__};
        unless (defined $major) {
            print << 'END';

Your C compiler is not gcc.

END
        } else {
	    print "Your C compiler reports itself as gcc, major version $major";
            print ", minor version $minor" if defined $minor;
	}
        print ".\n\n";
        if ($major =~ tr/0-9//c) {
            print "major version '$major' is not an integer",
                " - I don't think that this is gcc.";
            undef $major; # Don't use it
        }
        if (defined $minor and $minor =~ tr/0-9//c) {
            print "minor version '$minor' is not an integer.";
            undef $minor; # Don't use it
        }
        if (defined $major) {
            $c{gccversion} = $major;
            $c{gccversion} .= ".$minor" if defined $minor;
        }
    }

}

if ($c{gccversion}) {
    # If using gcc, crank up its warnings as much as possible and make it
    # behave  ansi-ish.
    # Here's an attempt at a list of nasty things we can use for a given
    # version of gcc. The earliest documentation I currently have access to is
    # for 2.95, so I don't know what version everything came in at. If it turns
    # out that you're using 2.7.2 and -Wfoo isn't recognised there, move it up
    # into the next version becone (2.8)

    
    my @opt_and_vers = 
        (0 => "-Wall -ansi -pedantic -Wstrict-prototypes -Wmissing-prototypes -Winline -Wredundant-decls -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wconversion -Waggregate-return -Winline -W -Wsign-compare",
        # others; ones we might like marked with ?
        # ? -Wundef for undefined idenfiers in #if
        # ? -Wbad-function-cast
        #   Warn whenever a function call is cast to a non-matching type
        # ? -Wmissing-declarations
        #   Warn if a global function is defined without a previous declaration
        # -Wmissing-noreturn
        # ? -Wredundant-decls
        #    Warn if anything is declared more than once in the same scope,
        # ? -Wnested-externs
        #    Warn if an `extern' declaration is encountered within an function.
        # -Wlong-long
        # Ha. this is the default! with -pedantic.
        # -Wno-long-long for the nicest bit of C99
         2.7 => "",
         2.8 => "",
         2.95 => "",
         3.0 => "-Wformat-nonliteral -Wformat-security -Wpacked -Wpadded -Wdisabled-optimization",
        # -Wsequence-point is part of -Wall
        # -Wfloat-equal may not be what we want
        # We shouldn't be using __packed__, but I doubt -Wpacked will harm us
        # -Wpadded may prove interesting, or even noisy.
        # -Wunreachable-code might be useful in a non debugging version
    );
    while (my ($vers, $opt) = splice @opt_and_vers, 0, 2) {
        last if $vers > $c{gccversion};
        next unless $opt; # Ignore blank lines
        $c{cc_warn} .= " $opt";
    }
    prompt("What gcc warning flags do you want to use?", 'cc_warn');
}

#
# Copy the appropriate platform-specific file over
#

if (-e "platforms/$c{platform}.h") {
    copy("platforms/$c{platform}.h", "include/parrot/platform.h");
    copy("platforms/$c{platform}.c", "platform.c");
}
else {
    copy("platforms/generic.h", "include/parrot/platform.h");
    copy("platforms/generic.c", "platform.c");
}

my $now = time;
utime $now, $now, "include/parrot/platform.h", "platform.c";

unless( $c{debugging} ) {
    $c{ld_debug} = ' ';
    $c{cc_debug} = ' ';
}

print <<"END";

Probing Perl 5's configuration to determine which headers you have (this could
take a while on slow machines)...
END


#
# Set up HAS_HEADER_
#

foreach(grep {/^i_/} keys %Config) {
    $c{$_}=$Config{$_};
    $c{headers}.=defineifdef((/^i_(.*)$/));
}

print <<"END";

Determining C data type sizes by compiling and running a small C program (this
could take a while):

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

Figuring out the formats to pass to pack() for the various Parrot internal
types...
END


#
# Alas perl5.7.2 doesn't have an INTVAL flag for pack().
# The ! modifier only works for perl 5.6.x or greater.
#

foreach ('intvalsize', 'opcode_t_size') {
    my $which = $_ eq 'intvalsize' ? 'packtype_i' : 'packtype_op';
    if (($] >= 5.006) && ($c{$_} == $c{longsize}) ) {
        $c{$which} = 'l!';
    }
    elsif ($c{$_} == 4) {
        $c{$which} = 'l';
    }
    else {
        die "Configure.pl:  Unable to find a suitable packtype for $_.\n";
    }
}

$c{packtype_n} = 'd';


#
# Build config.h, the Makfefiles and Types.pm:
#
# Also build Parrot/Config.pm
#

print <<"END";

Building a preliminary version of include/parrot/config.h, your Makefiles, and
other files:

END

buildfile("config_h", "include/parrot");

buildfile("Makefile");
buildfile("classes/Makefile");
buildfile("languages/Makefile");
buildfile("languages/jako/Makefile");
buildfile("languages/miniperl/Makefile");
buildfile("languages/scheme/Makefile");

buildfile("Types_pm", "Parrot");

buildconfigpm();


#
# And now we figure out how big our things are
#

print <<"END";

Checking some things by compiling and running another small C program (this
could take a while):

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


#
# Rewrite the config file with the updated info
#

print <<"END";

Updating include/parrot/config.h:

END

buildfile("config_h", "include/parrot");

# Toss old .o files
foreach my $dir ("./", "classes/", "encodings/", "chartypes/") {
    foreach my $file (glob($dir . "*". $c{o})) {
	1 while unlink $file;
    }
}


#
# Wrap up:
#

print <<"END";

Okay, we're done!

You can now use `make' (or your platform's equivalent to `make') to build your
Parrot. After that, you can use `make test' to run the test suite.

Happy Hacking,

        The Parrot Team

END

exit(0);


###############################################################################
###############################################################################
##
## Support Subroutines
##
###############################################################################
###############################################################################


#
# defineifdef()
#
# Give us the #define we may need for header X
#

sub defineifdef {
    my $thing=shift;

    if($Config{"i_$thing"}) {
        return "#define HAS_HEADER_\U$thing\E\n";
    }
    else {
        return "#undef HAS_HEADER_\U$thing\E\n"; #XXX do we want this?
    }
}


#
# prompt()
#
# Prompt for something from the user.
#

sub prompt {
    return if $opt_defaults;

    my($message, $field)=(@_);
    my($input);
    print "$message [$c{$field}] ";
    chomp($input=<STDIN>);
    $c{$field}=$input||$c{$field};
}


#
# buildfile()
#

sub buildfile {
    my($source_filename, $path)=@_;
    $path||='.';

    my $target_filename = $source_filename;
    $target_filename =~ s/_/./;        #config_h => config.h

    printf "  Building %-30s from %s...\n", "$path/$target_filename",
        "$source_filename.in";

    local $/;
    open(IN, "<$source_filename.in") or die "Can't open $source_filename.in: $!";
    my $text=<IN>;
    close(IN) or die "Can't close $source_filename.in: $!";

    $text =~ s/\$\{(\w+)\}/$c{$1}/g;
    $text =~ s/\cM//g;                 # Potental drek on Win32
    open(OUT, ">$path/$target_filename") or die "Can't open $path/$target_filename: $!";
    print OUT $text;
    close(OUT) or die "Can't close $target_filename: $!";
}


#
# buildconfigpm()
#

sub buildconfigpm {
    unless($DDOK) {
        print <<"END";

Your system doesn't have Data::Dumper installed, so I couldn't
build Parrot::Config.  If you want Parrot::Config installed,
use CPAN.pm to install Data::Dumper and run this script again.
END

        return;
    }

    printf "  Building %-30s from %s...\n", "Parrot/Config.pm",
        "Config_pm.in";

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


#
# check_manifest()
#

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


#
# compiletestc()
#

sub compiletestc {
    my $name;
    $name = shift;
    $name = "test" unless $name;
    system("$c{cc} $c{ccflags} -I./include -o test_siz$c{exe} $name.c") and die "C compiler died!";
}


#
# runtestc()
#

sub runtestc {
    `./test_siz$c{exe}`
}


#
# lowbitmas()
#
# Find the bitmask for the low bits of any passed-in size.
#

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

