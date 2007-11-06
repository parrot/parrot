# $Id$
# Copyright (C) 2001-2007, The Perl Foundation.

package Scheme::Tokenizer;

# pragmata
use strict;
use warnings;
use 5.008;

our $VERSION   = '0.01';

use Data::Dumper;

sub new {
    my $class     = shift;
    my $target_fn = shift;

    my $target;
    {
         open my $target_fh, '<', $target_fn or die "Can't open $target_fn:\n$!";
         local $/;   # Set input to "slurp" mode.
         $target = <$target_fh>;
         close $target_fh or die "Can't close $target_fn:\n$!";
    }

    return 
        bless sub {
         TOKEN:
         {
             return [ 'COMPLEX',     $1 ] if $target =~ m/\G ([-+]? \d+ [-+] \d+ i  )       /gcx;
             return [ 'REAL',        $1 ] if $target =~ m/\G [-+]?           # optional sign
                                                             ((\d+\.\d*) | (\.d+))
                                                             ([eE][-+]?\d+)? # optional exponent
                                                                                            /gcx;
             return [ 'INTEGER',     $1 ] if $target =~ m/\G ([-+]? \d+)                    /gcx;
             return [ 'STRING',      $1 ] if $target =~ m/\G (".*?") # XXX: escaped quotes  /gcx;
             return [ 'PAREN_OPEN',  $1 ] if $target =~ m/\G (\()                           /gcx;
             return [ 'PAREN_CLOSE', $1 ] if $target =~ m/\G (\))                           /gcx;
             return [ 'IDENT',       $1 ] if $target =~ m/\G ([a-z] [-a-zA-Z0-9]* [!?]?)    /gcx;
             return [ 'TRUE',        $1 ] if $target =~ m/\G (\#t)                          /gcx;
             return [ 'FALSE',       $1 ] if $target =~ m/\G (\#f)                          /gcx;
             return [ 'RELOP',       $1 ] if $target =~ m/\G (<= | >= | = | < | > )         /gcx;
             return [ 'WHATEVER',    $1 ] if $target =~ m/\G (,@)                           /gcx;
             redo TOKEN                   if $target =~ m/\G \s+                            /gcx;
             redo TOKEN                   if $target =~ m/\G ; .*                           /gcx;
             return [ 'UNKNOWN',     $1 ] if $target =~ m/\G (.)                            /gcx;
             return;
         }
    }, $class;
}

1;

__END__

=head1 NAME

Scheme::Tokenizer - The Scheme tokenizer

=head1 SYNOPSIS

  use Scheme:Tokenizer;

  my $tokenizer = Scheme::Tokenizer->new($file_name);

=head1 DESCRIPTION

The tokenizer takes a file and splits it into tokens.

=head1 AUTHOR

Jeffrey Goff, drforr@hargray.com

=head1 SEE ALSO

L<Scheme>, L<Scheme::Parser>, L<Scheme::Generator>

=cut
