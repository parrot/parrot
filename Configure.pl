#!/usr/bin/perl -w
#
# Configure.pl
#
# $Id$
#
# Author: Brent Dax
#

use strict;
use lib 'lib';

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

my $reconfig = 0;

my($opt_debugging, $opt_defaults, $opt_version, $opt_help) = (0, 0, 0, 0);
my(%opt_defines);

if (@ARGV and $ARGV[0] eq '--reconfig') {
  print STDERR "Configure.pl: Reconfiguring based on config.opt file...\n";
  open OPTS, "<config.opt" or die "Can't --reconfig. Could not open config.opt for reading!";

  foreach my $opt (<OPTS>) {
    chomp $opt;

    if ($opt =~ m/^\s*debugging\s*$/) {
      $opt_debugging = 1;
      $opt = 'debugging';
    }
    elsif ($opt =~ m/^\s*defaults\s*$/) {
      $opt_defaults = 1;
      $opt = 'defaults';
    }
    elsif ($opt =~ m/^\s*define\s+(.*)\s*=\s*(.*)\s*$/) {
      $opt_defines{$1} = $2;
      $opt = "define $1=$2";
    }
    else {
      die "Unrecognized option in config.opt: '$opt'!";
    }

    print "  $opt\n";
  }

  close OPTS;
  $reconfig = 1;
}

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
   --reconfig           Reconfigure with saved options
   --debugging          Enable debugging
   --defaults           Accept all default values
   --define name=value  Defines value name as value
   --help               This text
   --version            Show version
EOT
        exit;
}


#
# If we didn't just reconfig, store the config options out to config.opt.
#

if (!$reconfig) {
  open OPTS, ">config.opt" or die "Could not open config.opt for writing!";
  print OPTS "debugging\n" if $opt_debugging;
  print OPTS "defaults\n" if $opt_defaults;
  print(OPTS map { sprintf "define %s=%s\n", $_, $opt_defines{$_}; } keys %opt_defines) if %opt_defines;
  close OPTS;
}


#
#
#

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
if (!defined $osname) {
    ($osname, $cpuarch) = ($cpuarch, "");
}

$jitarchname              =  "$cpuarch-$osname";
$jitarchname		      =~ s/i[456]86/i386/i;
$jitarchname              =~ s/-(net|free|open)bsd$/-bsd/i;
$jitcapable               = 0;

if (-e "lib/Parrot/Jit/$jitarchname.pm") {
    $jitcapable = 1;
}

$jitcapable = $opt_defines{jitcapable} if exists $opt_defines{jitcapable};

unless($jitcapable){
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

    intvalfmt     => '%ld',
    floatvalfmt     => '%f',

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
    exe           => $Config{_exe},       # executable files extension
    cc_o_out      => '-o ',               # cc object output file
    cc_exe_out    => '-o ',               # cc executable output file (different on Win32)
    
    cc_ldflags    => '',                  # prefix for ldflags (necessary for Win32)
    
    cc_ldflags    => '',                  # prefix for ldflags (necessary for Win32)

    ld            => $Config{ld},
    ldflags	  => $Config{ldflags},
    ld_out        => '-o ',               # ld output file
    ld_debug      => '',                  # include debug info in executable
    ld_shared     => '-shared',

    perl          => $^X,
    test_prog     => 'test_parrot',
    debugging     => $opt_debugging,
    rm_f          => 'rm -f',
    rm_rf         => 'rm -rf',
    stacklow      => '(~0xfffu)',
    intlow        => '(~0xfffu)',
    numlow        => '(~0xfffu)',
    strlow        => '(~0xfffu)',
    pmclow        => '(~0xfffu)',
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
    DEVEL   =>    (-e 'DEVELOPING' ? '-devel' : ''),

    ops		=>    "",
    
    configdate    => scalar localtime,
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

# Make one more check before allowing the use of the JIT code.
# make sure that their choice of compiler and cflags will allow our JIT's
# non-ansi use of function pointers.
#

# Add the -DHAS_JIT if we're jitcapable
if ($jitcapable) {
    $c{cc_hasjit} = " -DHAS_JIT -D" . uc $jitcpuarch;
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
    eval $hint; die "Error in hints file $hints: '$@/$!'" if $@;
}


#
# Ask questions
#

prompt("What C compiler do you want to use?", 'cc');
prompt("How about your linker?", 'ld');
prompt("What flags would you like passed to your C compiler?", 'ccflags');
prompt("What flags would you like passed to your linker?", 'ldflags');
prompt("Which libraries would you like your C compiler to include?", 'libs');
prompt("How big would you like integers to be?", 'iv');
prompt("And your floats?", 'nv');
prompt("What is your native opcode type?", 'opcode_t');


{
	my(@ops)=glob("*.ops");

	$c{ops}=join ' ', sort {
		if   ($a eq 'core.ops') { -1 }
		elsif($b eq 'core.ops') {  1 }
		else             { $a cmp $b }
	} grep {!/obscure\.ops/ && !/vtable\.ops/} @ops;

	my $msg;

	chomp($msg=<<"END");

Now I have to find out what opcode files you would like to compile into your
Parrot.

The following opcode files are available:
@ops

WARNING: Bad Things may happen if the first file on the list isn't core.ops.

WARNING: These file names will not be checked for spelling, and typing them
         wrong will force you to run Configure again.

WARNING: I worry way too much about Configure users.

Which opcode files would you like?
END

	prompt($msg, 'ops');
}


print <<"END";

Determining if your C compiler is actually gcc (this could take a while):

END

{
    my %gnuc;

    compiletestc("test_gnuc");
    %gnuc=eval(runtestc("test_gnuc")) or die "Can't run the test program: $!";
    cleantestc("test_gnuc");

    unless (exists $gnuc{__GNUC__}) {
        print <<'END';

The test program didn't give the expected result - assuming your compiler is
not gcc.

END

    } else {
	my $major = $gnuc{__GNUC__};
        my $minor = $gnuc{__GNUC_MINOR__};
        unless (defined $major) {
            print <<'END';

Your C compiler is not gcc.

END
        } else {
	    print "Your C compiler reports itself as gcc, major version $major";
            print ", minor version $minor" if defined $minor;

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
}

if ($c{gccversion}) {
    # If using gcc, crank up its warnings as much as possible and make it
    # behave  ansi-ish.
    # Here's an attempt at a list of nasty things we can use for a given
    # version of gcc. The earliest documentation I currently have access to is
    # for 2.95, so I don't know what version everything came in at. If it turns
    # out that you're using 2.7.2 and -Wfoo isn't recognised there, move it up
    # into the next version becone (2.8)

    # Don't use -ansi -pedantic.  It makes it much harder to compile
    # using the system headers, which may well be tuned to a
    # non-strict environment -- especially since we are using perl5
    # compilation flags determined in a non-strict environment.
    # An example is Solaris 8.

    my @opt_and_vers = 
        (0 => "-Wall -Wstrict-prototypes -Wmissing-prototypes -Winline -Wshadow -Wpointer-arith -Wcast-qual -Wcast-align -Wwrite-strings -Wconversion -Waggregate-return -Winline -W -Wno-unused",
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
         2.8 => "-Wsign-compare",
         2.95 => "",
         3.0 => "-Wformat-nonliteral -Wformat-security -Wpacked -Wpadded -Wdisabled-optimization",
        # -Wsequence-point is part of -Wall
        # -Wfloat-equal may not be what we want
        # We shouldn't be using __packed__, but I doubt -Wpacked will harm us
        # -Wpadded may prove interesting, or even noisy.
        # -Wunreachable-code might be useful in a non debugging version
    );
    my $warns = "";
    while (my ($vers, $opt) = splice @opt_and_vers, 0, 2) {
        last if $vers > $c{gccversion};
        next unless $opt; # Ignore blank lines
        $warns .= " $opt";
    }
    $c{cc_warn} = $warns . " " . $c{cc_warn};
    
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
    compiletestc("test");
    %newc=eval(runtestc("test")) or die "Can't run the test program: $!";

    @c{keys %newc}=values %newc;

    cleantestc("test");
    unlink('test.c');
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
    my $format;
    if (($] >= 5.006) && ($c{$_} == $c{longsize}) && ($c{$_} == $Config{longsize}) ) {
        $format = 'l!';
    }
    elsif ($c{$_} == 4) {
        $format = 'l';
    }
    elsif ($c{$_} == 8 || $Config{use64bitint} eq 'define') {
         # pp_pack is annoying, and this won't work unless sizeof(UV) >= 8
        $format = 'q';
    }
    die "Configure.pl:  Unable to find a suitable packtype for $_.\n"
        unless $format;

    my $test = eval {pack $format, 0};
    unless (defined $test) {
        die <<"AARGH"
Configure.pl:  Unable to find a functional packtype for $_.
               '$format' failed: $@
AARGH
    }
    unless (length $test == $c{$_}) {
        die sprintf <<"AARGH", $c{$_}, length $test;
Configure.pl:  Unable to find a functional packtype for $_.
               Need a format for %d bytes, but '$format' gave %d bytes.
AARGH
    }
    $c{$which} = $format;
}

$c{packtype_n} = 'd';

#
# Find out what integer constant type we can use
# for pointers.
#

print "Figuring out what integer type we can mix with pointers...\n";

if ($c{intsize} == $c{ptrsize}) {
    print "We'll use 'unsigned int'.\n";
    $c{ptrconst} = "u";
} elsif ($c{longsize} == $c{ptrsize}) {
    print "We'll use 'unsigned long'.\n";
    $c{ptrconst} = "ul";
} else {
    die <<"AARGH";
Configure.pl:  Unable to find an integer type that fits a pointer.
AARGH
}

#"
# Determine format strings for INTVAL and FLOATVAL.
#

if ($c{iv} eq "int") {
    $c{intvalfmt} = "%d";
} elsif (($c{iv} eq "long") || ($c{iv} eq "long int")) {
    $c{intvalfmt} = "%ld";
} elsif (($c{iv} eq "long long") || ($c{iv} eq "long long int")) {
    $c{intvalfmt} = "%lld";
} else {
    die "Configure.pl:  Can't find a printf-style format specifier for type \"$c{iv}\"\n";
}

if ($c{nv} eq "double") {
    $c{floatvalfmt} = "%f";
} elsif ($c{nv} eq "long double") {
    $c{floatvalfmt} = "%lf";
} else {
    die "Configure.pl:  Can't find a printf-style format specifier for type \"$c{nv}\"\n";
}

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
buildfile("docs/Makefile");
buildfile("languages/Makefile");
buildfile("languages/jako/Makefile");
buildfile("languages/miniperl/Makefile");
buildfile("languages/scheme/Makefile");

buildfile("Types_pm", "lib/Parrot");

buildconfigpm();
print "\n";


if ($jitcapable) {
    print "Verifying that the compiler supports function pointer casts...\n";
    eval { compiletestc("testparrotfuncptr"); };

    if ($@ || !(runtestc("testparrotfuncptr") =~ /OK/)) {
        print "Although it is not required by the ANSI C standard,\n";
        print "Parrot requires the ability to cast from void pointers to function\n";
        print "pointers for its JIT support.\n\n";
        print "Your compiler does not appear to support this behavior with the\n";
        print "flags you have specified.  You must adjust your settings in order\n";
	print "to use the JIT code.\n\n";
        print "If you wish to continue without JIT support, please re-run this script\n";
	print "With the '--define jitcapable=0' argument.\n";
	exit(-1);
    }    
    cleantestc("testparrotfuncptr");
}


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
    print NEEDED "/* dummy */ struct _vtable { int a; };\n";
    close NEEDED;
    buildfile("testparrotsizes_c");
    compiletestc("testparrotsizes");
    %newc=eval(runtestc("testparrotsizes"))
      or die "Can't run the test program: $!";
    @c{keys %newc}=values %newc;

    @c{qw(stacklow intlow numlow strlow pmclow)} = lowbitmask(@c{qw(stackchunk iregchunk nregchunk sregchunk pregchunk)});

    cleantestc("testparrotsizes");
    unlink('testparrotsizes.c');
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

    if($input =~ s/^\+//) {
        $input="$c{$field} $input";
    }
    else {
        if($input =~ s/:rem\{(.*?)\}//) {
            $c{$field} =~ s/$_//g for split / /, $1;
        }

        if($input =~ s/:add\{(.*?)\}//) {
            $input="$c{$field} $1 $input";
        }
    }

    $c{$field}=$input||$c{$field};

    print "$field=$c{$field}\n";
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

    printf "  Building %-30s from %s...\n", "lib/Parrot/Config.pm",
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

    open(OUT, ">lib/Parrot/Config.pm") or die "Can't open file lib/Parrot/Config.pm: $!";
    print OUT $text;
    close(OUT) or die "Can't close file lib/Parrot/Config.pm: $!";
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

        exit 1;
    }
    else {
                print <<"END";
Okay, we found everything.  Next you'll need to answer
a few questions about your system.  Defaults are in square
brackets, and you can hit enter to accept them.  If you
don't want the default, type a new value in.  If that new
value starts with a '+', it will be concatenated to the
default value.

END
    }
}


#
# compiletestc()
#

sub compiletestc {
    my ($name) = @_;

    my $cmd = "$c{cc} $c{ccflags} -I./include -c $c{ld_out}$name$c{o} $name.c";
    system($cmd) and die "C compiler died!  Command was '$cmd'\n";

    $cmd = "$c{ld} $c{ldflags} $name$c{o} $c{cc_exe_out}$name$c{exe} $c{libs}";
    system($cmd) and die "Linker died!  Command was '$cmd'\n";
}


#
# runtestc()
#

sub runtestc {
    my ($name) = @_;

    my $cmd = "$name$c{exe}";
    `./$cmd`;
}

#
# cleantestc
#

sub cleantestc {
    my ($name) = @_;

    unlink("$name$c{o}", "$name$c{exe}");
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
        push @returns, "(~0x".sprintf("%x", $mask).$c{ptrconst}.")";
    }

    return @returns;
}

