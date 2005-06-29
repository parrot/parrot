# $Id$

=head1 NAME

m4.pir - An implementation of GNU m4 in Parrot Intermediate Representation

=head1 DESCRIPTION

Copyright:  2004-2005 Bernhard Schmalhofer.  All Rights Reserved.
CVS Info:   $Id$
Overview:   Main of Parrot m4.
History:    Ported from GNU m4 1.4
References: http://www.gnu.org/software/m4/m4.html

=cut

# The needed subroutines are imported from files in 'src'
# TODO: private namespaces for local subroutines in the included files
#
# The names of these source files should be consistent with 'GNU m4'.

# subs for reading in input
.include "src/input.pir"

# subs for writing output
.include "src/output.pir"

# This contains the initialization and execution of the builtin macros.
.include "src/builtin.pir"

# This contains reading and writing of frozen files
.include "src/freeze.pir"

# Macros are expanded in there.
.include "src/macro.pir"

# Mainly for debug output
# .include "library/dumper.imc"


=head1 SUBROUTINES
 
=head2 __onload

Load needed libraries

=cut

.sub "__onload" @LOAD


.end


=head2 m4

Looks at the command line arguments and acts accordingly.

=cut

.sub m4 @MAIN 
  .param pmc argv

  # TODO: put this into __onload
  # load_bytecode "PGE.pbc"        # Loaded by Getopt/Long.pbc
  load_bytecode "Getopt/Long.pbc"  # This also loads PGE

  .local pmc get_options
  find_global get_options, "Getopt::Long", "get_options"

  # name of the program
  .local string program_name
  program_name = shift argv

  # Specification of known command line arguments.
  # The args are parsed with library/Getopt/Long.pir which should work 
  # somewhat like the Perl5 module Getopt::Long.
  .local pmc opt_spec      
  opt_spec = new ResizableStringArray
  # --version, boolean
  push opt_spec, "version"
  # --help, boolean
  push opt_spec, "help"
  # -G or --traditional, boolean
  push opt_spec, "traditional"
  # -E or --fatal-warnings, boolean
  push opt_spec, "fatal-warnings"
  # -d or --debug, string
  push opt_spec, "debug=s"
  # -l or --arglength, number
  push opt_spec, "arglength=i"
  # -o or --error-output, string
  push opt_spec, "error-output=s"
  # -I or --include, string
  push opt_spec, "include=s"
  # -e or --interactive, boolean
  push opt_spec, "interactive"
  # -s or --synclines, boolean
  push opt_spec, "synclines"
  # -P or --prefix-builtins, boolean
  push opt_spec, "prefix-builtins"
  # -W or --word-regexp, string
  push opt_spec, "word-regexp=s"
  # -H or --hash-size, integer
  push opt_spec, "hash-size=i"
  # -L or --nesting-limit, integer
  push opt_spec, "nesting-limit=i"
  # -Q or --quiet or --silent, boolean
  push opt_spec, "quiet"
  push opt_spec, "silent"
  # -N or --diversions, integer
  push opt_spec, "diversions=i"
  # -D or --define, string
  push opt_spec, "define=s"
  # -U or --undefine, string
  push opt_spec, "undefine=s"
  # -t or --trace, string
  push opt_spec, "trace=s"
  # --freeze-state=m4.frozen, string
  push opt_spec, "freeze-state=s"
  # --reload-state=m4.frozen, string
  push opt_spec, "reload-state=s"

  # Make a copy of argv, because this can easier be handled in get_options
  # TODO: eliminate need for copy
  .local pmc cloned_argv
  cloned_argv = clone argv
  .local pmc opt
  ( opt ) = get_options( cloned_argv, opt_spec )

  # Now dow what the options want
  .local int is_defined

  # Was '--version' passed ?
  is_defined = defined opt["version"]
  unless is_defined goto NO_VERSION_FLAG
    print "Parrot m4 0.0.13\n"
    end
NO_VERSION_FLAG: 

  # Was '--help' passed ?
  is_defined = defined opt["help"]
  unless is_defined goto NO_HELP_FLAG
    usage( program_name )
    end
NO_HELP_FLAG: 

  # TODO: In near future we propably should use objects here
  # For now let's just just use a hash with all state information
  .local pmc state
  state = new Hash

  # Artificial limit for macro expansion in macro.pir
  # default setting of 'nesting_limit' max be overridden by
  # command line option '-L' or '--nesting-limit
  state['nesting_limit']   = 250
  state['expansion_level'] = 0

  # A flag that tells whether builtin macros should be prefixed with 'm4_'
  state['prefix_all_builtins'] = 0

  # Was '--nesting-limit' passed ?
  is_defined = defined opt['nesting-limit']
  unless is_defined goto NO_NESTING_LIMIT_FLAG
    .local int nesting_limit
    nesting_limit = opt['nesting-limit']
    state['nesting_limit'] = nesting_limit
NO_NESTING_LIMIT_FLAG: 

  # Was '--prefix-builtins' passed ?
  is_defined = defined opt['prefix-builtins']
  unless is_defined goto NO_PREFIX_BUILTINS_FLAG
    state['prefix_all_builtins'] = 1
NO_PREFIX_BUILTINS_FLAG: 

  # Was a yet unimplemented option passed?
  # TODO: put names of unimplemented options in an ResizableStringArray
  .local string unimplemented_option

  unimplemented_option = "traditional"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "fatal-warnings"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "debug"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "arglength"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "error-output"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "include"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "interactive"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "synclines"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "word-regexp"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "hash-size"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "quiet"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "silent"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "diversions"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "define"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "undefine"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  unimplemented_option = "trace"
  is_defined = defined opt[unimplemented_option]
  if is_defined goto UNIMPLEMENTED_OPTION

  goto NO_UNIMPLEMENTED_OPTION
UNIMPLEMENTED_OPTION:
    printerr "Sorry, the option '--"
    printerr unimplemented_option
    printerr "' is not implemented yet.\n"
    end
NO_UNIMPLEMENTED_OPTION:

  # load shared lib
  # There is a init-function in the shared lib,
  # which registers the new compiler
  .local pmc m4_eval_compiler_lib
  m4_eval_compiler_lib = loadlib "m4_eval_compiler"

  # init of input structures, creates state['input_stack']
  input_init( state )

  # TODO: init of output structures

  # First we set up a table of all symbols, that is macros 
  .local pmc symtab
  #symtab = new Hash
  symtab = new OrderedHash
  state['symtab'] = symtab    

  # TODO: read M4PATH with env.pmc 
  # TODO: setup searchpath for m4-files
  # TODO: handling of debuglevel
  # TODO: enable suppression of warnings
  # TODO: disabling of gnu_extension
  # TODO: handling of sync lines
  # TODO: enable changing definition of what words are
  # TODO: enable changing of quote characters
  # TODO: enable changing of comment delimiters 
  # TODO: error handling
  # TODO: handle reading from STDIN, multiple input files

  # check argc, we need at least one input file
  .local int argc
  argc = cloned_argv
  if argc >= 1 goto ARGC_IS_OK
    usage( program_name )
    end
ARGC_IS_OK:

  # We need the builtin_tab, whether '--reload_state' was passed or not
  .local pmc builtin_tab
  builtin_tab = new OrderedHash
  state['builtin_tab'] = builtin_tab    
  
  builtin_tab_init( state )

  # Was '--reload-state' passed ?
  is_defined = defined opt['reload-state']
  unless is_defined goto NO_RELOAD_STATE_FLAG

  .local string frozen_file
  frozen_file = opt['reload-state']
  .local int string_len
  string_len = length frozen_file
  unless string_len > 0 goto NO_RELOAD_STATE_FLAG
    reload_frozen_state( state, frozen_file )
    goto COMMANDLINE_MACROS_INIT
NO_RELOAD_STATE_FLAG:
  builtin_init( state )

COMMANDLINE_MACROS_INIT:
  # TODO: initialize list of macros from command line

INTERACTIVE_MODE_INIT:
  # TODO: setup buffering for interactive mode

PATH_SEARCH:
  # TODO: enable reading from STDIN
  # TODO: look for files in M4PATH
  # Name of the input file, usually with extension '.m4'
  .local string filename
REDO_FILENAME_LOOP:
  argc = cloned_argv
  unless argc > 0 goto LAST_FILENAME_LOOP
    filename = shift cloned_argv
    push_file( filename, state )
    goto REDO_FILENAME_LOOP
LAST_FILENAME_LOOP:

  # now we start to do some work
  expand_input( state )

HANDLE_WRAPUP_TEXT:
  # TODO: handle wrapup text, whatever that is

  # Was '--freeze-state' passed ?
  is_defined = defined opt['freeze-state']
  unless is_defined goto NO_FREEZE_STATE_FLAG

  .local string freeze_file
  freeze_file = opt["freeze-state"]
  string_len = length freeze_file
  unless string_len > 0 goto NO_FREEZE_STATE_FLAG
    produce_frozen_state( state, freeze_file )
    goto FINISH_PROGRAM

NO_FREEZE_STATE_FLAG:
  # TODO: make_diversion, undiver_all, whatever that does 

FINISH_PROGRAM:

.end


=head2 void usage( string program_name )

Prints an usage message.
The program name is passed as the first parameter.
There are no return values.

TODO: Pass a flag for EXIT_FAILURE and EXIT_SUCCESS

=cut

.sub usage 
  .param string program_name

  print "Usage: ../../parrot "
  print program_name
  print " [OPTION]... FILE\n"
  print "\n"
  print "Currently only long options are available.\n"
  print "\n"
  print "Operation modes:\n"
  print "      --help                   display this help and exit\n"
  print "      --version                output version information and exit\n"
  print "      --prefix-builtins        force a `m4_' prefix to all builtins\n"
  print "\n"
  print "Frozen state files:\n"
  print "      --freeze-state=FILE      produce a frozen state on FILE at end\n"
  print "      --reload-state=FILE      reload a frozen state from FILE at start\n"
  print "\n"

.end

