#! perl -w

# Copyright (c) 2002-2003 by William J. Coleda.

use strict;
use lib qw(lib);

#my $DEBUG = 0;

# Get the source code..
# XXX It occurs to me that It should be possible (and possibly desirable)
# to simply suck in the contents of the tcl file, construct a string (by
# generating imcc code. This would basically turn the interpreter that we
# generate on the fly to a (crappy) compiler.  (A better way to do this
# would be to generate the appropriate byte stream to call the various
# commands with their arguments. This should be vaguely possible with the
# current implementation.

opendir(LIBDIR,"lib/commands") or die;
my @commands = grep {s/\.imc$//} readdir(LIBDIR);

print <<'EOF';
# This file generated automatically by tcl.pl
#
# tcl.imc is Copyright (c) 2002-2003 by William J. Coleda

#
# _main
#
# Read in the contents of a file and parse it.

.pcc_sub _main prototyped
  .param var argv

  .local string filename
  .local string mode
  .local string chunk
  .local string contents
  .local PerlHash commands
  .local sub command_sub
  .local int argc

  # If no file was specified, read from stdin.
  argc = argv
  if argc > 1 goto open_file
  getstdin $P1
  goto loop 

open_file: 
  filename = argv[1]

  $S1="<"  
  open $P1, filename, $S1
  $I0 = defined $P1
  if $I0 == 1 goto loop

  print "couldn't read file \""
  print filename
  print "\": no such file or directory\n"
  end

loop:
  read chunk, $P1, 1024
  if chunk == "" goto setup
  contents = contents . chunk
  goto loop
  
setup:
  close $P1

# contents sucked in. Parse it.
 
  #XXX need to setup all the [commands] here so they're reachable.
  commands = new PerlHash  
EOF
  foreach my $command (@commands) {
    print "  newsub command_sub, .Sub, __cmd_$command\n";
    print "  commands[\"$command\"] = command_sub\n";
  }

print <<'EOF';

  # start with a new pad...
  # XXX need to really support pads properly.
  # XXX of course, this means I need to understand them first.
  new_pad 0

  global "commands" = commands

  .arg contents
  saveall
  call __parse
  restoreall
  .result $S0
  #print $S0

  # don't fall off the end of main, it's rude.
  end 
.end
EOF

# Write out all the subs needed...

my @subs = qw/match_close var_subst parse backslash_newline_subst backslash_subst/;

for my $sub (@subs) {
  my $file = $sub . ".imc";
  my $fullpath = "";
  foreach my $dir (@INC) {
    $fullpath = $dir . "/" . $file;
    last if -f $fullpath;
  }
  include($fullpath);
}

foreach my $cmd (@commands) {
  include("lib/commands/$cmd.imc");
}


# XXX Once imcc correctly reports which file actually had the error,
# then we can use the .include syntax.
# The problem is with macros... if I change 
# 
# XXX Though at that point we need to make debug work again...
#
sub include {
  my $file = shift;
  print '.include "' . $file . '"'. "\n";
  #local undef $\;
  #open (FILE,$file) or warn "couldn't include $file";
  #while (<FILE>) {
	#$DEBUG || next if /\.debug/;
	#print $_;
  #}
  #close(FILE);
}
