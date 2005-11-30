# $Id$

=head1 NAME 

input.pir - Setting up input and reading input

=head1 DESCRIPTION

Copyright:  2004-2005 Bernhard Schmalhofer. All Rights Reserved.
CVS Info:   $Id$
History:    Ported from GNU m4 1.4
References: http://www.gnu.org/software/m4/m4.html

=head1 SUBROUTINES

=head2 void input_init( Hash state )

Initialise some stacks and put them into the Hash state['stack']: 

=over 4

=item state['stack';'token']   not used yet

=item state['stack';'input']   contains files, strings and macro definitions

=item state['stack';'wrapup']  not used yet

=back

Initialize some PGE rulesubs and put them into the Hash state['rulesub']: 

=over 4

=item state['rulesub';'word']    recognizes TOKEN_WORD.

=item state['rulesub';'string']  recognizes TOKEN_STRING

=item state['rulesub';'simple']  recognizes TOKEN_SIMPLE

=item state['rulesub';'simple']  recognizes comments, returned as TOKEN_SIMPLE

=back

TOOO: recognize nested quoted strings

=cut

.include "datatypes.pasm"

.sub input_init 
  .param pmc state         

  # setup of stacks
  .local pmc stack_in_state
  stack_in_state = new .Hash
  state['stack'] = stack_in_state
  .local pmc empty_array
  empty_array = new .ResizablePMCArray
  stack_in_state['token'] = empty_array
  empty_array = new .ResizablePMCArray
  stack_in_state['input'] = empty_array
  empty_array = new .ResizablePMCArray
  stack_in_state['wrapup'] = empty_array

  # setup of some rules
  # these rules should be kept in sync with t/regex/002_tokens.t
  # TODO: Use named or positional captures
  # TODO: rulesub for frozen state 
  .local pmc p6rule
  p6rule = compreg "PGE::P6Rule"
  .local pmc rulesub_in_state
  rulesub_in_state = new .Hash
  state['rulesub'] = rulesub_in_state
  .local pmc rulesub
  rulesub = p6rule( "^(<[_a..zA..Z]><[_a..zA..Z0..9>]>*)" )
  rulesub_in_state['word'] = rulesub
  rulesub = p6rule( "^(`<-[`]>*')" )
  rulesub_in_state['string'] = rulesub
  rulesub = p6rule( "^(<-[`#_a..zA..Z]>)" )
  rulesub_in_state['simple'] = rulesub
  rulesub = p6rule( '^(\#\N*\n)' )
  rulesub_in_state['comment'] = rulesub

.end


=head2 void push_file( Hash state, string filename )

Stores a filename on a stack
TODO: open these files and complain when they don't or pass filehandles

=cut

.sub push_file 
  .param string   filename    
  .param pmc      state 

  # This is needed for m4___file__
  # TODO: this is badly broken, when there are multiple input files
  state['current_file'] = filename

  .local pmc in
  in = open filename, '<'
  if in goto PROCESS_SINGLE_FILE
    printerr filename
    printerr " not found\n"
    end
  PROCESS_SINGLE_FILE:
  .local string input_string    # input file handle
  input_string = read in, 50000
  close in

  # state['stack';'input'] has been created in input_init 
  # TODO: seperate input blocks for every file
  .local pmc input_stack
  input_stack = state['stack';'input']
  .local pmc input_block
  .local int stack_size
  stack_size = input_stack
  if stack_size > 0 goto NOT_FIRST_FILE
    input_block = new .Hash
    input_block['type'] = 'INPUT_STRING'
    input_block['string'] = input_string
    push input_stack, input_block
    goto FINISH_PUSH_FILE
  NOT_FIRST_FILE:
  input_block = shift input_stack
  .local string file
  file = input_block['string']
  file = file . input_string
  input_block['string'] = file
  push input_stack, input_block
  FINISH_PUSH_FILE:
.end


=head2 string next_token( Hash state )

Parse and return a single token from the input stream.  A token can
either be TOKEN_EOF, if the state['stack';'input'] is empty; it can be TOKEN_STRING
for a quoted string; TOKEN_WORD for something that is a potential macro
name; and TOKEN_SIMPLE for any single character that is not a part of
any of the previous types.					
									   |
Next_token () return the token type and the token data.

Uses regular expressions for finding tokens.

=cut

.sub next_token 
  .param pmc state 

  .local pmc input_stack    
  input_stack = state['stack';'input']
  .local pmc input_block    
  input_block = shift input_stack
  .local string input_string    
  input_string = input_block['string']
  .local int current_file_len
  current_file_len = length input_string    
  .local pmc rulesub   
  .local string token_type
  token_type = 'TOKEN_EOF'
  .local string token_data
  token_data = ''
  .local pmc match
    
  # look for 'TOKEN_SIMPLE'
  # read a whole bunch of non-macro and non-word charcters
  rulesub = state['rulesub';'simple']
  token_type = 'TOKEN_SIMPLE'
  match = rulesub( input_string ) 
  if match goto MATCH

  # look for comments and return it as 'TOKEN_SIMPLE'
  rulesub = state['rulesub';'comment']
  token_type = 'TOKEN_SIMPLE'
  match = rulesub( input_string ) 
  if match goto MATCH

  # look for 'TOKEN_STRING'
  rulesub = state['rulesub';'string']
  token_type = 'TOKEN_STRING'
  match = rulesub( input_string ) 
  if match goto MATCH

  # look for 'TOKEN_WORD'
  # this will be checked for macro substitution
  rulesub = state['rulesub';'word']
  token_type = 'TOKEN_WORD'
  match = rulesub( input_string ) 
  if match goto MATCH

  if current_file_len != 0 goto MATCH_FAILED 
  token_type = 'TOKEN_EOF'
  token_data = ''
  goto FINISH_NEXT_TOKEN 

  MATCH:
  # TODO: is there a method for extraction the matched string?
  .local int token_from, token_to
  .local pmc captures
  ( captures ) = match."get_array"()
  token_from = match.'from'()
  token_to = match.'to'()
  token_data = captures[0]   
  #token_data = substr input_string, token_from, token_to, ''      # TODO nibble at input without replacing input_string
  substr input_string, token_from, token_to, ''      # TODO nibble at input without replacing input_string

  goto SKIP_DEBUG_1
    print "\ntoken_type: "
    print token_type
    print "\ntoken_from: "
    print token_from
    print "\ntoken_to: "
    print token_to
    print "\ntoken_data: "
    print token_data
    print "\n"
  SKIP_DEBUG_1:

  ne token_type, 'TOKEN_STRING', NO_STRING_MATCH
    substr token_data, 0, 1, ''
    substr token_data, -1, 1, ''
  NO_STRING_MATCH: 
  goto FINISH_NEXT_TOKEN

  MATCH_FAILED:
    printerr "failed to match !"
    printerr input_string
    printerr "!\n"     
  goto FINISH_NEXT_TOKEN

  FINISH_NEXT_TOKEN: 
  input_block['string'] = input_string
  push input_stack, input_block

  .return ( token_type, token_data )
.end
