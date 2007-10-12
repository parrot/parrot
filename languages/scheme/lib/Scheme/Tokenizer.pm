# $Id$
# Copyright (C) 2001-2007, The Perl Foundation.

package Scheme::Tokenizer;

# pragmata
use strict;
use warnings;
use 5.008;

our $VERSION   = '0.01';

use Data::Dumper;

sub tokenize {
    my $file = shift;

    # read file and throw away comments
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
            if (    $ch eq '('
                 || $ch eq ')'
               )
            {
                push @tokens, $token;
                $token = $ch;
            }
            elsif (    $ch eq '-'
                    && (    $token =~ m/^[a-z]/ # Dashes can be in an ident
                         || $token =~ m/^[-]\d+(\.\d+)?[eE]/
                       )
                  )
            {                                # Dashes could be a neg. expt
                $token .= $ch;
            }
            elsif (    $ch eq '?'
                    && $token =~ /^[a-z]/
                  )
            {                                # Question marks can follow an identifier
                $token .= $ch;
            }
            elsif (    $ch eq '!'
                    && $token =~ m/^[a-z]/
                  )
            {                                # Exclamation marks can follow an identifier
                $token .= $ch;
            }
            elsif (    $ch eq '='
                    && $token =~ m/^[<>]/
                  )
            {                                # Equal sign can follow '<','>'
                $token .= $ch;
            }
            elsif (    $ch eq '.'
                    && $token =~ m/^\d+$/
                  )
            {                                # Equal sign can follow '<','>'
                $token .= $ch;
            }
            elsif (    $ch =~ m/\d/
                    && (    $token =~ m/^[-]/       # Digits can follow a dash
                         || $token =~ m/^\./        # Digits can follow a decimal point
                         || $token =~ m/^\d/
                       )
                  )
            {                                # Digits can follow other digits
                $token .= $ch;
            }
            elsif (    $ch =~ m/[a-zA-Z]/
                    && $token =~ m/^\w/
                  )
            {                                # Letters can follow other letters
                $token .= $ch;
            }
            elsif (    $ch =~ m/\s/
                    && $token =~ m/^\s/
                  )
            {                                # White can follow white
                $token .= $ch;
            }
            elsif (    $ch =~ m/@/
                    && $token =~ m/^,$/
                  )
            {                                # token ,@
                $token .= $ch;
            }
            else {
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

  my @code = Scheme::Tokenizer->new($file_name)->tokenize();

=head1 DESCRIPTION

The tokenizer takes a file and splits it into tokens.

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

L<Scheme>, L<Scheme::Parser>, L<Scheme::Generator>

=cut
