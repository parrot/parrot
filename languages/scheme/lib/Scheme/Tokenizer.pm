# $Id$
# Copyright (C) 2001-2007, The Perl Foundation.

package Scheme::Tokenizer;

# pragmata
use strict;
use warnings;
use 5.008;

our $VERSION   = '0.01';

use Data::Dumper;

sub tokenize_hop {
    my $file = shift;

    # read file and throw away comments
    # XXX probably broken WRT to strings with embedded comments
    my $target;
    {
        open my $source, '<', $file;
        while (<$source>) {
            next if m/ \A \s* ; /xms;
            s/ ; .* \z //xms;
            $target .= $_;
        }
        close $source;
    }

    my $lexer = sub {
         TOKEN:
         {
             return [ 'INTEGER', $1 ] if $target =~ m/\G (\d+)            /gcx;
             redo TOKEN               if $target =~ m/\G \s+              /gcx;
             return [ 'UNKNOWN', $1 ] if $target =~ m/\G (.)              /gcx;
             return;
         }
    };

    my @tokens;
    while ( my $token = $lexer->() ) {
        push @tokens, $token->[1];
    }

    return \@tokens;
}


sub tokenize_char_by_char {
    my $file = shift;

    # read file and throw away comments
    # XXX probably broken WRT to strings with embedded comments
    my $text;
    {
        open my $source, '<', $file;
        while (<$source>) {
            next if m/ \A \s* ; /xms;
            s/ ; .* \z //xms;
            $text .= $_;
        }
        close $source;
    }

    my @tokens;
    {
        my $token = q{};
        for my $ch ( split m//, $text ) {
            if (    $token =~ m/ \A " /xms )                             # in string
            {
              if (    $ch ne q{"}                                        # not a string delimiter
                   || $token =~ m/ \\ \z/xms                             # or an escaped delimiter
                 )
              {
                $token .= $ch;
              }
              else                                                       # end of string
              {
                $token .= $ch;
                push @tokens, $token;
                $token = q{};
              }
            }
            elsif (    $ch eq '('
                    || $ch eq ')'
                  )
            {
                push @tokens, $token;
                $token = $ch;
            }
            elsif (    $ch eq '-'
                    && (    $token =~ m/ \A [a-z]/xms                    # Dashes can be in an ident
                         || $token =~ m/ \A [-] \d+ (\.\d+)? [eE] /xms   # Dashes can be a negative exponent
                       )
                  )
            {
                $token .= $ch;
            }
            elsif (    (    $ch eq '?'                                   # Question mark
                         || $ch eq '!'                                   # or exclamaition mark
                       )
                    && $token =~ m/ \A [a-z]/xms                         # can follow an identifier
                  )
            {                         
                $token .= $ch;
            }
            elsif (    (    $ch eq 't'                                   # t
                         || $ch eq 'f'                                   # or f
                       )
                    && $token eq '#'                                     # can be part of '#t' or '#f'
                  )
            {                         
                $token .= $ch;
            }
            elsif (    $ch eq '='
                    && $token =~ m/ \A [<>] /xms
                  )
            {                                # Equal sign can follow '<','>'
                $token .= $ch;
            }
            elsif (    $ch eq '.'
                    && $token =~ m/\A [+-]?\d+ \z/xms
                  )
            {                                       # a decimal point can follow digits
                $token .= $ch;
            }
            elsif (    $ch =~ m/ \d /xms
                    && (    $token =~ m/ \A [-+.] /xms     # digits can follow a minus, plus or decimal point
                         || $token =~ m/ \A \d   /xms      # digits can follow another digit
                       )
                  )
            {                                # Digits can follow other digits
                $token .= $ch;
            }
            elsif (    $ch =~ m/ [a-zA-Z] /xms
                    && $token =~ m/ \A \w /xms
                  )
            {                                # Letters can follow other letters
                $token .= $ch;
            }
            elsif (    $ch =~ m/ \s /xms
                    && $token =~ m/ \A \s /xms
                  )
            {                                # White can follow white
                $token .= $ch;
            }
            elsif (    $ch =~ m/ @ /xms
                    && $token eq q{,}
                  )
            {                                # token ,@
                $token .= $ch;
            }
            else
            {
                push @tokens, $token;
                $token = $ch;
            }
        }
    }

    return [ grep { m/ \S /xms } @tokens ];
}

1;

__END__

=head1 NAME

Scheme::Tokenizer - The Scheme tokenizer

=head1 SYNOPSIS

  use Scheme:Tokenizer;

  my $tokens = Scheme::Tokenizer->new($file_name)->tokenize();

=head1 DESCRIPTION

The tokenizer takes a file and splits it into tokens.

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

L<Scheme>, L<Scheme::Parser>, L<Scheme::Generator>

=cut
