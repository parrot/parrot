# Copyright (C) 2004-2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

t/library/getopt_long.t - testing library/Getopt/Long.imc

=head1 SYNOPSIS

	% perl -Ilib t/library/getopt_long.t

=head1 DESCRIPTION

This test program tries to handle command line arguments with the
library F<runtime/parrot/library/Getopt/Long.imc>.

=cut

use strict;

use Parrot::Test tests => 1;

# no. 1
pir_output_is( <<'CODE', <<'OUT', "basic long options" );

# A dummy implementation of Getopt::Long
.include "library/Getopt/Long.imc"

.sub test @MAIN 

  # Assemble specification for get_options
  # in an array of format specifiers
  .local pmc opt_spec    
  opt_spec = new ResizableStringArray
  # --version, boolean
  push opt_spec, "version"
  # --help, boolean
  push opt_spec, "help"
  # --bool, boolean
  push opt_spec, "bool"
  # --string, string
  push opt_spec, "string=s"
  # --integer, integer
  push opt_spec, "integer=i"

  # This comes usually from the command line
  .local pmc argv
  argv = new PerlArray
  push argv, "--help"
  push argv, "--version"
  push argv, "--string=asdf"
  push argv, "--bool"
  push argv, "--integer=42"
  push argv, "some"
  push argv, "thing"

  .local pmc opt
  ( opt ) = _get_options( argv, opt_spec )

  # Now we do what the passed options tell
  .local int is_defined

  # Was '--version' passed ?
  is_defined = defined opt["version"]
  unless is_defined goto NO_VERSION_FLAG
    print "getopt_long.t 0.01\n"
  NO_VERSION_FLAG:

  # Was '--help' passed ?
  is_defined = defined opt["help"]
  unless is_defined goto NO_HELP_FLAG
    print "This is just a test.\n"
  NO_HELP_FLAG:

  # handle the bool option
  is_defined = defined opt["bool"]
  unless is_defined goto NO_BOOL_OPTION
    print "You have passed the option '--bool'.\n"
    goto END_BOOL_OPTION
  NO_BOOL_OPTION:
    print "You haven't passed the option '--bool'. This is fine with me.\n"
  END_BOOL_OPTION:

  # handle the string option
  is_defined = defined opt["string"]
  unless is_defined goto NO_STRING_OPTION
    .local string string_option
    string_option = opt["string"]
    print "You have passed the option '--string'. The value is '"
    print string_option
    print "'.\n"
    goto END_STRING_OPTION
  NO_STRING_OPTION:
    print "You haven't passed the option '--string'. This is fine with me.\n"
  END_STRING_OPTION:

  # handle the integer option
  is_defined = defined opt["integer"]
  unless is_defined goto NO_INTEGER_OPTION
    .local string integer_option
    integer_option = opt["integer"]
    print "You have passed the option '--integer'. The value is '"
    print integer_option
    print "'.\n"
    goto END_INTEGER_OPTION
  NO_INTEGER_OPTION:
    print "You haven't passed the option '--integer'. This is fine with me.\n"
  END_INTEGER_OPTION:

  # For some reason I can't shift from argv
  .local string other_arg
  .local int    cnt_other_args
  cnt_other_args = 0
  .local int num_other_args
  num_other_args = argv
  goto CHECK_OTHER_ARG_LOOP
  REDO_OTHER_ARG_LOOP:
    other_arg = argv[cnt_other_args]
    print "You have passed the additional argument: '"
    print other_arg
    print "'.\n"
    inc cnt_other_args
  CHECK_OTHER_ARG_LOOP:
  if cnt_other_args < num_other_args goto REDO_OTHER_ARG_LOOP
  print "All args have been parsed.\n"
.end

CODE
getopt_long.t 0.01
This is just a test.
You have passed the option '--bool'.
You have passed the option '--string'. The value is 'asdf'.
You have passed the option '--integer'. The value is '42'.
You have passed the additional argument: 'some'.
You have passed the additional argument: 'thing'.
All args have been parsed.
OUT

=head1 AUTHOR

Bernhard Schmalhofer - C<Bernhard.Schmalhofer@gmx.de>

=head1 SEE ALSO

F<runtime/parrot/library/Getopt/Long.imc>

=cut
