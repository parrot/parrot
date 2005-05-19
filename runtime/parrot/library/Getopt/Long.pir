# Copyright (C) 2003-2005 The Perl Foundation.  All rights reserved.
# $Id$

=head1 NAME

library/Getopt/Long.pir - parse long and short command line options

=head1 SYNOPSIS

  # get the relevant sub
  load_bytecode "Getopt/Long.pbc"
  .local pmc get_options
  find_global get_options, "Getopt::Long", "get_options" 

  # Assemble option specification
  .local pmc opt_spec
  opt_spec = new ResizableStringArray
  push opt_spec, "bool"
  push opt_spec, "string=s"
  push opt_spec, "integer=i"

  # the program name is the first element in argv
  .local string program_name
  program_name = shift argv

  # Make a copy of argv, because this can easier be handled in get_options()
  .local pmc argv_clone
  argv_clone = clone argv

  # Parse the command line params
  .local pmc opt
  ( opt ) = get_options( argv_clone, opt_spec )

  .local int is_defined
  is_defined = defined opt["bool"]

  .local int integer
  integer = opt["integer"]

  .local string s
  s = opt["string"]

=head1 DESCRIPTION

This Parrot library can be used for parsing command line options.
The subroutine get_options() is exported into the namespace 'Getopt::Long'.

=cut

.include "library/dumper.imc"

.sub "__onload" @LOAD

  # Load dependant libraries
  load_bytecode "PGE.pbc"

.end
 
.namespace [ "Getopt::Long" ]

=head1 SUBROUTINES

=head2 C<get_options> in C<Getopt::Long>

This should work like the Perl5 module Getopt::Long.
Takes an array of options and an array of specifications.

A Hash PMC is returned.

=cut

.sub get_options 
  # TODO: Check whether these are really arrays  
  .param pmc argv                    # An Array containing command line args
  .param pmc spec                    # An Array containing the spec

  # setting up PGE
  # TODO: compile patterns in __onload
  .local pmc    p6rule
  find_global p6rule, "PGE", "p6rule"
  .local pmc    isnt_binary_rule, is_long_option, is_short_option, key_val_rule 
  isnt_binary_rule = p6rule( '=' )
  is_long_option   = p6rule( '--' )
  is_short_option  = p6rule( '-' )
  key_val_rule     = p6rule( '=' )
  .local pmc    match

  # Loop over the array spec and build up two simple hashes
  .local pmc    type                 # the type of the option: binary, string, integer
  type = new Hash
  .local int    curr_spec            # a counter for looping over the array 'spec'
  curr_spec = 0
  .local int    max_spec             # for end condition of loop over 'spec'
  max_spec = spec
  .local int    spec_index           # searching for patterns in 'spec'
  .local string opt_name, opt_type   # name and type of specified option

  # TODO: put this block into a sub
  goto CHECK_PARSE_SPEC
  NEXT_PARSE_SPEC:                   # Look at next element in 'spec'
    opt_name = spec[curr_spec]
    # opt_name is stored into the hash - this creates reference
    # the substr below modifies this hash key in place, so we
    # have to clone it
    opt_name = clone opt_name
    match = isnt_binary_rule( opt_name ) 
    if match goto NOT_A_BINARY_OPTION
    opt_type = 'b'
    goto OPTION_TYPE_IS_NOW_KNOWN
  NOT_A_BINARY_OPTION:
    spec_index = match.from()        # position of the '=' in opt_name     
    inc spec_index                   # we know where '=', thus the type is one further
    opt_type = substr opt_name, spec_index, 1, ''
    dec spec_index                   # Go back to the '='
    # TODO: what if we have something like    name=xy ?
    substr opt_name, spec_index, 1, ''   # remove the '='
  OPTION_TYPE_IS_NOW_KNOWN:
    type[opt_name] = opt_type
    inc curr_spec
  CHECK_PARSE_SPEC:                  # check whether loop over 'spec' is complete
  if curr_spec < max_spec goto NEXT_PARSE_SPEC

  # uncomment this if you want debug output
  goto SKIP_DEBUG_OUTPUT
  _dumper( 'type', type )
  SKIP_DEBUG_OUTPUT:

  # Now that we know about the allowed options,
  # we actually parse the argument vector
  # TODO: do this correctly
  # shift from argv until a non-option is encountered
  .local pmc opt              # the return PMC
  opt = new Hash
  .local string arg                  # element of argument array
  .local string value                # element of argument array
  .local int    num_remaining_args   # for checking whether loop is complete
  .local int    arg_index            # holds result if 'index' op
  .local int    is_known_option      # flag whether the option is known
  .local int    prefix_end, prefix_len
  goto CHECK_PARSE_ARGV
  NEXT_PARSE_ARGV:
    # first we take a peek at the first remaining element
    arg = argv[0]
    # arg is stored into the hash - this creates reference
    # the substr below modifies this hash key in place, so we
    # have to clone it
    arg = clone arg

    # Is arg a long option string like '--help'
    # TODO: how about asdf--jkl ???
    match = is_long_option( arg ) 
    if match goto HANDLE_LONG_OPTION

    # Is arg a short option string like '-v'
    match = is_short_option( arg ) 
    if match goto HANDLE_SHORT_OPTION
    # We are done with the option
    # and we don't want to loose the remaining arguments
    goto FINISH_PARSE_ARGV

    HANDLE_SHORT_OPTION:
    # TODO: make it work for short options
    HANDLE_LONG_OPTION:
    # we take the current option off argv
    arg = shift argv
    arg = clone arg
    # get rid of the leading '--' or '-'
    arg_index = match.from()
    prefix_end = match.to()
    prefix_len = prefix_end - arg_index
    arg = substr arg_index, prefix_len, ''
    # recover the value if any
    match = key_val_rule( arg ) 
    if match goto VALUE_PASSED
    opt[arg] = 1
    goto VALUE_OF_OPTION_IS_NOW_KNOWN
    VALUE_PASSED:
    # TODO: let PGE capture the value
    arg_index = match.from()
    inc arg_index    # Go one past the '='
    .local int len_value
    len_value = length arg
    len_value = len_value - arg_index
    value = substr arg, arg_index, len_value
    # drop the '=file.m4' from '--freeze-state=file.m4'
    dec arg_index
    inc len_value
    arg = substr arg_index, len_value, ''
    opt[arg] = value
    VALUE_OF_OPTION_IS_NOW_KNOWN:
    # Is this a known option?
    # TODO: make this work for nonbinary options
    is_known_option = defined type[arg]
    unless is_known_option goto UNKNOWN_OPTION
    # Tell the caller that the option 'arg' has been passed
    goto CHECK_PARSE_ARGV
    UNKNOWN_OPTION:
    # TODO: handle unknown options
    printerr 'unknown option: !'
    printerr  arg
    printerr "!\n"

  CHECK_PARSE_ARGV:
    num_remaining_args = argv
    if num_remaining_args > 0 goto NEXT_PARSE_ARGV

  FINISH_PARSE_ARGV:
  # Nothing to do here

  .return ( opt )
.end

=head1 TODO

- Remove need to clone argument vector
- Make it work for all cases, short options, long options and bundling.
- Recognise type of return value: string, integer, binary, array, hash.
- Get started on error reporting.
- Provide more options

=head1 AUTHOR

Bernhard Schmalhofer - C<Bernhard.Schmalhofer@biomax.de>

=head1 SEE ALSO

The Perl5 module L<Getopt::Long>.
F<examples/assembly/getopt_demo.imc>

=head1 COPYRIGHT

Copyright (C) 2003-2005 The Perl Foundation.  All rights reserved.
This program is free software. It is subject to the same
license as The Parrot Interpreter.

=cut
