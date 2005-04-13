#
# Token.pm
#
# Copyright: 2001-2005 The Perl Foundation.  All Rights Reserved.
# This program is free software. It is subject to the same license
# as the Parrot interpreter.
#
# $Id$
#
#

use strict;
eval "use warnings";

package Jako::Token;


#
# CONSTRUCTOR:
#

sub new
{
  my $class = shift;
  my ($file, $line, $kind, $type, $text) = @_;

  return bless {
    FILE => $file,
    LINE => $line,
    KIND => $kind, # op, 
    TYPE => $type,
    TEXT => $text
  }, $class;
}

sub new_bof
{
  my $class = shift;
  my ($file, $line) = @_;

  return $class->new($file, $line, 'bof', undef, '__BOF__');
}

sub new_eof
{
  my $class = shift;
  my ($file, $line) = @_;

  return $class->new($file, $line, 'eof', undef, '__EOF__');
}

my $BOF = Jako::Token->new_bof(undef, undef);
sub BOF { return $BOF }

my $EOF = Jako::Token->new_eof(undef, undef);
sub EOF { return $EOF }


#
# ACCESSORS:
#

sub file
{
  my $self = shift;
  return defined $self->{FILE} ? $self->{FILE} : '<NO FILE>';
}

sub line
{
  my $self = shift;
  return defined $self->{LINE} ? $self->{LINE} : '';
}

sub kind { return shift->{KIND}; }
sub type { return shift->{TYPE}; }
sub text { return shift->{TEXT}; }


#
# dump()
#

sub dump
{
  my $self = shift;

  print STDERR "{\n";
  foreach my $key (sort keys %$self) {
    printf STDERR "%10s => %s\n", $key, $self->{$key};
  }
  print STDERR "}\n";
}


#
# PREDICATES:
#

sub is { my $self = shift; return grep { $self->kind eq $_ } @_; }

sub is_arith_assign  { return shift->is('arith-assign');  }
sub is_assign        { return shift->is('assign');        }
sub is_bit_assign    { return shift->is('bit-assign');    }
sub is_bof           { return shift->is('bof');           }
sub is_close_brace   { return shift->is('close-brace');   }
sub is_close_bracket { return shift->is('close-bracket'); }
sub is_close_paren   { return shift->is('close-paren');   }
sub is_colon         { return shift->is('colon');         }
sub is_const         { return shift->is('const');         }
sub is_continue      { return shift->is('continue');      }
sub is_else          { return shift->is('else');          }
sub is_eof           { return shift->is('eof');           }
sub is_exfix_arith   { return shift->is('exfix-arith');   }
sub is_goto          { return shift->is('goto');          }
sub is_ident         { return shift->is('ident');         }
sub is_if            { return shift->is('if');            }
sub is_infix_arith   { return shift->is('infix-arith');   }
sub is_infix_bit     { return shift->is('infix-bit');     }
sub is_infix_rel     { return shift->is('infix-rel');     }
sub is_label         { return shift->is('label');         }
sub is_last          { return shift->is('last');          }
sub is_literal       { return shift->is('literal');       }
sub is_module        { return shift->is('module');        }
sub is_next          { return shift->is('next');          }
sub is_open_brace    { return shift->is('open-brace');    }
sub is_open_bracket  { return shift->is('open-bracket');  }
sub is_open_paren    { return shift->is('open-paren');    }
sub is_redo          { return shift->is('redo');          }
sub is_return        { return shift->is('return');        }
sub is_sub           { return shift->is('sub');           }
sub is_unless        { return shift->is('unless');        }
sub is_until         { return shift->is('until');         }
sub is_var           { return shift->is('var');           }
sub is_while         { return shift->is('while');         }

sub is_loop_control  { return shift->is('next', 'last', 'redo'); }
sub is_value         { return shift->is('ident', 'literal');     }

1;

