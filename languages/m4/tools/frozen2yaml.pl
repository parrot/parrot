#! perl -w

# $Id$

=head1 DESCRIPTION

=head1 SYNTAX

=cut

# pragmata
use strict;
use 5.008;

# standard perl modules

# Modules from CPAN
use Parse::RecDescent;
use YAML;

# local Modules


# Create a parser that outputs an Array
$::RD_ERRORS = 1;
$::RD_WARN   = 1;
$::RD_HINT   = 1;
#$::RD_TRACE  = 1;
$::RD_TRACE  = undef;
my $frozen_parser = Parse::RecDescent->new( << 'END_GRAMMAR' );

{
  $::name_len         = 0; 
  $::substitution_len = 0; 
}

# We are only interested in the macro definitions
frozen:             comment V1 macros comment
                  { $item[3] }

# Return a hash reference where the macro_name is the key
macros:             macro(s)
                  { my $dummy = { map { $_->[0] => 
                                        { flag         => $_->[1],
                                          substitution => $_->[2],
                                        }
                                      } @{$item[1]}
                                }
                  }

# ignore comments
comment:            m/^#[^\n]*\n/

# TODO: What does this means???
V1:                 "V1\n"

# for each macro we need: name, substitution and flag
# The length is uninteresting later on.
# 
# Example:
# F8,8
# translittranslit
#
# Flag is 'F'
# Name is 'translit'
# substitution: 'translit'
macro:              flag name_len ',' substitution_len name substitution 
                  { [ @item[5,1,6] ] }       

# TODO: What does this means???
flag:               'F' | 'T'

# We need the len of the macro name, 
# because we extract is as a substring in the next line
name_len:           m/[0-9]+/
                  { $::name_len = $item[1] }

# We need the len of the macro substitution,
# because we extract is as a substring in the next line
substitution_len:   m/[0-9]+/
                  { $::substitution_len = $item[1] }

# length is known from the line above
name:               m/[a-zA-Z0-9_-]{$::name_len}/ 

# length is known from the line above
substitution:       m/[a-zA-Z0-9_-]{$::substitution_len}/ 

END_GRAMMAR

# Slurp in the frozen-state file
my $frozen;
{
  $/ = undef;
  $frozen = <>;
}
#print Dump( $frozen );

# Parse the freeze-state
my $symtab = $frozen_parser->frozen( $frozen );

# Dump the parsed data as YAML 
print Dump( $symtab );


=head1 SEE ALSO

=head1 AUTHOR

=cut
