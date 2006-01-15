# Copyright (C) 2004-2006 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

examples/library/getopt_demo.pir - demonstrating use of the module Getopt/Obj.pir

=head1 SYNOPSIS

    % ./parrot examples/library/getopt_demo.pir --help
    % ./parrot examples/library/getopt_demo.pir --version
    % ./parrot examples/library/getopt_demo.pir --string=asdf --bool --integer=42 some thing

=head1 DESCRIPTION

This demo program shows how to handle command line arguments with the
PIR library F<runtime/parrot/library/Getopt/Obj.pir>.

=cut

=head1 SUBROUTINES

=head2 main

This is executed when you call F<getopt_demo.pir>.

=cut

.sub main :main
  .param pmc argv

  load_bytecode "Getopt/Obj.pbc"

  # shift name of the program, so that argv contains only options and extra params
  .local string program_name
  program_name = shift argv

  # Specification of command line arguments.
  .local pmc getopts
  getopts = new "Getopt::Obj"
  # getopts."notOptStop"(1)

  # --version, boolean
  push getopts, "version"
  # --help, boolean
  push getopts, "help"
  # --bool, boolean
  push getopts, "bool"
  # --string, string
  push getopts, "string=s"
  # --integer, integer
  push getopts, "integer=i"

  .local pmc opt
  opt = getopts."get_options"(argv)

  # Now we do what the passed options tell
  .local int is_defined

  # Was '--version' passed ?
  is_defined = defined opt["version"]
  unless is_defined goto NO_VERSION_FLAG
    print "getopt_demo.pir 0.03\n"
    end
  NO_VERSION_FLAG:

  # Was '--help' passed ?
  is_defined = defined opt["help"]
  unless is_defined goto NO_HELP_FLAG
    usage( program_name )
    end
  NO_HELP_FLAG:

  # Say Hi
  print "Hi, I am 'getopt_demo.pir'.\n"
  print "\n"

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

=head2 usage

Print the usage message.

TODO: Pass a flag for EXIT_FAILURE and EXIT_SUCCESS

=cut

.sub usage 
  .param string program_name

  print "Usage: ./parrot "
  print program_name
  print " [OPTION]... [STRING]...\n"
  print "\n"
  print "Currently only long options are available.\n"
  print "\n"
  print "Operation modes:\n"
  print "      --help                   display this help and exit\n"
  print "      --version                output version information and exit\n"
  print "\n"
  print "For demo of option parsing:\n"
  print "      --string=STRING          a string option\n"
  print "      --integer=INTEGER        an integer option\n"
  print "      --bool                   a boolean option\n"
.end

=head1 AUTHOR

Bernhard Schmalhofer - C<Bernhard.Schmalhofer@gmx.de>

=head1 SEE ALSO

F<runtime/parrot/library/Getopt/Obj.pir>

=cut
